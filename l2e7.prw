/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.7 - Ler a hora de in�cio e a hora de fim de um jogo de Poker (considere|
|apenas horas inteiras, sem os minutos) e calcule a dura��o do jogo em horas|
|sabendo-se que o tempo m�ximo de dura��o do jogo � de 24 horas e que o jogo|
| pode iniciar em um dia e terminar no dia seguinte.                       |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e7()

//Declara��o e das Vari�veis
    Local nHoraInicio :=0, nHoraFim :=0, nTotPartida := 0

//Ler a hora de in�cio e a hora de fim de um jogo de Poker
     
    nHoraInicio := Val(FwInputBox("Informe a hora inicial do jogo: "))
    nHoraFim := Val(FwInputBox("Agora informe a hora final do jogo: "))
    
    If nHoraInicio>23
    FwAlertError("Hora Inicial invalida!")
    Else
        If nHoraFim>23
        FwAlertError("Hora Final invalida")
        Else
            IF nHoraInicio < nHoraFim
            nTotPartida := nHoraFim - nHoraInicio
            Else
                IF nHoraInicio > nHoraFim
                nTotPartida := nHoraFim + 24 - nHoraInicio
                ENDIF
            ENDIF        
        ENDIF
    ENDIF

    If nHoraInicio<=23 .and. nHoraFim<=23
        FwAlertInfo(+AllTrim(Str(nTotPartida)) + " horas.", "O tempo de duracao do jogo foi de :")
    ENDIF

Return

