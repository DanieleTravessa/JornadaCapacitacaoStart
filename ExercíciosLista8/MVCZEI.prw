#INCLUDE'TOTVS.CH'
#INCLUDE'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCZEI
    (Cadastro de Instrutores da Auto Escola)
    @type Function
    @author Daniele Travessa
    @since 27/03/2023
    @version 1.0
    /*/

User Function MVCZEI()

    Local cAlias := 'ZEI'
    Local cTitle := 'Cadastro de Instrutor'
    Local cCampo := 'ZEI_CHECK'
    Local oMark := FwMarkBrowse():New()

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

    ADD OPTION aRotina Title 'Incluir'  ACTION 'VIEWDEF.MVCZEI' OPERATION 3 ACCESS 0
    ADD OPTION aRotina Title 'Alterar'  ACTION 'VIEWDEF.MVCZEI' OPERATION 4 ACCESS 0
    ADD OPTION aRotina Title 'Excluir'  ACTION 'VIEWDEF.MVCZEI' OPERATION 5 ACCESS 0
    ADD OPTION aRotina Title 'ExcMarca' ACTION 'U_ExcluiMark'   OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()

    Local bValidPos := {|oModel| ValField(oModel)}    
    Local oStruZEI  := FWFormStruct(1,'ZEI')
    Local oModel    := MPFormModel():New('MVCZEIM',,bValidPos)//Modelo de dados que será construído
    Local aComboValues := {'Ensino Fundamental','Ensino Médio','Ensino Superior'}
    
    oModel:AddFields('ZEIMASTER',/*cOwner*/,oStruZEI, /*bPre*/, /*bFieldPos*/, /*bLoad*/)   
    oModel:SetDescription('Cadastro de Instrutor')
    oModel:GetModel('ZEIMASTER'):SetDescription('Dados do Instrutor')
    oModel:SetPrimaryKey({'ZEI_COD'})
    oStruZEI:SetProperty('ZEI_ESCOLA', MODEL_FIELD_VALUES, aComboValues)
    oStruZEI:SetProperty('ZEI_COD', MODEL_FIELD_INIT, {|| GetSxeNum('ZEI','ZEI_COD')})

Return oModel

Static Function ViewDef()

    Local oModel := FwLoadModel('MVCZEI')
    Local oStruZEI := FWFormStruct(2,'ZEI')
    Local oView:=FwFormView():New()
    Local aComboValues := {'Ensino Fundamental','Ensino Médio','Ensino Superior'}

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZEI', oStruZEI, 'ZEIMASTER')
    oView:CreateHorizontalBox('Tela', 100)
    oView:SetOwnerView('VIEW_ZEI', 'Tela')
    oView:EnableTitleView("VIEW_ZEI",  "Cadastro de Instrutores")

    oStruZEI:SetProperty('ZEI_ESCOLA', MVC_VIEW_COMBOBOX, aComboValues)


Return oView

Static Function ValField(oModel)

    Local nOperation := oModel:GetOperation()
    Local lTudoOk    := .T.
    Local dDtNasc    := oModel:GetValue('ZEIMASTER','ZEI_DTNASC')
    Local dDt1Hab    := oModel:GetValue('ZEIMASTER','ZEI_DT1HAB')
    Local cEscolar   := AllTrim(oModel:GetValue('ZEIMASTER','ZEI_ESCOLA')) 
    Local cQtdeAluno := AllTrim(oModel:GetValue('ZEIMASTER','ZEI_QDEALU'))
    Local nIdade
    Local nHabilita
    Local dData := Date()
        
    nIdade := DateDiffYear(dDtNasc,dData)
    nHabilita := DateDiffYear(dDt1Hab,dData)
    cQtdeAluno := Val(cQtdeAluno)

    If (nOperation == MODEL_OPERATION_INSERT) .and. (nIdade < 21) .or. (nHabilita < 2) .or. cEscolar == 'Ensino Fundamental'
    Help(NIL, NIL, 'Operação não permitida', NIL, 'Fique atento aos requisitos de cadastro do instrutor!', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Revise os requisitos e tente novamente!'})
    lTudoOk := .F.
    
    ElseIf (nOperation == MODEL_OPERATION_DELETE) .and. (cQtdeAluno > 0)
       Help(NIL, NIL, 'Operação não permitida', NIL, 'O instrutor tem alunos', 1, 0, NIL,;
             NIL, NIL, NIL, NIL, {'Desvincule os alunos do <b>Instrutor</b> selecionado!'})
        lTudoOk := .F.
    
    ElseIf (nOperation == MODEL_OPERATION_DELETE) .and. (cQtdeAluno < 1)
        DbSelectArea('ZEA')
        ZEA->(dbGoTop())
            While !ZEA->(EOF())                               
               If (oMark:IsMark())
                RecLock('ZEI', .F.)
                    ZEI->(DbDelete())
                    nCt++
                    cQtdeAluno -= nCt    
                ZEI->(MSUnlock())
            EndIf 
            ZEI->(dbSkip())
            EndDo  
        RestArea(aArea)              
    Endif
   
Return lTudoOk

User Function ExcluiMark()
    Local aArea := GetArea()
    Local nCt := 0

    DbSelectArea('ZEI')
        ZEI->(dbGoTop())
        While !ZEI->(EOF())
            If oMark:IsMark()
                nCt++
            ElseIf oMark:IsMark() .and. ((ZEI->ZEI_QDEALU) < 1)
                RecLock("ZEI", .F.)
                    ZEI->(DbDelete())
                ZEI->(MsUnlock())
            EndIf 
            ZEI->(dbSkip())
        EndDo 
        
        MsgInfo('Foram Marcados'+AllTrim(Str(nCt))+'registros.')
        MsgYesNo('Confirma a exclusão dos cursos selecionados?')
        
        oMark:Refresh(.T.)
    RestArea(aArea)
Return
