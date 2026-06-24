*** Settings ***
Library     DatabaseLibrary
Resource    ../variables/db_variables.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Configurar Modo Pedido
    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Execute Sql String    UPDATE dispositivo SET modo_operacao=1 WHERE id_device='${ID_DEVICE}'
    Disconnect From Database

Configurar Modo Venda
    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Execute Sql String    UPDATE dispositivo SET modo_operacao=0 WHERE id_device='${ID_DEVICE}'
    Disconnect From Database

Obter Numero Pre Venda Disponivel
    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${result}=    Query    SELECT MAX(numero) FROM pre_venda WHERE situacao_pre_venda = 'DISPONIVEL'
    Disconnect From Database
    ${numero}=    Set Variable    ${result[0][0]}
    RETURN    ${numero}
