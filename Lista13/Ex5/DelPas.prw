#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function DelPas
    (Rotina para exclusão de pasta, Lista 13 Ex.5)
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
User Function DelPas()
    Local cPasta := 'C:\temp\Lista13_Ex1\'
    Local aArquivos := Directory(cPasta + '*.*','D',/*Cp*/,/*ChangeCase*/,1)
    Local nI

    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclusão da pasta?','Atenção!')
            if LEN(aArquivos) > 0
                for nI := 1 to LEN(aArquivos)
                    if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo' + aArquivos[nI][1])
                    endif
                next
            endif        
            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso','Concluído')
            else
                FwAlertError('Houve um erro ao excluir a pasta!','Erro')
            endif
        endif
    endif
        
Return
