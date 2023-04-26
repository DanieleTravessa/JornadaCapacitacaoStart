#INCLUDE'totvs.ch'

User Function LerTxt()
    Local cPasta := 'c:\temp\Lista13_Ex1\'
    Local cArquivo := 'Lista13Ex2.txt'
    Local cTxtLinha := ''    
    Local oArq := FwFileReader():New(cPasta + cArquivo)

    if oArq:Open()
        if !oArq:EOF()
            while oArq:HasLine()
                cTxtLinha += oArq:GetLine(.T.)             

            enddo
        endif
        oArq:Close()
    endif

    FwAlertInfo(cTxtLinha, 'Conteúdo do Arquivo:')
Return
