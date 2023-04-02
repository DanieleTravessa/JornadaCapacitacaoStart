#INCLUDE'TOTVS.CH'
#INCLUDE'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCZCC
    Rotina MVC para cadastro de blocos e apartamentos
    @type  Function
    @author Daniele Travessa
    @since 30/03/2023
/*/
User Function MVCZCC()
    Local cAlias  := 'ZCB'
	Local cTitle  := 'Blocos do Condomínio'
	Local oBrowse := FwMBrowse():New()

	oBrowse:SetAlias(cAlias)
	oBrowse:SetDescription(cTitle)
	oBrowse:DisableDetails()
	oBrowse:DisableReport()
    //ativando o browse
	oBrowse:Activate()
Return 

Static Function MenuDef()

Return FwMVCMenu('MVCZCC')

Static Function ModelDef()
	Local oModel := MPFormModel():New('MVCZCCM')
	Local oStZCCabec := FWFormStruct(1,'ZCB')
    Local oStZCCgrid := FWFormStruct(1,'ZCA')
   
    oModel:AddFields('ZCCABEC',/**/,oStZCCabec)
    oModel:AddGrid('ZCCGRID','ZCCABEC',oStZCCgrid)

    oModel:SetRelation('ZCCGRID',{{'ZCA_Filial','xFilial("ZCA")'},{'ZCA_BLOCO','ZCB_BLOCO'}},ZCA->(INDEXKEY(1))) 
   
    oModel:SetDescription("Controle do Condomínio")
    oModel:GetModel("ZCCABEC"):SetDescription("Blocos e Apartamentos")
    oModel:GetModel("ZCCGRID"):SetDescription("Detalhes dos Apartamentos")
    oModel:SetPrimaryKey({'ZCA_BLOCO','ZCB_BLOCO'})

Return oModel

Static Function ViewDef()
    Local oModel     := FWLoadModel("MVCZCC")
    Local oStZZCabec := FWFormStruct(2, 'ZCB')
    Local oStZZCGrid := FWFormStruct(2, 'ZCA')
    Local oView      := Nil
        
    oView := FWFormView():New()
    oView:SetModel(oModel)
    oView:AddField("VIEW_CAB", oStZZCabec, "ZCCABEC")
    oView:AddGrid('VIEW_GRID',oStZZCgrid,'ZCCGRID')
      
    
    oView:CreateHorizontalBox('CABEC',30)
    oView:CreateHorizontalBox('GRID',70)
    oView:SetOwnerView('VIEW_CAB','CABEC')
    oView:SetOwnerView('VIEW_GRID','GRID')
    oView:EnableTitleView('VIEW_CAB',' Blocos ')
    oView:EnableTitleView('VIEW_GRID',' Apartamentos ')
       
    //Tratativa padrão para fechar a tela
    oView:SetCloseOnOk({||.T.})
       
Return oview
