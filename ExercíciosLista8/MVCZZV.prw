#INCLUDE'TOTVS.CH'
#INCLUDE'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCZZV
(Cadastro da Frota de Veículos da Auto Escola)
    @type  Function
    @author Daniele Travessa
    @since 27/03/2023
    @version 1.0
    /*/

User Function MVCZZV()


    Local cAlias := "ZZV"
    Local cTitle := "Cadastro de Veículos"
    Local oBrowse := FwMBrowse():New()
    
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()    
    oBrowse:DisableReport()
    oBrowse:Activate()

Return

Static Function MenuDef()

    Local aRotina := {}

    ADD OPTION aRotina Title 'Incluir' ACTION 'VIEWDEF.MVCZZV' OPERATION 3 ACCESS 0
    ADD OPTION aRotina Title 'Alterar' ACTION 'VIEWDEF.MVCZZV' OPERATION 4 ACCESS 0
    ADD OPTION aRotina Title 'Excluir' ACTION 'VIEWDEF.MVCZZV' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()

    Local oStruZZV := FWFormStruct(1,'ZZV')
    Local oModel := MPFormModel():New('MVCZZVM') 
    Local aComboValues := {'Manual','Automático'}

    oModel:AddFields('ZZVMASTER',/*cOwner*/,oStruZZV)   
    oModel:SetDescription('Cadastro de Veículos')
    oModel:GetModel('ZZVMASTER'):SetDescription('Dados do Veículo')
    oModel:SetPrimaryKey({'ZZV_COD'})
    oStruZZV:SetProperty('ZZV_CAMBIO', MODEL_FIELD_VALUES, aComboValues)
    oStruZZV:SetProperty('ZZV_COD', MODEL_FIELD_INIT, {|| GetSxeNum('ZZV','ZZV_COD')})

Return oModel

Static Function ViewDef()

    Local oModel := FwLoadModel('MVCZZV')
    Local oStruZZV := FWFormStruct(2,'ZZV')
    Local oView:=FwFormView():New()
    Local aComboValues := {'Manual','Automático'}

    oView:SetModel(oModel)
    oView:AddField('View_ZZV', oStruZZV, 'ZZVMASTER')
    oView:CreateHorizontalBox('Tela', 100)
    oView:SetOwnerView('View_ZZV', 'Tela')

    //oStruZZV:RemoveField('ZZV_COR')
    oStruZZV:SetProperty('ZZV_CAMBIO', MVC_VIEW_COMBOBOX, aComboValues)

Return oView
