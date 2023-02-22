/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E5: Fa�a um SELECT na tabela SB1 que retorne todos os produtos cadastrados|
|e apresente os c�digos e descri��es de todos em uma mensagem. Mas aten��o,|
|os itens devem ser apresentados em ordem de descri��o decrescente (Z-A)   |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_E5()
    Local cDes   := ''
    LOCAL cCod   := ''
    Local cMsg   := ''
    Local nCont  := 1

//    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'
    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_COD,
            B1_DESC
        FROM %table:sb1% SB1
        where D_E_L_E_T_ <>'*'
        order by b1_Desc desc 
    ENDSQL

  while SB1->(!EOF())
    cCod := SB1->B1_COD
    cDes := SB1->B1_DESC
    cMsg += 'C�digo: ' + cCod + CRLF + 'Nome: ' + cDes + CRLF 
    cMsg += '------------------------------' + CRLF + CRLF

    if nCont == 10
      FwAlertInfo(cMsg, 'Dados dos Clientes')
      nCont := 0
      cMsg  := ''
    endif

    SB1->(DBSKIP())
  ENDDO

  if nCont > 0
    FwAlertInfo(cMsg, 'Dados dos Clientes')
  endif
 SB1->(DBCLOSEAREA())
Return
