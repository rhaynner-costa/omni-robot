*** Variables ***
# Aplicação
${APP_PATH}         C:\\Windows\\explorer.exe
${APP_ARGS}         shell:AppsFolder\\cab27191-0e0a-428d-9e66-80685c4e7393_8hxjckwd6myx4!App
${APP_TITLE}        PDV OMNI
${APP_PROCESS}      TOTVS.PDV.Omnishop

# Credenciais — substituir por variáveis de ambiente em CI
${PDV_USUARIO}      19
${PDV_SENHA}        1

# Dispositivo
${ID_DEVICE}        GON170102537

# Timeouts
${TIMEOUT}          15s
${SHORT_TIMEOUT}    5s
${LONG_TIMEOUT}     30s
