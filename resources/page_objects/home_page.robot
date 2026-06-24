*** Settings ***
Library     FlaUILibrary    uia_version=UIA3    screenshot_on_failure=True
Resource    ../locators/home_locators.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Clicar Em Iniciar Atendimento
    Wait Until Element Exist    ${HOME_BTN_INICIAR_ATENDIMENTO}
    Click    ${HOME_BTN_INICIAR_ATENDIMENTO}

Tela Home Deve Estar Visivel
    Wait Until Element Exist    ${HOME_LBL_BOAS_VINDAS}

Tela Home Venda Deve Estar Visivel
    Wait Until Element Exist    ${HOME_BTN_RESGATAR_PRE_VENDA}

Clicar Em Resgatar Pre Venda
    Wait Until Element Is Enabled    ${HOME_BTN_RESGATAR_PRE_VENDA}
    Click    ${HOME_BTN_RESGATAR_PRE_VENDA}
