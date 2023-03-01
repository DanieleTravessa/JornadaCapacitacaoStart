/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E1- Ler dois números positivos e apresentar a soma, diferença, produto e  |
|quociente entre eles.                                                     |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"
 
User Function JsL4e1()

    Local oJnla := Nil
    Local cTitulo := "Insira os valores"
    Local cTexto := "Escreva um número: "
    Local cTexto2 := "Escreva outro numero: "
    Local nN1 := Space(10), nN2 := Space(10)
    Local nLinFim := 200, nColFim := 325
    //Local nLargSay := nLargSay2 := 55, nAltSay := nAltSay2 := 07
    
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 060,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 060,010 of oJnla PIXEL
    @ 010, 095 MSGET  nN1    SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  nN2    SIZE 050, 010 OF oJnla PIXEL  
    @ 050, 010 BUTTON "Calcular" SIZE 50, 012 OF oJnla PIXEL ACTION Calcula(nN1,nN2)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    //DEFINE SBUTTON FROM 050, 070 TYPE 2 ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
RETURN

Static Function Calcula(nN1,nN2)
//declaração e ajuste das variáveis
    Local nOpc := 0
    nN1:=Val(nN1)
    nN2:=Val(nN2)

    nOpc := Aviso( "Calculadora", "Vamos Calcular?", { "Soma", "Subtração", "Multiplicação", "Divisão" }, ;
                3, "Escolha a operação:",, "ROTINAAUTO", .F.)
                //, 10000 )

//Optei por declarar as operações no comando de saída
    Do Case
    Case nOpc == 1
          FwAlertSuccess(AllTrim(str(nN1+nN2)), "A soma dos números " + AllTrim(Str(nN1)) + " + " + AllTrim(Str(nN2)) + " é: ")
    Case nOpc == 2
          FwAlertSuccess(AllTrim(Str(nN1-nN2)), "A diferença dos números " + AllTrim(Str(nN1)) + " - " + AllTrim(Str(nN2)) + " é: ")
    Case nOpc == 3
         FwAlertSuccess(AllTrim(Str(nN1*nN2)), "O produto dos números " + AllTrim(Str(nN1)) + " * " + AllTrim(Str(nN2)) + " é: ")
    Case nOpc == 4
        FwAlertSuccess(AllTrim(Str(nN1/nN2)), "O quociente dos números "+ AllTrim(Str(nN1)) + " / " + AllTrim(Str(nN2)) + " é: ")
    EndCase
Return
