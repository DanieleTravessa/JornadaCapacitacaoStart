/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E13 – Desenvolva uma função que leia um número e exiba o dia da semana    |
|correspondente, por exemplo:
|1 – Domingo
|2 – Segunda...
|É necessário avisar o usuário caso ele digite um valor é inválido.        |
|Obs: Utilize Array
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e13()
  Local cDia := ""
  Local nNum := 0  
  Local aSemana := {"Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"}
    
  Do while nNum < 1 .or. nNum > 7
    nNum := Val(FwInputBox("Por favor informe um número de 1 a 7: "))
    If nNum < 1 .or. nNum > 7
      MsgAlert("Número inválido!")
    EndIf
  EndDo
  
    cDia := cValtoChar(aSemana[nNum])  
   
  FwAlertInfo(cDia, "O dia da semana relacionado ao número informado é:")
Return
