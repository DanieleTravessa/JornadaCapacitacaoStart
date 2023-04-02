#INCLUDE'TOTVS.CH'
#INCLUDE'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCZEC
    (Cadastro de Siglas de CNH)
    @type  Function
    @author Daniele Travessa
    @since 27/03/2023
    @version 1.0
    /*/
User Function MVCZEC()

    Local cAlias := 'ZEC'
    Local cTitle := 'Categorias CNH'
    Local oBrowse := FwMBrowse():New()
    
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()    
    oBrowse:DisableReport()
    oBrowse:Activate()

Return

Static Function MenuDef()

    Local aRotina := {}
    ADD OPTION aRotina Title 'Incluir' ACTION 'VIEWDEF.MVCZEC' OPERATION 3 ACCESS 0
    ADD OPTION aRotina Title 'Alterar' ACTION 'VIEWDEF.MVCZEC' OPERATION 4 ACCESS 0
    ADD OPTION aRotina Title 'Excluir' ACTION 'VIEWDEF.MVCZEC' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()

    Local bModelPos := { |oModel| ValSigla(oModel)}
    Local oStruZEC := FWFormStruct(1,'ZEC')
    Local oModel   := MPFormModel():New('MVCZECM',/*bModelPre*/, bModelPos)
    Local aGatilho := FwStruTrigger('ZEC_CODVEC','ZEC_NOMEVC','ZZV->ZZV_NOME',.T.,'ZZV',1,'xFilial("ZEC")+Alltrim(M->ZEC_CODIGO)')

    oStruZEC:AddTrigger(aGatilho[1],aGatilho[2],aGatilho[3],aGatilho[4])
     
    //oStruZEC:SetProperty("ZEC_CODIGO", MODEL_FIELD_INIT, {|| GetSxeNum('ZEC','ZEC_CODIGO')})
    oStruZEC:SetProperty('ZEC_CODIGO',MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GETSXENUM("ZEC","ZEC_CODIGO")'))

    oModel:AddFields('ZECMASTER',/*cOwner*/,oStruZEC) /*Adiciona ao modelo um componente de formulário*/
    oModel:SetDescription('Categorias CNH') /*Adiciona a descrição do Modelo de Dados*/    
    oModel:GetModel('ZECMASTER'):SetDescription('Categorias CNH')
    oModel:SetPrimaryKey({'ZEC_CODIGO'})
 
Return oModel

Static Function ViewDef()
    
    Local oModel:=FwLoadModel('MVCZEC')
    Local oStruZEC:=FWFormStruct(2,'ZEC')
    Local oView:=FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZEC', oStruZEC,'ZECMASTER')
    oView:CreateHorizontalBox('Tela', 100)
    oView:SetOwnerView('VIEW_ZEC','Tela')
    oView:EnableTitleView("VIEW_ZEC",  "Cadastro de CNH")
        
Return oView

Static Function ValSigla(oModel)

    Local lRet := .T.
    Local nOper:= oModel:GetOperation()
    Local cSigla := Alltrim(oModel:GetValue('ZECMASTER','ZEC_SIGLA'))
    
    If nOper == 3
        If len(cSigla) == 2
            lRet := .F.
            Help(NIL, NIL, "Atenção!", NIL, "Insira apenas 1 ou 3 caracteres.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Corrija as informações de cadastro e tente novamente."})
        EndIf
    EndIf

Return lRet
