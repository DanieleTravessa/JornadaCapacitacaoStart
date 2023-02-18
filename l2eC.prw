/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
||                      Jogo Adivinhe o N�mero                             ||
||-------------------------------------------------------------------------||
||Obs:
||Fa�a a pt 1 em um arquivo e o game completo (pt 1+pt 2) em outro arquivo.||
||-------------------------------------------------------------------------||
|Parte 1: Elaborar um jogo do tipo adivinhe o n�mero. Onde dever� ser       |
|sorteado um n�mero entre 0 e 100. Em seguida solicitado que o usu�rio      |
|adivinhe qual foi o n�mero sorteado. Ap�s o �chute� do usu�rio apresentar  |
|uma mensagem informando se o n�mero sorteado � maior, menor ou igual ao    |
|n�mero �chutado�.
|---------------------------------------------------------------------------|
|  Parte 2: Continue o desenvolvimento do jogo. Agora, o programa dever�    |
|continuar dando dicas a cada palpite do usu�rio at� que ele acerte o n�mero|
|sorteado. Quando o usu�rio acertar o n�mero gerado dever� ser apresentado o|
|resultado do teste da seguinte forma:                                      |   
|� Em menos de 5 tentativas exibir a mensagem: �Voc� � muito bom, acertou em|
|�x� tentativas.�                                                           |
|� Em mais que 5 e menos que 9 tentativas: �Voc� � bom, acertou em �x�      |
|tentativas".                                                               |
|� Em mais que 9 e menos que 13 tentativas: �Voc� � mediano, acertou em �x� |
|tentativas�.                                                               |
|� Em mais que 13: �Voc� � muito fraco, acertou em �x� tentativas�          |
|---------------------------------------------------------------------------|
/*/
#INCLUDE "TOTVS.CH"

//Jogo Adivinha o n�mero.
User Function JsL2eC()
nOpt := Aviso("**Jogo Adivinhe o N�mero**", "Tente acertar o n�mero com o m�nimo de tentativas!", {"**Level 1**", "**Level 2**"}, 1,,,,,)

    If nOpt == 1
        f_Level1()
    
    ElseIf nOpt == 2
        f_Level2()
    
    EndIf
       
Return

Static Function f_Level1()
    Local nN, nChute := 0, nTent := 0

    nN := Random(0,100)
    
    While nChute != nN

        nChute := Val(FwInputBox("Digite um n�mero (de 1 a 100): "))

        If(nChute == nN)
            FwAlertSuccess("O total de erro foi de: " + alltrim(str(nTent)) + " tentativas.", "Parab�ns, voce acertou!!")
            
        Elseif (nChute > nN)
            FwAlertError("O valor digitado � mais alto, tente novamente.")
            nTent +=1

        Else
            FwAlertError("O valor digitado � baixo, tente novamente.")
            nTent +=1
        EndIf
    EndDo

Return

/*Jogo Adivinha o n�mero - parte 2: */
Static Function f_Level2()

    Local nN, nChute := 0, nTent := 0

    nN := Random(0,100)
    While nChute != nN

        nChute := Val(FwInputBox("Digite um n�mero (de 1 a 100): "))
        
        If(nChute == nN)
            FwAlertSuccess("O total de erro foi de: " + Alltrim(Str(nTent)) + " tentativas.", "Parab�ns, voc� acertou!!")
        ElseIf (nChute > nN)
            FwAlertError("Tente um valor mais baixo!")
            nTent+=1
        Else
            FwAlertError("Tente um valor mais alto!")
            nTent+=1
        EndIf      
    EndDo
    
    If nTent <=5
        FwAlertSuccess("Voce � muito bom, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    ElseIf nTent > 5 .and. nTent <= 9
        FwAlertSuccess("Voce � bom, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    ElseIf nTent > 9 .and. nTent <= 13
        FwAlertInfo("Voce � mediano, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    Elseif nTent > 13
        FwAlertError("Voce � muito fraco, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    ENDIF
RETURN
