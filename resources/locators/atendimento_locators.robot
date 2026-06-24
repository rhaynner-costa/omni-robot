*** Variables ***
# Tela: Atendimento
# Ferramenta de mapeamento: FlaUInspect.exe
# Formato: AutomationId primeiro, Name em segundo

# Busca de cliente — também identifica a tela de Atendimento
${ATEND_CAMPO_CLIENTE}              //*[@AutomationId='identificacaoClienteEntryIdentificacao']

# Busca de produto
${ATEND_CAMPO_PRODUTO}              //*[@AutomationId='customPesquisarProdutoTxtConsultarProduto']

# Botões de ação do atendimento ativo
${ATEND_BTN_AVANCAR}                //*[@AutomationId='PrincipalPedidoVendaBtnAvancar']
${ATEND_BTN_SALVAR_PEDIDO}          //*[@AutomationId='PrincipalPedidoVendaBtnSalvarOrcamento']

# Modal: Tipo de Entrega
${MODAL_TIPO_ENTREGA_COMBO}         //*[@AutomationId='popupTipoEntryTipoEntrega']
${MODAL_TIPO_ENTREGA_BTN_SALVAR}    //*[@Name='Salvar']

# Modal: Vendedor
${MODAL_VENDEDOR_BTN_APLICAR}       //*[@AutomationId='popupQuestionsBtnLogin' and @Name='Aplicar']

# Modal: Iniciar Atendimento
${MODAL_INICIAR_BTN_INICIAR}        //*[@AutomationId='popUpIniciarAtendimentoBtnIniciarAtendimento']

# Tela: Negociação do Pedido
${NEGOCIACAO_LBL_TITULO}            //*[@AutomationId='PagamentoPedidoVendaLblPagamentoPedidoAtendimento']
${NEGOCIACAO_BTN_DINHEIRO}          //*[@AutomationId='PagamentoPedidoVendaFrameDinheiro']

# Modal: Salvar Atendimento (confirmação)
${MODAL_SALVAR_BTN_SALVAR}          //*[@AutomationId='popupAlertaBtnAcao']

# Modal: Salvar Pedido (fim do fluxo)
${MODAL_SALVAR_PEDIDO_TITULO_FIM}    //*[@AutomationId='popupQuestionsLblTitulo' and @Name='Salvar pedido']
${MODAL_SALVAR_PEDIDO_CAMPO_NUMPED}  //*[@AutomationId='popupQuestionsEntryCodigoVendedor']
${MODAL_SALVAR_PEDIDO_BTN_SALVAR}    //*[@AutomationId='popupQuestionsBtnLogin' and @Name='Salvar']
