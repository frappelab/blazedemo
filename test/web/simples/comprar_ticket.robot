*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser
*** Variables ***
${url}    https://www.blazedemo.com/
${browser}    Chrome
${timeout}    5000ms

*** Test Cases ***
Comprar Tiquete
    Dado que accedo al sitio blazedemo
    Cuando elijo la ciudad de partida
    Y elijo la ciudad de destino
    Y hago click en el botón Find Flights
    Entonces soy dirigido a la página de opciones de vuelos
    Y hago click en el botón Choose This Flight
    Entonces soy dirigido a la página de reserva del vuelo
    Cuando lleno el campo Name    Silvia
    Y lleno el campo Address    Rua Principal, 123
    Y lleno el campo City    New City
    Y lleno el campo State    São Paulo
    Y lleno el campo Zip Code    29000000
    Y lleno el campo Credit Card Number    1000000001
    Y lleno el campo Name on Card    Silvia Smith
    Y hago click en el botón Purchase Flight
    Entonces soy dirigido a la página de Thank you

*** Keywords ***
Dado que accedo al sitio blazedemo
    Open Browser  url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms
    Wait Until Element Contains    css=h1    Welcome to the Simple Travel Agency!

Cuando elijo la ciudad de partida
    Select From List By Value    name=fromPort    Paris

Y elijo la ciudad de destino
    Select From List By Value    name=toPort    Rome

Y hago click en el botón Find Flights
    Click Button    css=.btn.btn-primary

Entonces soy dirigido a la página de opciones de vuelos
    Wait Until Element Contains    css=h3    Flights from Paris to Rome:

Y hago click en el botón Choose This Flight
    Click Button    css=.btn.btn-small

Entonces soy dirigido a la página de reserva del vuelo
    Wait Until Element Contains    css=h2    Your flight from TLV to SFO has been reserved.

Cuando lleno el campo Name
    [Arguments]    ${name}
    Input Text    id=inputName  ${name}    

Y lleno el campo Address
    [Arguments]    ${address}
    Input Text    id=address    ${address}   

Y lleno el campo City
    [Arguments]    ${city}
    Input Text    id=city    ${city}   

Y lleno el campo State
    [Arguments]    ${state}
    Input Text    id=state    ${state}   

Y lleno el campo Zip Code
    [Arguments]    ${zip_code}
    Input Text    id=zipCode    ${zip_code}

Y lleno el campo Credit Card Number
    [Arguments]    ${credit_card_number}
    Input Text    id=creditCardNumber    ${credit_card_number}

Y lleno el campo Name on Card
    [Arguments]    ${name_on_card}
    Input Text    id=nameOnCard    ${name_on_card}   

Y hago click en el botón Purchase Flight
    Click Button    css=.btn.btn-primary

Entonces soy dirigido a la página de Thank you
    Wait Until Element Contains    css=h1    Thank you for your purchase today!