*** Settings ***
Resource    ../../../pages/base_page.robot
Library    ../../../.venv/Lib/site-packages/robot/libraries/XML.py
Test Template    Comprar Passagem

*** Test Cases ***
TC001    Boston    London
TC002    São Paolo    Berlin        
TC003    Portland    Buenos Aires
TC004    San Diego    Cairo
TC005    Mexico City    Dublin
TC006    Philadelphia    New York

*** Keywords ***
Comprar Passagem
    [Arguments]    ${city_from}    ${city_to_port}
    Tirar Screenshot    1_Welcome
    Escolher a cidade de partida    ${city_from}
    Escolher a cidade de destino    ${city_to_port}
    Tirar Screenshot    2_Cidades Escolhidas
    Clicar botao Find Flights
    Element Text Should Be    ${titulo_secao_choose}    Flights from ${city_from} to ${city_to_port}:
    Tirar Screenshot    3_Escolha o voo
    Clicar no botao Choose This Flight
    Tirar Screenshot    4_Preencher os dados da reserva
    Preencher o campo Name    Silvia
    Preencher o campo Address    Rua Principal, 123
    Preencher o campo City    New City
    Preencher o campo State    Espírito Santo
    Preencher o campo Zip Code    29000000
    Preencher o campo Credit Card Number    10000000001
    Preencher o campo Name on Card    Silvia Smith
    Tirar Screenshot    5_Reserva preenchida
    Clicar no botao Purchase Flight
    Tirar Screenshot    6_Dados da reserva    
    Element Text Should Be    ${titulo_secao_purchase_data}    Thank you for your purchase today!