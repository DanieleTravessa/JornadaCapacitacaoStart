/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E13 � Desenvolva uma fun��o que leia um n�mero e exiba o dia da semana    |
|correspondente, por exemplo:
|1 � Domingo
|2 � Segunda...
|� necess�rio avisar o usu�rio caso ele digite um valor � inv�lido.        |
|Obs: Utilize Array
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e13()
  Local cDia := ""
  Local nNum := 0  
  Local aSemana := {"Domingo", "Segunda", "Ter�a", "Quarta", "Quinta", "Sexta", "S�bado"}
    
  Do while nNum < 1 .or. nNum > 7
    nNum := Val(FwInputBox("Por favor informe um n�mero de 1 a 7: "))
    If nNum < 1 .or. nNum > 7
      MsgAlert("N�mero inv�lido!")
    EndIf
  EndDo
  
    cDia := cValtoChar(aSemana[nNum])  
   
  FwAlertInfo(cDia, "O dia da semana relacionado ao n�mero informado �:")
Return
