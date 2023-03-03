/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 16: Elaborar um programa que permita o usuário digitar o NOME e 3 NOTAS de 
 4 alunos, esses dados, assim como a MÉDIA de cada aluno, devem ser
 armazenados em um único array. No final, exibir os dados (Nome, Notas e 
 Média) de cada aluno.
|--------------------------------------------------------------------------|*/
#INCLUDE"TOTVS.CH"

User Function JsL5e16()

    Local aDados := {} 
    Local nLinhas := 4, nMedia := 0
    Local nNota1 := 0, nNota2 := 0, nNota3 := 0, nI := 0
    Local cMsg := ""

    // Loop para preencher o array com os dados dos alunos
    For nI := 1 to nLinhas
        cNome := FwInputBox("Digite o nome do aluno " + cValtoChar(nI) + ":")
        nNota1 := Val(FwInputBox("Digite a primeira nota do aluno: "))
        nNota2 := Val(FwInputBox("Digite a segunda nota do aluno: "))
        nNota3 := Val(FwInputBox("Digite a terceira nota do aluno: "))
        nMedia := (nNota1 + nNota2 + nNota3) / 3

    // Adiciona os dados do aluno ao array
        aAdd(aDados, {cNome, nNota1, nNota2, nNota3, nMedia})
    Next nI

    // Loop para exibir os dados dos alunos
    For nI := 1 to nLinhas
        cMsg+=("Aluno " + cValToChar(nI) + ":" + CRLF +;
        "Nome: " + cValToChar(aDados[nI][1]) + CRLF +;
        "Notas1: " + cValToChar(aDados[nI][2]) + CRLF +;
        "Notas2: " + cValToChar(aDados[nI][3]) + CRLF +;
        "Notas3: " + cValToChar(aDados[nI][4]) + CRLF +;
        "Média: " + cValToChar(aDados[nI][5])) + CRLF + CRLF
    EndFor
    FwAlertInfo(cMsg, "Dados dos Alunos")
Return
