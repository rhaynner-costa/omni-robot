*** Settings ***
Documentation    TC001 - Iniciar atendimento, buscar cliente por CPF e adicionar produto
Resource         ../../resources/keywords/common_keywords.robot
Resource         ../../resources/keywords/db_keywords.robot
Resource         ../../resources/page_objects/atendimento_page.robot

Suite Setup      Run Keywords    Configurar Modo Pedido    AND    Iniciar PDV
Suite Teardown   Fechar PDV
Test Setup       Voltar Para Home

*** Test Cases ***
TC001 - Iniciar Atendimento Com Cliente Identificado Por CPF
    [Tags]    pedido    jornada_1
    Clicar Em Iniciar Atendimento
    Buscar Cliente    83073566104

    Adicionar Produto Por Codigo    1001
    Aplicar Vendedor Sem Codigo
    Selecionar Tipo Pedido E Iniciar Atendimento
    Produto Deve Estar No Carrinho    1001
    Clicar Em Tipo Entrega Do Produto    1001
    Selecionar Tipo Entrega    Retira Posterior

    Adicionar Produto Por Codigo    1002
    Produto Deve Estar No Carrinho    1002
    Clicar Em Tipo Entrega Do Produto    1002
    Selecionar Tipo Entrega    Entrega

    Clicar Em Avancar
    Tela De Negociacao Deve Estar Visivel
    Selecionar Pagamento Dinheiro
    Clicar Em Salvar Pedido
    Confirmar Salvar Atendimento Fim
    Salvar Pedido Sem Digitiar Numero
    Tela Home Deve Estar Visivel
