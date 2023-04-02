#INCLUDE'TOTVS.CH'
#INCLUDE'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCZEA
 (Rotina para Cadastro de Alunos do Projeto de Auto-Escola (Tabela MVC Modelo1))
    @type  Function
    @author Daniele Travessa
    @since 27/03/2023
    @version 1.0
    /*/

User Function MVCZEA()

    Local cAlias := 'ZEA'
    Local cTitle := 'Cadastro de Alunos'
    Local cCampo := 'ZEA_CHECK'
    Local oMark := FwMarkBrowse():New()
    Private cCodInsAtual := ""

    oMark:SetAlias(cAlias)
    oMark:SetSemaphore(.T.)
    oMark:SetDescription(cTitle)
    oMark:SetFieldMark(cCampo)
    oMark:DisableDetails()
    oMark:DisableReport()
    oMark:Activate()

Return

Static Function MenuDef()

    Local aRotina := {}

    ADD OPTION aRotina Title 'Incluir'  ACTION 'VIEWDEF.MVCZEA' OPERATION 3 ACCESS 0
    ADD OPTION aRotina Title 'Alterar'  ACTION 'VIEWDEF.MVCZEA' OPERATION 4 ACCESS 0
    ADD OPTION aRotina Title 'Excluir'  ACTION 'VIEWDEF.MVCZEA' OPERATION 5 ACCESS 0
    ADD OPTION aRotina Title 'ExcMarca' ACTION 'U_ExcMarka'   OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()

    Local oStruZEA := FWFormStruct(1,'ZEA')
    Local oModel := MPFormModel():New('MVCZEAM',/**/,/*bModelPos*/)
    Local aComboValues := {'1=SIM','2=NÃO'}
    /*Local bFieldPos    := {|oFld| ValField(oFld)} 
    Local bModelPos    := {|oModel|ValExc(oModel)}
    Local bModelPos := { |oModel| VldInst(oModel)}*/


    Local aGatilho  := FwStruTrigger('ZEA_INSTRU', 'ZEA_NOMINS','ZEI->ZEI_NOME', .T., 'ZEI', 1, 'xFilial("ZEI")+ALLTRIM(M->ZEA_INSTRU)')        
    oStruZEA:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])
    
    oModel:AddFields('ZEAMASTER',/*cOwner*/,oStruZEA, /*bPre*/, /*bFieldPos*/, /*bLoad*/)   
    oModel:SetDescription('Cadastro de Alunos')
    oModel:GetModel('ZEAMASTER'):SetDescription('Dados do Aluno')
    oModel:SetPrimaryKey({'ZEA_COD'})
    
    oStruZEA:SetProperty('ZEA_EMAULA', MODEL_FIELD_VALUES, aComboValues)
    oStruZEA:SetProperty('ZEA_CODIGO', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZEA", "ZEA_CODIGO")')) 

    oStruZEA:SetProperty('ZEA_INSTRU', MODEL_FIELD_VALID, { |oModel| ValInst(oModel)})// Bloco de validação para código do instrutor.
    oStruZEA:SetProperty('ZEA_CPF',    MODEL_FIELD_VALID, { |oModel| ValCPF(oModel)})// Bloco de validação para o CPF do aluno cadastrado.
    oStruZEA:SetProperty('ZEA_EMAULA', MODEL_FIELD_VALID, { |oModel| ValAula(oModel)})// Código de validação do campo aula.

Return oModel

Static Function ViewDef()

    Local oModel := FwLoadModel('MVCZEA')
    Local oStruZEA := FWFormStruct(2,'ZEA')
    Local oView:=FwFormView():New()
    Local aComboValues := {'1=SIM','2=NÃO'}

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZEA', oStruZEA, 'ZEAMASTER')
    oView:CreateHorizontalBox('Tela', 100)
    oView:SetOwnerView('VIEW_ZEA', 'Tela')
    oView:EnableTitleView("VIEW_ZEA", "Cadastro de Alunos")
    //oView:SetFieldAction('ZEA_AULAS', {|oView| VldAula(oView)})

    //oVIew:SetAfterViewActivate({|oView| ViewActive(oView)})
    //oStruZEA:RemoveField('ZZV_COR')
    oStruZEA:SetProperty('ZEA_EMAULA', MVC_VIEW_COMBOBOX, aComboValues)

Return oView

User Function ExcMarka()
    Local aArea := GetArea()
    Local nCt := 0
   //Local lRet := .T.

    DbSelectArea('ZEA')

        ZEA->(dbGoTop())
        While !ZEA->(EOF())
            If oMark:IsMark() .and. (ZEA->ZEA_QDEALU < 1)   
                nCt++
                RecLock('ZEI', .F.)
                    ZEA->(DbDelete())
                ZEI->(MSUnlock())
            EndIf 
            ZEA->(dbSkip())
        EndDo         
        MsgInfo('Foram Marcados'+AllTrim(Str(nCt))+'registros.')
        MsgYesNo('Confirma a exclusão dos cursos selecionados?')
       
    oMark:Refresh(.T.)
    RestArea(aArea)
Return 

Static Function ValInst(oModel)

    Local lTudoOk    := .T.
    Local nOperation := oModel:GetOperation()
    Local cInstru    := Alltrim(oModel:GetValue('ZEAMASTER','ZEA_INSTRU'))     
    Local cEmAula    := Alltrim(oModel:GetValue('ZEAMASTER','ZEA_EMAULA'))                
    Local nQdeAluno := oModel:GetValue('ZEI->ZEI_QDEALU')
    
        DbSelectArea('ZEI')
        ZEI->(dbGoTop())
            While !ZEI->(EOF())                               
                IF ZEI_COD == cInstru
                    If (nOperation == MODEL_OPERATION_INSERT) .and. (nQdeAluno == 5)
                    Help(NIL, NIL, 'Instrutor escolhido sem Agenda', NIL, 'O Instrutor já possui o limite de aluno', 1, 0, NIL,;
             NIL, NIL, NIL, NIL, {'Escolha outro <b>Instrutor</b>!'})
        lTudoOk := .F.
                    Else
                    nQdeAluno++
                    RecLock('ZEI', .F.)
                    ZEI->ZEI_QDEALU := nQdeAluno                        
                    ZEI->(MSUnlock())
                    EndIf
                ElseIf (nOperation == MODEL_OPERATION_DELETE)
                    If cEmAula == '1'
                        lOk := .f.
					    Help(NIL,NIL, 'Aluno possui aulas ativas', NIL, 'Alunos com matriculas ativas em aulas não podem ser excluídos' ,1,0,NIL,NIL,NIL,NIL,NIL, {'Faça outra escolha!'})
                    ElseIf nQdeAluno > 0
                        nQdeAluno--
                        RecLock('ZEI',.F.)
                        ZEI->ZEI_QDEALU := nQdeAluno
                        ZEI->(MsUnlock)
                    ENDIF                
                ENDIF     
            ZEI->(dbSkip())
            EndDo 

    If (nOperation == MODEL_OPERATION_INSERT) .or. (nOperation == MODEL_OPERATION_UPDATE)
       If (cQdeAluno < 5)        
       // cEmAula == "SIM"
        lTudoOk := .T.
       ElseIF Empty(ZEA_INSTRU)
     //   cEmAula == "NAO"
        lTudoOk := .F.
        Help(NIL, NIL, 'Operação não permitida', NIL, 'O campo Instrutor está vazio', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Preencha o <b>Campo do Instrutor</b> corretamente!'})
        EndIF
    EndIF
RETURN

Static Function ValAula(oModel)
    
    Local lRet := .T.
    Local cInstrutor := Alltrim(oModel:GetValue('ZEAMASTER','ZEA_INSTRU'))
    Local cAulas := Alltrim(oModel:GetValue('ZEAMASTER','ZEA_EMAULA'))
    /*DbSelectArea('ZEI')
    DbSetOrder(1)*/
    If cAulas == "SIM"
        if Empty(cInstrutor)
         lRet := .F.
            oModel:SetValue('ZEA_EMAULA', "NÃO")
            help(NIL,NIL, 'Instrutor não selecionado', NIL, 'Instrutor em branco' ,1,0,NIL,NIL,NIL,NIL,NIL, {'Selecione corretamente o instrutor e retorne a este campo'})
            //oModel:LoadValue("ZEA_AULA", Space(TamSX3("ZEA_AULA")[1]))
        Endif 
    Endif 
Return lRet

Static Function ValExc(oModel)
    local lRet  := .T.
    local nOper := oModel:GetOperation()
    if nOper == MODEL_OPERATION_DELETE .and. ZEA_AULA == "SIM"
        lRet := .F.
        Help(NIL, NIL, "Atenção!!", NIL, "Aluno em aula, não pode ser excluído o registro.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Marque o campo <b>AULA</b> como 'Não' e tente novamente."})
    endif
Return lRet

Static Function ValCPF(oModel)
    
    Local cCPF := Alltrim(oModel:GetValue("ZEA_CPF"))
    Local aCPF := {}
    Local nSoma1 := 0
    Local lRet := .T.
    Local nResto1 := 0
    Local nSoma2 := 0
    Local nResto2 := 0
    Local nCount := 0
        
        For nCount := 1 to 11
            aAdd(aCPF, val(substr(cCPF, nCount, 1)))
        Next
        If (aCPF[1] == aCPF[2]) .and. (aCPF[2] == aCPF[3]) .and. (aCPF[3] == aCPF[4]) .and. (aCPF[4] == aCPF[5]);
        .and. (aCPF[5] == aCPF[6]) .and. (aCPF[6] == aCPF[7]) .and. (aCPF[7] == aCPF[8]) .and. (aCPF[8] == aCPF[9]);
        .and. (aCPF[9] == aCPF[10]) .and. (aCPF[10] == aCPF[11])
        Help(NIL, NIL, "Atenção!!", NIL, "CPF inválido.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Verifique as informações e tente novamente."})
        lRet := .F.
        oModel:LoadValue("ZEA_CPF", Space(TamSX3("ZEA_CPF")[1]))
        Else    
        nSoma1 := (aCPF[1] * 10) + (aCPF[2] * 9) + (aCPF[3] * 8) + (aCPF[4] * 7);
        + (aCPF[5] * 6) + (aCPF[6] * 5) + (aCPF[7] * 4) + (aCPF[8] * 3) + (aCPF[9] * 2) 
        nResto1 := (nSoma1 * 10) % 11
            If nResto1 = 10
                nResto1 := 0
            Endif
        nSoma2 := (aCPF[1] * 11) + (aCPF[2] * 10) + (aCPF[3] * 9) + (aCPF[4] * 8);
        + (aCPF[5] * 7) + (aCPF[6] * 6) + (aCPF[7] * 5) + (aCPF[8] * 4) + (aCPF[9] * 3) + (aCPF[10] * 2)
        
        nResto2 := (nSoma2 * 10) % 11
            If nResto2 = 10
               nResto2 := 0
            Endif
            If !((nResto1 = aCPF[10]) .and. (nResto2 = aCPF[11]))
                Help(NIL, NIL, "Atenção!!", NIL, "CPF inválido.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Verifique as informações e tente novamente."})
                lRet := .F.
                oModel:LoadValue("ZEA_CPF", Space(TamSX3("ZEA_CPF")[1]))
            Endif
        EndIf
Return lRet
