/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E20: Lembra do campo B1_ZZGRP que criamos há algum tempo? Pois é, vamos   |
|utilizar ele agora!                                                       |
|Desenvolva uma função que será executada num gatilho do campo B1_TIPO.Essa|
|função retornará o Grupo de Produto para o campo B1_ZZGRP.                |
|A função receberá o tipo de produto e, com base nele, preencherá o Grupo de|
|Produto (B1_ZZGRP) seguindo as seguintes regras:                          |
|Se o Tipo for “MP”, o Grupo de Produtos recebe “Matéria Prima Produção”   |
|Se o Tipo for “PA”, o Grupo de Produtos recebe “Produto para Comercialização”
|Para qualquer outro Tipo, o Grupo de Produtos recebe “Outros Produtos”    |
|Para testar se funcionou, realize o processo de cadastrar novos produtos  |
|selecionando diferentes Tipos de produtos.                                |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function JsL3e20()

  Local cGat := "", cGrp := M->B1_TIPO

  Do Case
  Case cGrp == "MP"
    cGat := "MATERIA PRIMA PRODUCAO"

  Case cGrp == "PA"
    cGat := "PRODUTO PARA COMERCIALIZACAO"

  Otherwise
    cGat := "OUTROS PRODUTOS"
  
  EndCASE
  
Return cGat
