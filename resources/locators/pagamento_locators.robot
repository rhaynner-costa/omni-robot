*** Variables ***
# Tela: Pagamento — PDV OMNI
# Ferramenta de mapeamento: FlaUInspect.exe
# Formato: AutomationId primeiro, Name em segundo

# Botões
${PAGAMENTO_BTN_FINALIZAR}              //*[@AutomationId='pagamentoFrameFinalizarPagamentoPedido']    # Name: Finalizar pagamento

# Modal Confirmação Forma de Pagamento
${MODAL_CONFIRMACAO_BTN_CONFIRMAR}      //*[@AutomationId='popupQuestionsBtnLogin']                    # Name: Confirmar

# Modal Impressão de Documento
${MODAL_IMPRESSAO_BTN_SIM}              //*[@AutomationId='popupAlertaBtnAcao']                        # Name: Sim

# Tela Transação Efetuada
${TRANSACAO_BTN_NOVA_VENDA}             //*[@AutomationId='TransacaoEfetuadaButtonNovaVendaCommand']   # Name: Nova Venda
