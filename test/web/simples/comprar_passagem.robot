*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser
*** Variables ***
${url}    https://www.blazedemo.com/
${browser}    Chrome
${timeout}    5000ms

*** Test Cases ***
Comprar Passagem
    Dado que acesso o site blazedemo
    Quando o escolho a cidade de partida
    E escolho a cidade de destino
    E clico no botao Find Flights
    Entao sou direcionado para a pagina de opcoes de voos
    E clico no botao Choose This Flight
    Entao sou direcionado para a pagina de reserva do voo
    Quando preencho o campo Name    Silvia
    E preencho o campo Address    Rua Principal, 123
    E preencho o campo City    New City
    E preencho o campo State    São Paulo
    E preencho o campo Zip Code    29000000
    E preencho o campo Credit Card Number    1000000001
    E preencho o campo Name on Card    Silvia Smith
    E clico no botao Purchase Flight
    Entao sou direcionado para a pagina de Thank you

*** Keywords ***
Dado que acesso o site blazedemo
    Open Browser  url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms
    Wait Until Element Contains    css=h1    Welcome to the Simple Travel Agency!

Quando o escolho a cidade de partida
    Select From List By Value    name=fromPort    Paris
E escolho a cidade de destino
    Select From List By Value    name=toPort    Rome
E clico no botao Find Flights
    Click Button    css=.btn.btn-primary
Entao sou direcionado para a pagina de opcoes de voos
    Wait Until Element Contains    css=h3    Flights from Paris to Rome:
E clico no botao Choose This Flight
    Click Button    css=.btn.btn-small
Entao sou direcionado para a pagina de reserva do voo
    Wait Until Element Contains    css=h2    Your flight from TLV to SFO has been reserved.
Quando preencho o campo Name
    [Arguments]    ${name}
    Input Text    id=inputName  ${name}    
E preencho o campo Address
    [Arguments]    ${address}
    Input Text    id=address    ${address}   
E preencho o campo City
    [Arguments]    ${city}
    Input Text    id=city    ${city}   
E preencho o campo State
    [Arguments]    ${state}
    Input Text    id=state    ${state}   
E preencho o campo Zip Code
    [Arguments]    ${zip_code}
    Input Text    id=zipCode    ${zip_code}
E preencho o campo Credit Card Number
    [Arguments]    ${credit_card_number}
    Input Text    id=creditCardNumber    ${credit_card_number}
E preencho o campo Name on Card
    [Arguments]    ${name_on_card}
    Input Text    id=nameOnCard    ${name_on_card}   
E clico no botao Purchase Flight
    Click Button    css=.btn.btn-primary
Entao sou direcionado para a pagina de Thank you
    Wait Until Element Contains    css=h1    Thank you for your purchase today!