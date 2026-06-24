*** Variables ***
# Tela: Pré-Venda — PDV OMNI
# Ferramenta de mapeamento: FlaUInspect.exe
# Formato: AutomationId primeiro, Name em segundo

# Campos
${PREVENDA_CAMPO_IDENTIFICACAO}    //*[@AutomationId='resgatarPreVendaEntryIdentificacaoPreVenda']    # Name: Informe o número da pré-venda

# Botões
${PREVENDA_BTN_VOLTAR}                  //*[@AutomationId='resgatarPreVendaFrameVoltarUwp']                        # Name: Voltar

# Modal Detalhes do Pedido
${MODAL_DETALHES_BTN_RESGATAR}          //*[@AutomationId='PopUpDetalhesPedidoButtonResgatarPedidoCommand']         # Name: Resgatar pedido
