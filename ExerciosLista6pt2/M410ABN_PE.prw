/*4 � Crie um Ponto de Entrada para que, caso o cancele a inclus�o de um novo Pedido de Venda,
seja apresentada uma mensagem com o seguinte texto: �Opera��o cancelada pelo usu�rio!�*/

#INCLUDE 'TOTVS.CH'

User Function M410ABN()

    Local aArea := GetArea()
    Local lRetorno := .F.
    
    If ExistBlock('Js2l6e4') 
        lRetorno := ExecBlock('Js2l6e4',.F.,.F.)
    EndIF

    RestArea(aArea)
RETURN

User Function Js2l6e4()

    Local aArea := GetArea()

        MSGALERT("Opera��o cancelada pelo usu�rio!","Opera��o Cancelada!")
     
    RestArea(aArea)
RETURN




