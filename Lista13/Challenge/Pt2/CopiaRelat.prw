#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function CopiArq
    (Rotina que copia um arquivo - Lista13 ex4)
    @type  Function
    @author Daniele Travessa
    @since 24/04/2023
    @version version  
    @see (links_or_references)
    /*/
User Function CopiaRelat()

    Local cPastaOrig := 'c:\totvs12\protheus\protheus_data\Pedidos_de_Venda\'
    Local cPastaDest := CriaPasVen()//'c:\temp\Vendas_Protheus\'
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

Static Function CriaPasVen()
 
    Local cPasta := 'c:\temp\Vendas_Protheus\'
  
    if !ExistDir(cPasta)
            If MakeDir(cPasta,/**/,.F.) == 0
                FwAlertSuccess('Pasta criada com sucesso!', 'Concluído!')            
            else
                FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')                            
            endif       
    endif        
Return cPasta
