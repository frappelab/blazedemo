*** Settings ***
Resource    ../../../pages/base_page.robot
Library    ../../../.venv/Lib/site-packages/robot/libraries/XML.py

*** Test Cases ***
Comprar Passagem
    Tirar Screenshot    1_Welcome
    Escolher a cidade de partida    Paris
    Escolher a cidade de destino    Rome
    Tirar Screenshot    2_Cidades Escolhidas
    Clicar botao Find Flights
    Element Text Should Be    ${titulo_secao_choose}    Flights from Paris to Rome:
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
    
    
