#INCLUDE'totvs.ch'

/*/{Protheus.doc} Static Function EscreveTxt
    (long_description)
    @type  Function
    @author Daniele Travessa
    @since 24/04/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CriaTxt()

    Local cDiretorio := PARAMIXB
    Local cArquivo := 'Lista13Ex2.txt'
    Local lSobrescreve
    Local oWriter := FwFileWriter():New(cDiretorio + cArquivo,.T.)


    if File(cDiretorio + cArquivo)
        if MsgYesNo('O arquivo já existe gostaria de sobrescrevê-lo?', 'Atenção!')
            lSobrescreve := .T.    
        else
            FwAlertInfo('Procedimento cancelado pelo usuário', 'Arquivo não foi criado!')             
        endif
    endif
    If !File(cDiretorio + cArquivo) .or. lSobrescreve == .T.
        if !oWriter:Create()
            FwAlertError('Houve um erro ao gerar o arquivo' + CRLF + 'Erro: ' + oWriter:Error():Message,'Erro!')
        else
            oWriter:Write(;
                'Lista 13, Ex2:' + CRLF + 'Escreva um programa para criar um arquivo TXT ' +;
                'com um texto qualquer' + CRLF + 'e salvar dentro da pasta criada no exercício anterior.')
            FwAlertSuccess('Arquivo gerado com sucesso','Arquivo Gerado!')    
            oWriter:Close()
                if MsgYesNo('Arquivo gerado com sucesso ('+cDiretorio+cArquivo+')!' + CRLF + 'Deseja Abrir o arquivo?', 'Abrir?')
                    ShellExecute('OPEN', cArquivo, '', cDiretorio, 1)
                endif    
        endif    
    endif
Return 
