/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.24 - Ler 10 valores e escrever quantos desses valores lidos estão no
 intervalo [10, 20] (inlcuindo os valores 10 e 20 no intervalo) e quantos 
 deles estão fora deste intervalo.                    |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsIntervalo()

  Local aIntervalo := {}
  Local aForaInter := {}
  Local nValor  := 0
  Local cValor  := ""
  Local nDentro := 0
  Local nFora   := 0
  Local nNum

  For nNum := 1 to 10
  cValor := FwInputBox("Informe um valor qualquer:", cValor)
  nValor := Val(cValor)
        If nValor >= 10 .and. nValor <= 20
        AADD(aIntervalo, nValor)    
        Else
        AADD(aForaInter, nValor)
        Endif 
    Next

  nDentro := Len(aIntervalo)
  nFora   := Len(aForaInter) //Ou poderia ser calculado nFora := 10 - nDentro

FwAlertInfo(Str(nDentro) + " dentro do intervalo de 10 a 20 e " + Str(nFora) + " fora desse intervalo!", "Foram registrados: ") 

Return
