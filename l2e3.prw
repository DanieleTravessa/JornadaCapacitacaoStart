/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E3- Alterar o programa do exercício anterior de modo que ele possa ser    |
|usado em veículos com padrão de consumo diferente de 12 Km por litro.     |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2E3()

//Declaração e Atribuição de variáveis                      
    Local nDistancia:= 0, nTempo := 0, nVelocidade := 0, nLitros := 0 
    Local nAutonomia := 0 //variável para autonomia

//Solicita os valores           
    nTempo := Val(FwInputBox("Digite o tempo gasto na viagem em horas: "))
    nVelocidade := Val(FwInputBox("Digite a velocidade média : "))
    nAutonomia := Val(FwInputBox("Informe a autonomia do seu veiculo: "))
    
//Calculos
    nDistancia := nTempo*nVelocidade
    nLitros := nDistancia/nAutonomia

//Apresentação dos resultados     
    FwAlertInfo("--> Com uma velocidade media de " +AllTrim(Str(nVelocidade)) + "km/h;";
    + CRLF + "--> Tempo gasto na viagem de " + AllTrim(Str(nTempo)) + "horas;";
    + CRLF + "--> Foi percorrida a distancia de " +AllTrim(Str(nDistancia)) + "km;";
    + CRLF + "--> Com um consumo de " + AllTrim(Str(nLitros,10,2)) + " litros de combustivel.", "Cálculos da Viagem")    
Return
