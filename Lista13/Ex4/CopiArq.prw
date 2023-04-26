#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function CopiArq
    (Rotina que copia um arquivo - Lista13 ex4)
    @type  Function
    @author Daniele Travessa
    @since 24/04/2023
    @version version  
    @see (links_or_references)
    /*/
User Function CopiArq()

    Local cPastaOrig := 'c:\temp\Lista13_Ex1\'
    Local cPastaDest := PARAMIXB
    Local aArquivos := Directory(cPastaOrig + '*.*','D',/**/,/**/,1)
    Local nI := 0
    Local nTamanho := Len(aArquivos)

    if nTamanho > 0
        for nI := 3 to nTamanho
            if !cpyT2S(cPastaOrig+aArquivos[nI][1], cPastaDest)
                MsgStop('Houve um erro ao copiar o arquivo!' + aArquivos[nI][1])
            else
                FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!','Concluído')    
            endif
        next        
    else
        FwAlertInfo('A pasta não contém nenhum arquivo ou subpasta!','Atenção!')
    endif   
    
Return
