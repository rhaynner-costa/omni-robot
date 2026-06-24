*** Variables ***
# Tela: Login
# Ferramenta de mapeamento: FlaUInspect.exe
# Formato: AutomationId primeiro, Name em segundo

# Campos — Modo Pedido
${LOGIN_CAMPO_USUARIO}          //*[@AutomationId='loginEntryUsuarioPedidoVenda']    # Name: Usuário
${LOGIN_CAMPO_SENHA}            //*[@AutomationId='loginEntrySenhaPedidoVenda']      # Name: Senha
${LOGIN_BTN_ENTRAR}             //*[@AutomationId='loginBtnEntrarPedidoVenda']       # Name: Entrar

# Campos — Modo Venda
${LOGIN_VENDA_CAMPO_USUARIO}    //*[@AutomationId='loginEntryUsuarioPdv']            # Name: Usuário
${LOGIN_VENDA_CAMPO_SENHA}      //*[@AutomationId='loginEntrySenhaPdv']              # Name: Senha
${LOGIN_VENDA_BTN_ENTRAR}       //*[@AutomationId='loginBtnEntrarPdv']               # Name: Entrar
