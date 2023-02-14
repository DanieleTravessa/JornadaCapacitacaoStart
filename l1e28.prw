/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.28 - Escreva um algoritmo que permita a leitura dos nomes de 10 pessoas|
|e armazene os nomes lidos em um array.Após isto, o algoritmo deve permitir|
|a leitura de mais 1 nome qualquer de pessoa e depois escrever a mensagem  |
|ACHEI, se o nome estiver entre os 10 nomes lidos anteriormente (guardados |
|no array), ou NÃO ACHEI caso contrário.                                   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsAcheNome()

    Local aNome    := {}
    Local cNome    := ""
    Local cAchei   := ""
    Local nPosicao := 0
    Local nNum

    For nNum := 1 to 11
      cNome := FwInputBox("Informe um nome: ", cNome)
      If nNum <= 10
        AADD(aNome, cNome)
      Else
        cAchei := cNome
      Endif 
    Next

    nPosicao := Ascan(aNome, cAchei)

    If nPosicao <= 0
      FwAlertError("Dentre os nomes informados" , "Não Achei!") 
    else
      FwAlertSuccess("O nome " + cAchei + "está dentre os nomes informados" , "Achei!")
    Endif 

RETURN
