#INCLUDE'totvs.ch'

User Function MT410TOK()

    Local aArea := GetArea()
    //Local aAreaC5 := SC5->(GetArea())
    Local nOper := PARAMIXB[1]
    Local lRetorno := .T.
    
    If nOper == 3 .or. nOper == 4 
        If ExistBlock('RelAutVend') 
            lRetorno := ExecBlock('RelAutVend',.F.,.F.)
        EndIF
    EndIf        
   
    //RestArea(aAreaC5)
    RestArea(aArea)
    
Return lRetorno
