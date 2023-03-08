/*1 – Crie um ponto de entrada que seja executado na inclusão/alteração de produtos.
O objetivo desse PE é acrescentar o texto “Cad. Manual - ” antes da descrição do produto.
o Ex: “Cad. Manual – Fone de Ouvido”*/

#INCLUDE "TOTVS.CH"

User Function MT010ALT()

Local aArea := GetArea()
Local aAreaB1 := SB1->(GetArea())
Local lRet := .F.

    CadMan()

    RestArea(aAreaB1)
    RestArea(aArea)

Return lRet

Static Function CadMan()

    Local aArea := GetArea()

    RECLOCK("SB1", .F.)
        SB1->B1_DESC := ("Cad. Manual - " + M->B1_Desc)
    SB1->(MSUNLOCK())

    RestArea(aArea)
Return
