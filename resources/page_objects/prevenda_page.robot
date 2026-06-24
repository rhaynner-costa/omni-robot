*** Settings ***
Library     FlaUILibrary    uia_version=UIA3    screenshot_on_failure=True
Resource    ../locators/prevenda_locators.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Tela Pre Venda Deve Estar Visivel
    Wait Until Element Exist    ${PREVENDA_CAMPO_IDENTIFICACAO}

Informar Numero Pre Venda
    [Arguments]    ${numero}
    Click    ${PREVENDA_CAMPO_IDENTIFICACAO}
    ${keys}=    Create List    t'${numero}'
    Press Keys    ${keys}    ${PREVENDA_CAMPO_IDENTIFICACAO}
    Press Key    s'ENTER'    ${PREVENDA_CAMPO_IDENTIFICACAO}
    Sleep    1s
    Press Key    s'ENTER'    ${PREVENDA_CAMPO_IDENTIFICACAO}

Resgatar Pedido
    Wait Until Element Is Enabled    ${MODAL_DETALHES_BTN_RESGATAR}    10
    Click    ${MODAL_DETALHES_BTN_RESGATAR}
