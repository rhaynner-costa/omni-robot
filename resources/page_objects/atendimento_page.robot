*** Settings ***
Library     FlaUILibrary    uia_version=UIA3    screenshot_on_failure=True
Resource    ../locators/atendimento_locators.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Buscar Cliente
    [Arguments]    ${identificacao_cliente}
    Wait Until Element Exist    ${ATEND_CAMPO_CLIENTE}
    Click    ${ATEND_CAMPO_CLIENTE}
    Set Text To Textbox    ${ATEND_CAMPO_CLIENTE}    ${identificacao_cliente}
    Press Key    s'ENTER'    ${ATEND_CAMPO_CLIENTE}

Aplicar Vendedor Sem Codigo
    Wait Until Element Is Enabled    ${MODAL_VENDEDOR_BTN_APLICAR}
    Click    ${MODAL_VENDEDOR_BTN_APLICAR}

Selecionar Tipo Pedido E Iniciar Atendimento
    Wait Until Element Is Enabled    ${MODAL_INICIAR_BTN_INICIAR}
    Click    ${MODAL_INICIAR_BTN_INICIAR}

Adicionar Produto Por Codigo
    [Arguments]    ${codigo_produto}
    Wait Until Element Exist    ${ATEND_CAMPO_PRODUTO}
    Click    ${ATEND_CAMPO_PRODUTO}
    Set Text To Textbox    ${ATEND_CAMPO_PRODUTO}    ${codigo_produto}
    Press Key    s'ENTER'    ${ATEND_CAMPO_PRODUTO}

Produto Deve Estar No Carrinho
    [Arguments]    ${codigo_produto}
    ${locator}=    Set Variable    //*[@AutomationId='carrinhoPedidoVendaLblTipoEntregaProduto${codigo_produto}']
    Wait Until Element Exist    ${locator}

Clicar Em Tipo Entrega Do Produto
    [Arguments]    ${codigo_produto}
    ${locator}=    Set Variable    //*[@AutomationId='carrinhoPedidoVendaLblTipoEntregaProduto${codigo_produto}']
    Click    ${locator}

Selecionar Tipo Entrega
    [Arguments]    ${tipo_entrega}
    Wait Until Element Exist    ${MODAL_TIPO_ENTREGA_COMBO}
    Click    ${MODAL_TIPO_ENTREGA_COMBO}
    Click    //*[@Name='${tipo_entrega}']
    Click    ${MODAL_TIPO_ENTREGA_BTN_SALVAR}

Clicar Em Avancar
    Click    ${ATEND_BTN_AVANCAR}

Clicar Em Salvar Pedido
    Click    ${ATEND_BTN_SALVAR_PEDIDO}

Confirmar Salvar Atendimento Fim
    Click    ${MODAL_SALVAR_BTN_SALVAR}

Salvar Pedido Sem Digitiar Numero
    Wait Until Element Exist    ${MODAL_SALVAR_PEDIDO_TITULO_FIM}
    Click    ${MODAL_SALVAR_PEDIDO_CAMPO_NUMPED}
    Click    ${MODAL_SALVAR_PEDIDO_BTN_SALVAR}

Tela De Negociacao Deve Estar Visivel
    Wait Until Element Exist    ${NEGOCIACAO_LBL_TITULO}

Selecionar Pagamento Dinheiro
    Click    ${NEGOCIACAO_BTN_DINHEIRO}

Selecionar Forma Pagamento
    [Arguments]    ${forma_pagamento}
    ${forma_normalizada}=    Evaluate    '${forma_pagamento}'.lower().capitalize()
    ${locator}=    Set Variable    //*[@AutomationId='PagamentoPedidoVendaFrame${forma_normalizada}']
    Wait Until Element Exist    ${locator}
    Click    ${locator}
