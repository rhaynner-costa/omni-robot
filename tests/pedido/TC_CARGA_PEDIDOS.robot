*** Settings ***
Documentation    TC - Carga de Pedidos via Planilha de Ciclo de Testes
Resource         ../../resources/keywords/common_keywords.robot
Resource         ../../resources/keywords/spreadsheet_keywords.robot
Resource         ../../resources/page_objects/home_page.robot
Resource         ../../resources/page_objects/atendimento_page.robot

Suite Setup      Run Keywords    Iniciar PDV
#Suite Teardown   Fechar PDV
Test Setup       Voltar Para Home


*** Test Cases ***
Processar Ciclo De Testes ${CICLO_ID}
    [Documentation]    Processa casos de teste de um ciclo específico
    ...                Cria pedidos a partir de dados em planilha XLSX
    [Tags]    carga_pedidos    ciclo_${CICLO_ID}
    
    # Ler dados da planilha
    ${casos}=    Ler Casos De Teste Do Ciclo    ${CICLO_ID}
    Log    Processando ${casos.__len__()} casos de teste do ciclo ${CICLO_ID}    console=True
    
    # Processar cada caso
    FOR    ${caso}    IN    @{casos}
        ${id_cenario}=    Set Variable    ${caso['id_cenario']}
        ${cpf_cnpj}=    Set Variable    ${caso['cpf_cnpj']}
        ${produtos}=    Set Variable    ${caso['produtos']}
        ${forma_pagamento}=    Set Variable    ${caso['forma_pagamento']}
        
        Log    Criando pedido: ${id_cenario}    console=True
        
        # 1. Iniciar atendimento
        Clicar Em Iniciar Atendimento
        
        # 2. Buscar cliente
        Buscar Cliente    ${cpf_cnpj}
        
        # 3. Adicionar primeiro produto e configurar
        ${primeiro_produto}=    Set Variable    ${produtos[0]}
        ${id_produto_1}=    Set Variable    ${primeiro_produto['id']}
        ${tipo_entrega_1}=    Set Variable    ${primeiro_produto['tipo_entrega']}
        
        Adicionar Produto Por Codigo    ${id_produto_1}
        Aplicar Vendedor Sem Codigo
        Selecionar Tipo Pedido E Iniciar Atendimento
        Produto Deve Estar No Carrinho    ${id_produto_1}
        Clicar Em Tipo Entrega Do Produto    ${id_produto_1}
        Selecionar Tipo Entrega    ${tipo_entrega_1}
        
        # 4. Adicionar demais produtos (se houver)
        ${indice}=    Set Variable    1
        FOR    ${produto}    IN    @{produtos}[1:]
            ${id_produto}=    Set Variable    ${produto['id']}
            ${tipo_entrega}=    Set Variable    ${produto['tipo_entrega']}
            
            Adicionar Produto Por Codigo    ${id_produto}
            Produto Deve Estar No Carrinho    ${id_produto}
            Clicar Em Tipo Entrega Do Produto    ${id_produto}
            Selecionar Tipo Entrega    ${tipo_entrega}
        END
        
        # 5. Avançar para negociação
        Clicar Em Avancar
        Tela De Negociacao Deve Estar Visivel
        
        # 6. Selecionar forma de pagamento
        Selecionar Forma Pagamento    ${forma_pagamento}
        
        # 7. Salvar pedido
        Clicar Em Salvar Pedido
        Confirmar Salvar Atendimento Fim
        Salvar Pedido Sem Digitiar Numero
        
        Log    Pedido ${id_cenario} criado com sucesso    console=True
    END

    # robot -d results -v CICLO_ID:369 tests/pedido/TC_CARGA_PEDIDOS.robot
