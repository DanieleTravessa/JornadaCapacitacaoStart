#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function CriaPL13e1
    (Função para criação de uma pasta, exercício 1 da Lista 13)
    @type  Function
    @author Daniele Travessa
    @since 24/04/2023
    @version version    
    @see (links_or_references)
    /*/
User Function CriaPL131()
 
    Local cCaminho := 'c:\temp\' //GETTEMPPATH()
    Local cPasta := 'Lista13_Ex1\'

    if !ExistDir(cCaminho+cPasta)
        if MakeDir(cCaminho+cPasta) == 0
            FwAlertSuccess('Pasta criada com sucesso!', 'Concluído!')
        else
            FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')
        endif
    endif

Return
