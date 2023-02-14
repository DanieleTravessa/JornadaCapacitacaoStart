/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.6 -Escreva um algoritmo para ler uma temperatura em graus Fahrenheit,  |
|calcular e escrever o valor correspondente em graus Celsius.              |
|Observa��o: Para testar se a sua resposta est� correta saiba que 100 graus|
| Celsius = 212 graus Fahrenheit.                                          |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function ConvTemp()

//Declara��o de Vari�veis
  Local cFah := ""
  Local nCel := 0
  Local nFah := 0

//Solicita a temperatura 
  cFah := FwInputBox("Informe a temperatura em �F ? ", cFah)
  nFah:= val(cFah)

//Calcula a convers�o com a f�rmula C=(F - 32) * (5/9).   
  nCel:=((nFah-32) * (5/9))
    
//Informa o valor da temperatura em Celsius. O uso da Fun��o AllTrim elimina os espa�os em branco a esquerda.
  FwAlertInfo(AllTrim(Str(nCel,5,2)) + "�C", "A temperatura em Celsius �: ")
  
Return
