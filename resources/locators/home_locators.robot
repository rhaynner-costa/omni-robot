*** Variables ***
# Tela: Home — PDV OMNI
# Ferramenta de mapeamento: FlaUInspect.exe
# Formato: AutomationId primeiro, Name em segundo

# Modo Pedido
${HOME_LBL_BOAS_VINDAS}              //*[@AutomationId='homeLblBoasVindasPedidoVenda']
${HOME_BTN_INICIAR_ATENDIMENTO}      //*[@AutomationId='homeFrameIniciarAtendimentoCommand']

# Modo Venda
${HOME_BTN_RESGATAR_PRE_VENDA}       //*[@AutomationId='homeFrameResgatarPreVenda']    # Name: RESGATAR PRÉ-VENDA
