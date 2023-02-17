/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E1- Ler dois n�meros positivos e apresentar a soma, diferen�a, produto e  |
|quociente entre eles.                                                     |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"
 
User Function JsL2e1()

//declara��o de vari�veis
    Local nN1 :=0 , nN2 := 0, nOpc := 0

//inser��o de dados      
    nN1:= Val(FwInputBox("Escreva um numero: "))
    nN2:= Val(FwInputBox("Escreva outro numero: "))
  
    nOpc := Aviso( "Calculadora", "Vamos Calcular?", { "Soma", "Subtra��o", "Multiplica��o", "Divis�o" }, ;
                3, "Escolha a opera��o:",, 'ROTINAAUTO', .F.)
                //, 10000 )

//Optei por declarar as opera��es no comando de sa�da
    Do Case
    Case nOpc == 1
          FwAlertSuccess(AllTrim(str(nN1+nN2)), "A soma dos n�meros informados �: ")
    Case nOpc == 2
          FwAlertSuccess(AllTrim(Str(nN1-nN2)), "A diferen�a dos n�meros informados �: ")
    Case nOpc == 3
         FwAlertSuccess(AllTrim(Str(nN1*nN2)), "O produto dos n�meros informados �: ")
    Case nOpc == 4
        FwAlertSuccess(AllTrim(Str(nN1/nN2)), "O quociente dos n�meros informados �: ")
    EndCase
Return
