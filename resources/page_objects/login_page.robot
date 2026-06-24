*** Settings ***
Library     FlaUILibrary    uia_version=UIA3    screenshot_on_failure=True
Resource    ../locators/login_locators.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Preencher Usuario
    [Arguments]    ${usuario}
    Click    ${LOGIN_CAMPO_USUARIO}
    Evaluate    __import__('pyautogui').typewrite('${usuario}', interval=0.1)

Preencher Senha
    [Arguments]    ${senha}
    Click    ${LOGIN_CAMPO_SENHA}
    Evaluate    __import__('pyautogui').typewrite('${senha}', interval=0.1)

Clicar Em Entrar
    Click    ${LOGIN_BTN_ENTRAR}

Tela De Login Deve Estar Visivel
    Wait Until Element Exist    ${LOGIN_BTN_ENTRAR}

Fazer Login Venda
    [Arguments]    ${usuario}=${PDV_USUARIO}    ${senha}=${PDV_SENHA}
    Wait Until Element Is Enabled    ${LOGIN_VENDA_BTN_ENTRAR}
    Click    ${LOGIN_VENDA_CAMPO_USUARIO}
    Set Text To Textbox    ${LOGIN_VENDA_CAMPO_USUARIO}    ${usuario}
    Click    ${LOGIN_VENDA_CAMPO_SENHA}
    Evaluate    __import__('pyautogui').typewrite('${senha}', interval=0.1)
    Click    ${LOGIN_VENDA_BTN_ENTRAR}
