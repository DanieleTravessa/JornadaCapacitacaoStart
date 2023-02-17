/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E2: Efetuar o cálculo da quantidade de litros de combustível gastos em uma|
|viagem, utilizando-se um automóvel que faz 12 Km por litro. Para obter o  |
|cálculo, o usuário deverá fornecer o tempo gasto na viagem e a velocidade |
|média durante a mesma. Desta forma, será possível obter a distância       |
|percorrida com a fórmula: DISTÂNCIA = TEMPO x VELOCIDADE. Tendo o valor da|
| distância, basta calcular a quantidade de litros de combustível utilizada|
|na viagem com a fórmula: LITROS_USADOS = DISTÂNCIA / 12.                  |
|O programa deverá apresentar os valores da velocidade média, tempo gasto, |
|a distância percorrida e a quantidade de litros utilizada na viagem.      |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e2()

//Declaração e Atribuição de variáveis                      
    Local nDistancia:= 0, nTempo := 0, nVelocidade := 0, nLitros := 0 

//Solicita os valores           
    nTempo := Val(FwInputBox("Digite o tempo gasto na viagem em horas: "))
    nVelocidade := Val(FwInputBox("Digite a velocidade média : "))
    
//Calculos 
    nDistancia := nTempo*nVelocidade
    nLitros := nDistancia/12

//Apresentação dos resultados     
    FwAlertInfo("--> Com uma velocidade media de " +AllTrim(Str(nVelocidade)) + "km/h;";
    + CRLF + "--> Tempo gasto na viagem de " + AllTrim(Str(nTempo)) + "horas;";
    + CRLF + "--> Foi percorrida a distancia de " +AllTrim(Str(nDistancia)) + "km;";
    + CRLF + "--> Com um consumo de " + AllTrim(Str(nLitros,10,2)) + " litros de combustivel.", "Cálculos da Viagem")    
Return
