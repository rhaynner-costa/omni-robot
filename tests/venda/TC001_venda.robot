*** Settings ***
Documentation    TC001 - Venda
Resource         ../../resources/keywords/common_keywords.robot
Resource         ../../resources/keywords/db_keywords.robot
Resource         ../../resources/page_objects/login_page.robot
Resource         ../../resources/page_objects/home_page.robot
Resource         ../../resources/page_objects/prevenda_page.robot
Resource         ../../resources/page_objects/pagamento_page.robot

Suite Setup      Run Keywords    Configurar Modo Venda    AND    Iniciar PDV Venda
Suite Teardown   Fechar PDV
Test Setup       Tela Home Venda Deve Estar Visivel

*** Test Cases ***
TC001 - Resgatar Pre Venda
    [Tags]    venda    jornada_1
    ${numero_prevenda}=    Obter Numero Pre Venda Disponivel
    Clicar Em Resgatar Pre Venda
    Tela Pre Venda Deve Estar Visivel
    Informar Numero Pre Venda    ${numero_prevenda}
    Resgatar Pedido
    Tela Pagamento Deve Estar Visivel
    Finalizar Pagamento
    Confirmar Forma De Pagamento
    Confirmar Impressao Documento
    Tela Transacao Efetuada Deve Estar Visivel
