/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
||                      Jogo Adivinhe o Número                             ||
||-------------------------------------------------------------------------||
||Obs:
||Faça a pt 1 em um arquivo e o game completo (pt 1+pt 2) em outro arquivo.||
||-------------------------------------------------------------------------||
|Parte 1: Elaborar um jogo do tipo adivinhe o número. Onde deverá ser       |
|sorteado um número entre 0 e 100. Em seguida solicitado que o usuário      |
|adivinhe qual foi o número sorteado. Após o “chute” do usuário apresentar  |
|uma mensagem informando se o número sorteado é maior, menor ou igual ao    |
|número “chutado”.
|---------------------------------------------------------------------------|
|  Parte 2: Continue o desenvolvimento do jogo. Agora, o programa deverá    |
|continuar dando dicas a cada palpite do usuário até que ele acerte o número|
|sorteado. Quando o usuário acertar o número gerado deverá ser apresentado o|
|resultado do teste da seguinte forma:                                      |   
|• Em menos de 5 tentativas exibir a mensagem: “Você é muito bom, acertou em|
|“x” tentativas.”                                                           |
|• Em mais que 5 e menos que 9 tentativas: “Você é bom, acertou em “x”      |
|tentativas".                                                               |
|• Em mais que 9 e menos que 13 tentativas: “Você é mediano, acertou em “x” |
|tentativas”.                                                               |
|• Em mais que 13: “Você é muito fraco, acertou em “x” tentativas”          |
|---------------------------------------------------------------------------|
/*/
#INCLUDE "TOTVS.CH"

//Jogo Adivinha o número.
User Function JsL2eC()
nOpt := Aviso("**Jogo Adivinhe o Número**", "Tente acertar o número com o mínimo de tentativas!", {"**Level 1**", "**Level 2**"}, 1,,,,,)

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

        nChute := Val(FwInputBox("Digite um número (de 1 a 100): "))

        If(nChute == nN)
            FwAlertSuccess("O total de erro foi de: " + alltrim(str(nTent)) + " tentativas.", "Parabéns, voce acertou!!")
            
        Elseif (nChute > nN)
            FwAlertError("O valor digitado é mais alto, tente novamente.")
            nTent +=1

        Else
            FwAlertError("O valor digitado é baixo, tente novamente.")
            nTent +=1
        EndIf
    EndDo

Return

/*Jogo Adivinha o número - parte 2: */
Static Function f_Level2()

    Local nN, nChute := 0, nTent := 0

    nN := Random(0,100)
    While nChute != nN

        nChute := Val(FwInputBox("Digite um número (de 1 a 100): "))
        
        If(nChute == nN)
            FwAlertSuccess("O total de erro foi de: " + Alltrim(Str(nTent)) + " tentativas.", "Parabéns, você acertou!!")
        ElseIf (nChute > nN)
            FwAlertError("Tente um valor mais baixo!")
            nTent+=1
        Else
            FwAlertError("Tente um valor mais alto!")
            nTent+=1
        EndIf      
    EndDo
    
    If nTent <=5
        FwAlertSuccess("Voce é muito bom, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    ElseIf nTent > 5 .and. nTent <= 9
        FwAlertSuccess("Voce é bom, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    ElseIf nTent > 9 .and. nTent <= 13
        FwAlertInfo("Voce é mediano, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    Elseif nTent > 13
        FwAlertError("Voce é muito fraco, acertou em ", +AllTrim(STR(nTent)),"tentativas")
    ENDIF
RETURN
