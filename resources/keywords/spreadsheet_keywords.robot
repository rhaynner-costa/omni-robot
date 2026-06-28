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
