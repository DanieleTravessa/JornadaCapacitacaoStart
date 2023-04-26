#INCLUDE'totvs.ch'

User Function GerDirPedV()
 
    Local cPasta := '\Pedidos_de_Vendas\'
  
    if !ExistDir(cPasta)
            If MakeDir(cPasta,/**/,.F.) == 0
                FwAlertSuccess('Pasta criada com sucesso!', 'Concluído!')            
            else
                FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')                            
            endif       
    endif        
Return cPasta
