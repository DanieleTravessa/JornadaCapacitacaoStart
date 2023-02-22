/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|EC� Automatizando o preenchimento do Grupo de Produtos em produtos j�     |
|cadastrados... Crie uma fun��o que percorrer� toda a tabela de cadastro de|
|produtos e, para cada produto, se o campo B1_ZZGRP n�o estiver preenchido,|
| atualize-o de acordo com as regras do exerc�cio 13.                      |                                 |
|--------------------------------------------------------------------------|/*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Jsl3eC()
  Local aArea  := GetArea()
  Local cAlias := GetNextAlias(), cQuery := "", cGat := "", cGrp := ""
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'
  
    cQuery := "SELECT *" + "FROM " + RetSqlName('SB1') + " WHERE " + " B1_ZZGRP = ' '"
    
    TCQUERY cQuery ALIAS &(cAlias) NEW

      &(cAlias)->(DbGoTop())
      DbSelectArea("SB1")
      DbSetOrder(2)
      
      While &(cAlias)->(!EOF())
        cGrp := &(cAlias)->(B1_TIPO)

        If cGrp == "PA"
          cGat := "PRODUTO PARA COMERCIALIZACAO"
                       
        ElseIf cGrp == "MP"
          cGat := "MATERIA PRIMA PRODUCAO"
  
        Else
          cGat := "OUTROS PRODUTOS"
        EndIf

        If DbSeek(&(cAlias)->(B1_Filial) + &(cAlias)->(B1_COD))
          RecLock("SB1", .F.)
          SB1->B1_ZZGRP := cGat
        MsUnlock()
      endif

        &(cAlias)->(DbSKIP())
      End Do

      &(cAlias)->(DbCloseArea())      
      RestArea(aArea)

    Return    
