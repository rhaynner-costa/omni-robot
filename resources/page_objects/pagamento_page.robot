*** Settings ***
Library     FlaUILibrary    uia_version=UIA3    screenshot_on_failure=True
Resource    ../locators/pagamento_locators.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Tela Pagamento Deve Estar Visivel
    Wait Until Element Exist    ${PAGAMENTO_BTN_FINALIZAR}

Finalizar Pagamento
    Wait Until Element Is Enabled    ${PAGAMENTO_BTN_FINALIZAR}
    Click    ${PAGAMENTO_BTN_FINALIZAR}

Confirmar Forma De Pagamento
    Wait Until Element Is Enabled    ${MODAL_CONFIRMACAO_BTN_CONFIRMAR}    20
    Click    ${MODAL_CONFIRMACAO_BTN_CONFIRMAR}

Confirmar Impressao Documento
    Wait Until Element Is Enabled    ${MODAL_IMPRESSAO_BTN_SIM}
    Click    ${MODAL_IMPRESSAO_BTN_SIM}

Tela Transacao Efetuada Deve Estar Visivel
    Wait Until Element Exist    ${TRANSACAO_BTN_NOVA_VENDA}
