/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.17- Acrescente uma mensagem 'NOVO C�LCULO (S/N)?' ao final do exerc�cio|
|anterior. Se for respondido 'S' deve retornar e executar um novo c�lculo, |
|caso contr�rio dever� encerrar o algoritmo.                               |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e17()

Local cEntrada := ''
Local nSoma := 0
Local nResultado     := 0
Local nCont := 1
Local lContinua := .T.
Local cTitulo := 'Programa para calcular media de aluno'

//Insira um numero
While lContinua == .T.
    nSoma := 0
    For nCont := 1 to 2
    cEntrada := '-1'
    nAntecessor = val(nNumero - 1)
    while val(cEntrada) < 0 .or. Val(cEntrada) > 10
    cEntrada:=''
    cEntrada := FwInputBox('Informe a Nota do Aluno: ', cEntrada)
    ENDDO
    nSoma += Val(cEntrada)
    Next
    nResultado := nSoma / 2

    FwAlertInfo("A media de alunos" + cvaltochar(nresultado), ctitulo)    

    cEntrada := ''
    cEntrada := FwInputBox('Novo Calculo (S/N)? ', cEntrada)
    If cEntrada := 'N'
    lContinua := .F.
    ENDIF
    ENDDO

RETURN
