*** Settings ***
Library     FlaUILibrary    uia_version=UIA3    screenshot_on_failure=True
Library     Process
Library     OperatingSystem
Resource    ../variables/common_variables.robot
Resource    ../locators/menu_locators.robot
Resource    ../page_objects/login_page.robot
Resource    ../page_objects/home_page.robot


*** Keywords ***
Obter PID Do PDV
    ${result}=    Run Process    powershell    -Command    (Get-Process -Name '${APP_PROCESS}').Id    shell=True
    ${pid}=       Convert To Integer    ${result.stdout.strip()}
    RETURN        ${pid}

Abrir PDV OMNI
    Run Keyword And Ignore Error    OperatingSystem.Run    taskkill /f /im ${APP_PROCESS}.exe
    Run Process    powershell    -Command    Start-Process 'shell:AppsFolder\\cab27191-0e0a-428d-9e66-80685c4e7393_8hxjckwd6myx4!App'    shell=True
    Sleep    6s
    ${pid}=    Obter PID Do PDV
    Attach Application By PID    ${pid}

Fechar PDV
    Run Process    powershell    -Command    Stop-Process -Name '${APP_PROCESS}' -Force    shell=True

Voltar Para Home
    Click    ${MENU_BTN_ABRIR_NAVEGACAO}
    Click    ${MENU_ITEM_HOME}
    Tela Home Deve Estar Visivel 

Iniciar PDV
    [Arguments]    ${usuario}=${PDV_USUARIO}    ${senha}=${PDV_SENHA}
    ${result}=    Run Process    powershell    -Command    (Get-Process -Name '${APP_PROCESS}' -ErrorAction SilentlyContinue).Id    shell=True
    ${pid_str}=    Set Variable    ${result.stdout.strip()}
    ${aberto}=    Run Keyword And Return Status    Should Not Be Empty    ${pid_str}
    IF    ${aberto}
        ${pid}=    Convert To Integer    ${pid_str}
        Attach Application By PID    ${pid}
    ELSE
        Abrir PDV OMNI
        Tela De Login Deve Estar Visivel
        Preencher Usuario    ${usuario}
        Preencher Senha      ${senha}
        Clicar Em Entrar
        Tela Home Deve Estar Visivel
    END

Iniciar PDV Venda
    [Arguments]    ${usuario}=${PDV_USUARIO}    ${senha}=${PDV_SENHA}
    ${result}=    Run Process    powershell    -Command    (Get-Process -Name '${APP_PROCESS}' -ErrorAction SilentlyContinue).Id    shell=True
    ${pid_str}=    Set Variable    ${result.stdout.strip()}
    ${aberto}=    Run Keyword And Return Status    Should Not Be Empty    ${pid_str}
    IF    ${aberto}
        ${pid}=    Convert To Integer    ${pid_str}
        Attach Application By PID    ${pid}
        ${modo_venda}=    Run Keyword And Return Status    Wait Until Element Exist    ${HOME_BTN_RESGATAR_PRE_VENDA}    2
        IF    not ${modo_venda}
            Abrir PDV OMNI
            Fazer Login Venda    ${usuario}    ${senha}
            Tela Home Venda Deve Estar Visivel
        END
    ELSE
        Abrir PDV OMNI
        Fazer Login Venda    ${usuario}    ${senha}
        Tela Home Venda Deve Estar Visivel
    END