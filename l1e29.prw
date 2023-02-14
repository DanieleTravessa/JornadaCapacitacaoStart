/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|29- Ler um vetor aArray1 de 10 números. Após, ler mais um número e guardar|
|em uma variável nNum. Armazenar em um array aArray2 o resultado de cada   |
|elemento de aArray1 multiplicado pelo valor nNum. Logo após, imprimir o   |
|vetor aArray2.                                                            |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e29()

    Local aNum   := {}
    Local aNmult := {}
    Local cNum   := ""
    Local nCont := 0
    Local nNum
    Local nVal
    Local nNmult
    Local cResultado

    For nCont := 1 to 11
      cNum := FwInputBox("Informe um número: ", cNum)
      nVal := Val(cNum)
      If nCont <= 10
        AADD(aNum, nVal)
      Else
        nNum := Val(cNum)
      Endif 
    Next
    For nCont := 1 to 10
      nNmult := nNum *aNum[nCont]
      aAdd(aNmult, nNmult)
      nResultado += aNmult[nCont]
    Next

    FwAlertInfo(nResultado, "Esses são os valores de " + aNmult + " multiplicados por " + nNum) 
//Insira a Base

//Insira a Altura

//Mostre nAntecessornRetangulo

RETURN

/*///Calcular e apresentar o valor do volume de uma lata de óleo, utilizando a fórmula: VOLUME = 3,14159 x R2 x ALTURA. 

  LOCAL nV := 0, nAlt := 0, nR := 0

  ACCEPT "Informe o raio da lata em metros: " TO nR
  ACCEPT "Informe a altura da lata em metro: " TO nAlt

  nR := Val(nR)
  nAlt := Val(nAlt)
 
  nV := (3.1415*nR^2)*nAlt
 
  QOut("O volume da lata e: ", +AllTrim(Str(round(nV,2)),"m³"))//Função Round ("",n) para arredondar o valor. 
  ?""

RETURN nil
/*/
