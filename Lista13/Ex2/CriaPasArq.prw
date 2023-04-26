#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function CriaPastaL13e1
    (Função para criação de uma pasta, exercício 2 da Lista 13)
    @type  Function
    @author Daniele Travessa
    @since 24/04/2023
    @version version    
    @see (links_or_references)
    /*/
User Function CriaPasArq()
 
    Local cCaminho := 'c:\temp\' //GETTEMPPATH()
    Local cPasta := 'Lista13_Ex1\'
    Local lSobrescreve
    
    if MsgYesNo('A pasta já existe no caminho selecionado, gostaria de sobrescrevê-la?','Sobrescreve?')
            lSobrescreve := .T. //MsgYesNo('A pasta já existe no caminho selecionado, gostaria de sobrescrevê-la?','Sobrescreve?')
        else
            FwAlertInfo('Procedimento cancelado pelo usuário', 'Pasta não foi criada!')  
        endif
    
    if !ExistDir(cCaminho + cPasta) .or. lSobrescreve == .T.
            If MakeDir(cCaminho + cPasta,/**/,.F.) == 0
                FwAlertSuccess('Pasta criada com sucesso!', 'Concluído!')
                If ExistBlock('CriaTxt')
                    ExecBlock('CriaTxt',.F.,.F., cCaminho + cPasta)               
                endif   
            else
                FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')                            
            endif         
    endif        
Return


