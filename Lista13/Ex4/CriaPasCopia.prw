#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function CriaPastaL13e1
    (Função para criação de uma pasta, exercício 2 da Lista 13)
    @type  Function
    @author Daniele Travessa
    @since 24/04/2023
    @version version    
    @see (links_or_references)
    /*/
User Function CriaPasCop()
 
    Local cPasta := '\Lista13\'
    Local lSobrescreve
    
    if ExistDir(cPasta)
        MsgYesNo('A pasta já existe no caminho selecionado, gostaria de sobrescrevê-la?','Sobrescreve?')
            lSobrescreve := .T. //MsgYesNo('A pasta já existe no caminho selecionado, gostaria de sobrescrevê-la?','Sobrescreve?')
        else
            FwAlertInfo('Procedimento cancelado pelo usuário', 'Pasta não foi criada!')  
        endif
    
    if !ExistDir(cPasta) .or. lSobrescreve == .T.
            If MakeDir(cPasta,/**/,.F.) //== 0
                FwAlertSuccess('Pasta criada com sucesso!', 'Concluído!')
                If ExistBlock('CopiArq')
                    ExecBlock('CopiArq',.F.,.F., cPasta)               
                endif   
            else
                FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')                            
            endif       
    endif        
Return


