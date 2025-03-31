*** Settings ***
Resource    ../../../pages/base_page.robot

Test Template    Comprar Tiquete

*** Test Cases ***
DB001    Boston    London
DB002    São Paolo    Berlin        
DB003    Portland    Buenos Aires
DB004    San Diego    Cairo
DB005    Mexico City    Dublin
DB006    Philadelphia    New York

*** Keywords ***
Comprar Tiquete
    [Arguments]    ${city_from}    ${city_to}
    Tomar Screenshot    1_Welcome
    Escoger ciudad de origen   ${city_from}
    Escoger ciudad de destino    ${city_to}
    Tomar Screenshot    2_Ciudad elegida
    Click en boton Find Flights
    Element Text Should Be    ${title_choose}    Flights from ${city_from} to ${city_to}:
    Tomar Screenshot    3_Elige vuelo
    Click en el botón Elegir este vuelo
    Tomar Screenshot    4_Completar datos de reserva
    completar el campo Name    Silvia
    completar el campo Address    Rua Principal, 123
    completar el campo City    New City
    completar el campo State    Espírito Santo
    completar el campo Zip Code    29000000
    completar el campo Credit Card Number    10000000001
    completar el campo Name on Card    Silvia Smith
    Tomar Screenshot    5_Reserva completa
    Click en el boton comprar vuelo
    Tomar Screenshot    6_Dados da reserva    
    Element Text Should Be    ${title_purchase_data}    Thank you for your purchase today!