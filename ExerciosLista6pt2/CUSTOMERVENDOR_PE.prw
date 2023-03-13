/*6 � No Cadastro de Fornecedores, utilizando um Ponto de Entrada, ao tentar incluir ou alterar um
cadastro, fa�a as seguintes valida��es:
o Se o campo �Pa�s� estiver em branco n�o poder� realizar a inclus�o / altera��o.
o Se o pa�s for �Brasil� (105), o campo �CNPJ� dever� ser preenchido, caso n�o seja, n�o
poder� realizar a inclus�o / altera��o.
o Se o pa�s n�o for �Brasil�, o CNPJ n�o � obrigat�rio.
Obs: Para as situa��es em que o cadastro n�o poder� ser realizado, apresentar mensagem de
erro informando o que o usu�rio deve fazer para poder concluir o cadastro.
Dica 1: Utilize a fun��o Help()
Dica 2: Para gerar CNPJs v�lidos, voc� pode usar o site 4Devs*/

#INCLUDE'TOTVS.CH'

User Function CUSTOMERVENDOR()
       Local aParam     := PARAMIXB
       Local xRet       := .T.
       Local oObj       := ''
       Local cIdPonto   := ''
       Local cIdModel   := ''
       Local lIsGrid    := .F.
       Local nLinha 
       Local nQtdLinhas
 
       Local cNum := Random(1,9)

       Local cAlias := "SB1"
       Local aButtons := {}    
       Private nOper

       DBSELECTAREA(cAlias)
       DBSETORDER(1)

       If aParam <> NIL
      
       oObj       := aParam[1]
       cIdPonto   := aParam[2]
       cIdModel   := aParam[3]
       lIsGrid    := (Len(aParam)>3)
      
       If lIsGrid
              nQtdLinhas := oObj:GetQtdLine()
              nLinha     := oObj:nLine
       EndIf
      
       If cIdPonto == "MODELPOS"
              If Empty(M->A2_PAIS)
                     Help(,,"Aten��o!",,"Campo de Pa�s Incompleto!",1,0,,,,,,;
                     {"Favor Preencher o Campo de Pa�s."})
                     xRet := .F.              
              ElseIf M->A2_PAIS == "105" .and. Empty(M->A2_CGC)
                     Help(,,"Aten��o!",,"CNPJ/CPF n�o preenchidos!",1,0,,,,,;
                     {"Insira os dados no formul�rio para completar o Cadastro."})
                     xRet := .F.
              EndIf
       /*e.8*/ nOper :=oObj:nOperation                     
              If INCLUI 
                     MsgAlert("Seja Bem Vindo(a) ao Cadastro de Fornecedores!", "Bem Vindo!")              
              ElseIf ALTERA
                     MSGALERT( "Cuidado! Voc� est� prestes a alterar o fornecedor"+ AllTrim(SA2->A2_NOME), "Altera��o de Fornecedor")
              ElseIf nOper == 5
                     MSGSTOP( "Cuidado! Voc� est� prestes a excluir o Fornecedor." + AllTrim(SA2->A2_NOME), "Exclus�o de Fornecedor")
       /*e.9*/       xRet := MsgYesNo("Deseja realmente excluir?","Aten��o!")
              EndIf
       EndIf                         
       
/*e.7*/If cIdPonto == "FORMPRE"
        If INCLUI
         oObj:GetModel('SA2MASTER'):LoadValue('A2_Loja', cNum)              
         oView := FwViewActive()
         oView := Refresh()       
        EndIf
       EndIf

/*e.10*/    
       If cIdPonto == "BUTTONBAR"//Adicionando Botao na Barra de Botoes (BUTTONBAR).
              aAdd(aButtons,{"CAD. PRODUTOS", "SALVAR", {||AxCadastro(cAlias, "Cadastro de Produtos",".T.",".T.")},"CAD. PRODUTOS"})
              Return aButtons
       EndIf
       
       DBCLOSEAREA()
       RestArea(aArea)

       EndIf
Return xRet
