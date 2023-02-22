/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E5: Faça um SELECT na tabela SB1 que retorne todos os produtos cadastrados|
|e apresente os códigos e descrições de todos em uma mensagem. Mas atenção,|
|os itens devem ser apresentados em ordem de descrição decrescente (Z-A)   |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function JsL3e5()
    Local cDesc  := ""
    LOCAL cCod   := ""
    Local cMsg   := ""
    
//    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'
    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_COD,
            B1_DESC
        FROM
            %table:sb1% SB1
        WHERE 
            D_E_L_E_T_ <>'*'
        ORDER by
            B1_DESC DESC 
    ENDSQL

  while SB1->(!EOF())
    cCod := SB1->B1_COD
    cDesc := SB1->B1_DESC
    cMsg += " | Cód: " + cCod + " ||  Nome: " + cDesc + CRLF 
    cMsg += "-------------------------------------------------------------------------" + CRLF

    SB1->(DBSKIP())
  ENDDO
  
  FwAlertInfo(cMsg, "Produtos Cadastrados")

  RpcClearEnv()
Return
