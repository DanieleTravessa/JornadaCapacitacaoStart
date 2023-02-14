/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E23- Ler 10 valores e escrever quantos desses valores lidos são NEGATIVOS.|
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function Jsl1e23()

    Local aValor := {}
    Local nValor := 0
    Local cValor := ""
    Local nNegativo := 0
    Local nNum

    For nNum := 1 to 10
    cValor := FwInputBox("Informe um valor qualquer: ", cValor)
    nValor := Val(cValor)
        If nValor < 0
        AADD(aValor, nValor)    
        Endif 
    Next
nNegativo := Len(aValor)

FwAlertInfo(Str(nNegativo) + " valores negativos.", "Foram informados: ") 

RETURN
