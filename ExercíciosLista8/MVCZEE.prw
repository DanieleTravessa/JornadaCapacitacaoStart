#INCLUDE'totvs.ch'
#INCLUDE'fwmvcdef.ch'

/*/{Protheus.doc} MVCmod3
    (Rotina de Visualização dos controles da Auto Escola) 
    @type  Function
    @author Daniele Travessa
    @since 27/03/2023
    /*/
 
User Function MVCZEE()
    Local cTitulo := "Auto Escola"
    Local oBrowse := FWMBrowse():New()
    Local cAlias := "ZEC"
            
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitulo)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()  
    oBrowse:Activate()
      
Return 
 
Static Function MenuDef()
    Local aRotina := {}
    
    ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.MVCZEE" OPERATION 2 ACCESS 0
    
Return aRotina

Static Function ModelDef()
    Local oModel := MPFormModel():New("MVCZEEM"/*, bPre, bPos, bCommit, bCancel*/)
    Local oStruZEC  := FWFormStruct(1, "ZEC") //CNH
    Local oStruZEI  := FWFormStruct(1, "ZEI") //Instrutor
    Local oStruZEA  := FWFormStruct(1, "ZEA") //Alunos
     
    oModel:AddFields("ZECMASTER", /*cOwner*/, oStruZEC)
    oModel:AddGrid("ZEIDETAIL", "ZECMASTER", oStruZEI)
    oModel:AddGrid("ZEADETAIL", "ZEIDETAIL", oStruZEA)
	
    oModel:SetDescription("Modelo de dados - " + cTitulo)
    oModel:GetModel("ZECMASTER"):SetDescription( "Instrutores da - " + cTitulo)
    oModel:GetModel("ZEIDETAIL"):SetDescription( "Alunos da - " + cTitulo)

    oModel:SetRelation('ZEIDETAIL', {{'ZEI_FILIAL', 'FwxFilial("ZEI")'}, {'ZEI_CATEGO', 'ZEC_COD'}}, ZEI->(IndexKey(1)))
    oModel:SetRelation('ZEADETAIL', {{'ZEA_FILIAL', 'FwxFilial("ZEA")'}, {'ZEA_INSTRU', 'ZEI_COD'}}, ZEA->(IndexKey(1)))
    oModel:SetPrimaryKey({'ZEC_COD','ZEI_COD','ZEA_CODIGO'})
Return oModel
 
Static Function ViewDef()
    
    Local oModel := FWLoadModel("MVCZEE")
	Local oView := FWFormView():New()
    Local oStructZEC := FWFormStruct(2, 'ZEC')
    Local oStructZEI := FWFormStruct(2, 'ZEI')
    Local oStructZEA := FWFormStruct(2, 'ZEA')
        
     //Cria a visualizacao do cadastro   
    oView:SetModel(oModel)
    oView:AddField("VIEW_ZEC", oStructZEC, "ZECMASTER")
    oView:AddGrid("VIEW_ZEI", oStructZEI, "ZEIDETAIL")
    oView:AddGrid("VIEW_ZEA", oStructZEA, "ZEADETAIL")
     
    oView:CreateHorizontalBox( 'TOP_ZEC' ,20) 
    oView:CreateHorizontalBox( 'MEDIUM_ZEI' ,40)
    oView:CreateHorizontalBox( 'BOTTOM_ZEA' ,40)
         
    oView:SetOwnerView('VIEW_ZEC','TOP_ZEC')
    oView:SetOwnerView('VIEW_ZEI','MEDIUM_ZEI')
    oView:SetOwnerView('VIEW_ZEA','BOTTOM_ZEA')

    oView:EnableTitleView("VIEW_ZEC", "Categorias de CNH")
    oView:EnableTitleView("VIEW_ZEI", "Instrutor(es) da Categoria")
    oView:EnableTitleView("VIEW_ZEA", "Aluno(s) do Instrutor")

Return oView
