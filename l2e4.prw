/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|E4: Ler dois inteiros (A,B) e imprimir o resultado do quadrado da diferen�a|
| do primeiro valor pelo segundo.                                           |
|---------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e4()

//Declara��o das vari�veis
    Local nA := 0, /*nQuadrado := 0, */nB := 0 

//Leitura dos valores    
    nA := Val(FwInputBox("Digite um valor: "))
    nB := Val(FwInputBox("Digite outro valor: "))
       
//C�lculo e Apresenta��o dos resultados        
    MsgInfo(+AllTrim(Str(((nA-nB)^2))),"O valor �: ")
        
Return
