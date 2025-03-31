*** Settings ***
Resource    ../../../pages/base_page.robot


*** Test Cases ***
Comprar Tiquete
    Tomar Screenshot    1_Welcome
    Escoger ciudad de origen   Paris
    Escoger ciudad de destino    Rome
    Tomar Screenshot    2_Ciudad elegida
    Click en boton Find Flights
    Element Text Should Be    ${title_choose}    Flights from Paris to Rome:
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
    
    
