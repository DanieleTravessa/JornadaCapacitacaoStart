/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E20 – Altere a rotina do exercício 17 para que no browse do cadastro de 
 alunos sejam apresentadas legendas da seguinte forma:
 o Alunos com mais de 18 anos:
 ? Legenda Verde
 o Alunos com menos de 18 anos:
 ? Legenda Vermelha
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function JsL4e20()

Local cAlias := "ZZS", cFiltro := ""

Local aCores := {{"ZZS->ZZS_IDADE > 18" , "ENABLE" },;
                {"ZZS->ZZS_IDADE <= 18", "DISABLE"}}

    Private cCadastro := "Cadastro de alunos"
    Private aRotina := {{ "Pesquisar" ,    "AxPesqui" ,     0, 1 },;
                        { "Visualizar",    "AxVisual" ,     0, 2 },;
                        { "Incluir" ,      "AxInclui" ,     0, 3 },;
                        { "Alterar" ,      "AxAltera" ,     0, 4 },;
                        { "Excluir" ,      "AxDeleta" ,     0, 5 },;
                        { "Alunos" ,       "U_JsL4e17",     0, 6 },;
                        { "Legenda" ,      "U_ZLegenda",   0, 7 }}

    DbSelectArea('ZZS')
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,aCores,,,,,,,,cFiltro)     

    DbCloseArea()

Return

User Function ZLegenda()

    Local aLegenda := {}

    aADD(aLegenda, {"BR_Verde", "Alunos com 18 anos ou mais."})
    aADD(aLegenda, {"BR_Vermelho", "Alunos com menos de 18 anos."})
    
    BrwLegenda("Legenda", "Maioridade", aLegenda)

Return
