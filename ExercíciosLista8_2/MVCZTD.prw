#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCZTD
    Função MVC de controle de uma To Do List
    @type  Function
    @author Daniele Travessa
    @since 30/03/2023
    /*/
User Function MVCZTD()
    local cAlias    := 'ZTT'
    local cTitle    := 'Lista de Tarefas'
    local oBrowse   := FwmBrowse():New()
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:AddLegend('ZTT_STATUS == "1"', 'GREEN',   'Tarefa realizada!')
    oBrowse:AddLegend('ZTT_STATUS == "2"', 'ORANGE',  'Tarefa em desenvolvimento')
    oBrowse:AddLegend('ZTT_STATUS == "3"', 'RED',    'Tarefa Em Espera')
   // oBrowse:SetFilterDefault("ZTT_STATUS == '1'")
    oBrowse:Activate()
Return 

Static Function MenuDef()
    local aRotina := {}
    ADD OPTION aRotina TITLE "Visualizar"       ACTION 'VIEWDEF.MVCZTD' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir Tarefa"   ACTION 'VIEWDEF.MVCZTD' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Manipular Tarefa" ACTION 'VIEWDEF.MVCZTD' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir Tarefa"   ACTION 'VIEWDEF.MVCZTD' OPERATION 5 ACCESS 0
Return aRotina

Static Function ModelDef()

    Local oModel    := MPFormModel():New("MVCZTDM")
    local oStruZTT  := FWFormStruct(1, "ZTT")
    local oStruZTP  := FWFormStruct(1, "ZTP")
       
    //oStruZTT:SetProperty('ZTT_CODIGO', MODEL_FIELD_INIT, {|| GetSxeNum('ZTT','ZTT_CODIGO')})
    oModel:AddFields("ZTTMASTER",,oStruZTT)
    oModel:SetDescription("LISTA DE TAREFAS")
    oModel:AddGrid("ZTPDETAIL", "ZTTMASTER", oStruZTP, /*bPre*/,/* bLinePos */, /* bGridPre */, /*bStatus*/)
    oModel:GetModel("ZTPDETAIL"):SetDescription("Passos a Cumprir")
    oModel:SetRelation("ZTPDETAIL", {{"ZTP_FILIAL", "FwxFilial('ZTP')"}, {"ZTP_PASSO", "ZTT_CODIGO"}}, ZTP->(IndexKey(1)))
    oModel:SetPrimaryKey({"ZTT_CODIGO","ZTP_PASSO"})
Return oModel

Static Function ViewDef()
    local oModel    := FwLoadModel('MVCZTD')
    local oStruZTT  := FwFormStruct(2, "ZTT")
    local oStruZTP  := FwFormStruct(2, "ZTP")
    local oView     := FwFormView():New()
    oView:SetModel(oModel)
    oView:AddField("VIEW_ZTT",  oStruZTT,  "ZTTMASTER")
    oView:AddGrid("VIEW_ZTP", oStruZTP, "ZTPDETAIL")
    oView:CreateHorizontalBox("TAREFA", 25)
    oView:CreateHorizontalBox("PASSOS", 75)
    oView:SetOwnerView("VIEW_ZTT",  "TAREFA")
    oView:SetOwnerView("VIEW_ZTP",  "PASSOS")
    oView:EnableTitleView("VIEW_ZTT",  "Lista de Tarefas")
    oView:EnableTitleView("VIEW_ZTP",  "Passos das tarefa")
    
Return oView
