*** Settings ***
Documentation    Keywords para leitura de planilhas de ciclos de testes


*** Keywords ***
Ler Casos De Teste Do Ciclo
    [Documentation]    Lê arquivo de ciclo de testes e retorna lista de casos.
    ...                Cada caso é um dicionário com: id_cenario, cpf_cnpj, produtos, forma_pagamento
    ...                Args: ${ciclo_id} - ID do ciclo (ex: 369)
    ...                Returns: Lista de dicionários com dados dos pedidos
    [Arguments]    ${ciclo_id}
    ${casos}=    Evaluate
    ...    (lambda ciclo_id: __import__('sys').path.insert(0, 'C:/projetos/omni-robot/resources/libraries') or __import__('SpreadsheetReader').SpreadsheetReader().read_ciclo_de_testes(ciclo_id))(${ciclo_id})
    RETURN    ${casos}

Escrever Resultados CSV
    [Arguments]    ${resultados}    ${ciclo_id}
    ${caminho}=    Evaluate
    ...    (lambda r, c: __import__('sys').path.insert(0, 'C:/projetos/omni-robot/resources/libraries') or __import__('CSVWriter').CSVWriter().write_resultados_ciclo(r, c))(${resultados}, ${ciclo_id})
    Log    Resultados escritos em: ${caminho}    console=True

Ler Resultados CSV
    [Arguments]    ${ciclo_id}
    ${resultados}=    Evaluate
    ...    (lambda c: __import__('sys').path.insert(0, 'C:/projetos/omni-robot/resources/libraries') or __import__('CSVWriter').CSVWriter().read_resultados_ciclo(c))(${ciclo_id})
    RETURN    ${resultados}

Atualizar Resultados Com Id Retaguarda
    [Arguments]    ${resultados}    ${ciclo_id}
    ${caminho}=    Evaluate
    ...    (lambda r, c: __import__('sys').path.insert(0, 'C:/projetos/omni-robot/resources/libraries') or __import__('CSVWriter').CSVWriter().write_resultados_com_retaguarda(r, c))(${resultados}, ${ciclo_id})
    Log    CSV atualizado com id_retaguarda em: ${caminho}    console=True
