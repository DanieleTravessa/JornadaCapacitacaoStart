/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|Ex3: Escreva um algoritmo para ler o salário mensal atual de um funcionário|
| e o percentual de reajuste. Calcular e escrever o valor do novo salário.  |
|---------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL4e3()

    Local oJnla := Nil
    Local cTitulo := "Reajuste de Salário"
    Local cTexto := "Insira o Salário Atual: "
    Local cTexto2 := "Insira o percentual de reajuste"
    Local nSalario := Space(10), nPercentual := Space(10)
    Local nLinFim := 200, nColFim := 350

//Insere o SalarioAtual e o Percentual de Reajuste
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 080,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 080,010 of oJnla PIXEL
    @ 010, 095 MSGET  nSalario    SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  nPercentual    SIZE 050, 010 OF oJnla PIXEL  
    @ 050, 010 BUTTON "Calcular" SIZE 50, 012 OF oJnla PIXEL ACTION CalculaSal(nSalario,nPercentual)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    //DEFINE SBUTTON FROM 050, 070 TYPE 2 ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
RETURN
    
 
Static Function CalculaSal(nSalario,nPercentual)

//Declara e ajusta as variáveis
    Local nSalReajustado := 0
  
    nSalario := Val(nSalario)
    nPercentual := Val(nPercentual)
    
//Cálculo do Reajuste    
    nSalReajustado = (1+(nPercentual/100)) * nSalario

//Mostra o Salário Reajustado
    FwAlertInfo("O Salário reajustado é: " + Alltrim(Str(nSalReajustado,8,2)), "$$~Novo Salário~$$")
RETURN           
