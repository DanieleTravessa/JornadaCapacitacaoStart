/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E2: Efetuar o c�lculo da quantidade de litros de combust�vel gastos em uma|
|viagem, utilizando-se um autom�vel que faz 12 Km por litro. Para obter o  |
|c�lculo, o usu�rio dever� fornecer o tempo gasto na viagem e a velocidade |
|m�dia durante a mesma. Desta forma, ser� poss�vel obter a dist�ncia       |
|percorrida com a f�rmula: DIST�NCIA = TEMPO x VELOCIDADE. Tendo o valor da|
| dist�ncia, basta calcular a quantidade de litros de combust�vel utilizada|
|na viagem com a f�rmula: LITROS_USADOS = DIST�NCIA / 12.                  |
|O programa dever� apresentar os valores da velocidade m�dia, tempo gasto, |
|a dist�ncia percorrida e a quantidade de litros utilizada na viagem.      |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e2()

//Declara��o e Atribui��o de vari�veis                      
    Local nDistancia:= 0, nTempo := 0, nVelocidade := 0, nLitros := 0 

//Solicita os valores           
    nTempo := Val(FwInputBox("Digite o tempo gasto na viagem em horas: "))
    nVelocidade := Val(FwInputBox("Digite a velocidade m�dia : "))
    
//Calculos 
    nDistancia := nTempo*nVelocidade
    nLitros := nDistancia/12

//Apresenta��o dos resultados     
    FwAlertInfo("--> Com uma velocidade media de " +AllTrim(Str(nVelocidade)) + "km/h;";
    + CRLF + "--> Tempo gasto na viagem de " + AllTrim(Str(nTempo)) + "horas;";
    + CRLF + "--> Foi percorrida a distancia de " +AllTrim(Str(nDistancia)) + "km;";
    + CRLF + "--> Com um consumo de " + AllTrim(Str(nLitros,10,2)) + " litros de combustivel.", "C�lculos da Viagem")    
Return
