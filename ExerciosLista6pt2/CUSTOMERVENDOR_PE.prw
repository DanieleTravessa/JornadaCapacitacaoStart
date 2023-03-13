/*6 – No Cadastro de Fornecedores, utilizando um Ponto de Entrada, ao tentar incluir ou alterar um
cadastro, faça as seguintes validações:
o Se o campo “País” estiver em branco não poderá realizar a inclusão / alteração.
o Se o país for “Brasil” (105), o campo “CNPJ” deverá ser preenchido, caso não seja, não
poderá realizar a inclusão / alteração.
o Se o país não for “Brasil”, o CNPJ não é obrigatório.
Obs: Para as situações em que o cadastro não poderá ser realizado, apresentar mensagem de
erro informando o que o usuário deve fazer para poder concluir o cadastro.
Dica 1: Utilize a função Help()
Dica 2: Para gerar CNPJs válidos, você pode usar o site 4Devs*/

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
                     Help(,,"Atenção!",,"Campo de País Incompleto!",1,0,,,,,,;
                     {"Favor Preencher o Campo de País."})
                     xRet := .F.              
              ElseIf M->A2_PAIS == "105" .and. Empty(M->A2_CGC)
                     Help(,,"Atenção!",,"CNPJ/CPF não preenchidos!",1,0,,,,,;
                     {"Insira os dados no formulário para completar o Cadastro."})
                     xRet := .F.
              EndIf
       /*e.8*/ nOper :=oObj:nOperation                     
              If INCLUI 
                     MsgAlert("Seja Bem Vindo(a) ao Cadastro de Fornecedores!", "Bem Vindo!")              
              ElseIf ALTERA
                     MSGALERT( "Cuidado! Você está prestes a alterar o fornecedor"+ AllTrim(SA2->A2_NOME), "Alteração de Fornecedor")
              ElseIf nOper == 5
                     MSGSTOP( "Cuidado! Você está prestes a excluir o Fornecedor." + AllTrim(SA2->A2_NOME), "Exclusão de Fornecedor")
       /*e.9*/       xRet := MsgYesNo("Deseja realmente excluir?","Atenção!")
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
