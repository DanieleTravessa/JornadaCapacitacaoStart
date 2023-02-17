/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E1- Ler dois números positivos e apresentar a soma, diferença, produto e  |
|quociente entre eles.                                                     |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"
 
User Function JsL2e1()

//declaração de variáveis
    Local nN1 :=0 , nN2 := 0, nOpc := 0

//inserção de dados      
    nN1:= Val(FwInputBox("Escreva um numero: "))
    nN2:= Val(FwInputBox("Escreva outro numero: "))
  
    nOpc := Aviso( "Calculadora", "Vamos Calcular?", { "Soma", "Subtração", "Multiplicação", "Divisão" }, ;
                3, "Escolha a operação:",, 'ROTINAAUTO', .F.)
                //, 10000 )

//Optei por declarar as operações no comando de saída
    Do Case
    Case nOpc == 1
          FwAlertSuccess(AllTrim(str(nN1+nN2)), "A soma dos números informados é: ")
    Case nOpc == 2
          FwAlertSuccess(AllTrim(Str(nN1-nN2)), "A diferença dos números informados é: ")
    Case nOpc == 3
         FwAlertSuccess(AllTrim(Str(nN1*nN2)), "O produto dos números informados é: ")
    Case nOpc == 4
        FwAlertSuccess(AllTrim(Str(nN1/nN2)), "O quociente dos números informados é: ")
    EndCase
Return
