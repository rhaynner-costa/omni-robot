*** Settings ***
Documentation    TC - Pagamento de Pedidos via CSV de Resultados
Library          Collections
Resource         ../../resources/keywords/common_keywords.robot
Resource         ../../resources/keywords/spreadsheet_keywords.robot
Resource         ../../resources/keywords/db_keywords.robot
Resource         ../../resources/page_objects/prevenda_page.robot
Resource         ../../resources/page_objects/pagamento_page.robot

Suite Setup      Run Keywords    Configurar Modo Venda    AND    Iniciar PDV Venda
Suite Teardown   Fechar PDV


*** Test Cases ***
Processar Pagamentos Ciclo ${CICLO_ID}
    [Documentation]    Processa pagamentos dos pedidos gerados no ciclo
    [Tags]    pagamento    ciclo_${CICLO_ID}

    ${resultados}=    Ler Resultados CSV    ${CICLO_ID}
    Log    Processando ${resultados.__len__()} resultados do ciclo ${CICLO_ID}    console=True

    @{falhas}=    Create List

    FOR    ${resultado}    IN    @{resultados}
        ${id_cenario}=          Set Variable    ${resultado['IdCenário']}
        ${numero_atendimento}=  Set Variable    ${resultado['NumeroAtendimento']}

        Continue For Loop If    '${numero_atendimento}' == 'FALHA_OBTER_NUMERO'

        Log    Pagando pedido: ${id_cenario} — Atendimento: ${numero_atendimento}    console=True

        TRY
            Voltar Para Home Venda
            Clicar Em Resgatar Pre Venda
            Informar Numero Pre Venda    ${numero_atendimento}
            Resgatar Pedido
            Tela Pagamento Deve Estar Visivel
            Finalizar Pagamento
            Confirmar Forma De Pagamento
            #Run Keyword And Ignore Error    Confirmar Impressao Documento
            Tela Transacao Efetuada Deve Estar Visivel
            ${id_retaguarda}=    Obter Id Retaguarda    ${numero_atendimento}
            Set To Dictionary    ${resultado}    id_retaguarda=${id_retaguarda}
            Log    Pagamento ${id_cenario} concluído com sucesso    console=True
        EXCEPT    AS    ${erro}
            Log    FALHA no pagamento ${id_cenario}: ${erro}    level=WARN    console=True
            Append To List    ${falhas}    ${id_cenario}
            Set To Dictionary    ${resultado}    id_retaguarda=FALHA_OBTER_RETAGUARDA
        END
    END

    Atualizar Resultados Com Id Retaguarda    ${resultados}    ${CICLO_ID}

    IF    len($falhas) > 0
        Fail    Pagamentos com falha: @{falhas}
    END

    # robot -d results -v CICLO_ID:369 tests/pedido/TC_PAGAMENTO_PEDIDOS.robot
