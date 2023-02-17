/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|E4: Ler dois inteiros (A,B) e imprimir o resultado do quadrado da diferença|
| do primeiro valor pelo segundo.                                           |
|---------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e4()

//Declaração das variáveis
    Local nA := 0, /*nQuadrado := 0, */nB := 0 

//Leitura dos valores    
    nA := Val(FwInputBox("Digite um valor: "))
    nB := Val(FwInputBox("Digite outro valor: "))
       
//Cálculo e Apresentação dos resultados        
    MsgInfo(+AllTrim(Str(((nA-nB)^2))),"O valor é: ")
        
Return
