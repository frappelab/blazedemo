*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${txt_name}    id=inputName
${txt_address}    id=address
${txt_city}    id=city
${txt_state}    id=state
${txt_zipCode}    id=zipCode
${txt_creditCardNumber}    id=creditCardNumber
${txt_nameOnCard}    id=nameOnCard
${btn_purchase_flight}    css=.btn.btn-primary

*** Keywords ***
completar el campo Name
    [Arguments]    ${name}
    Input Text    ${txt_name}  ${name}    
completar el campo Address
    [Arguments]    ${address}
    Input Text    ${txt_address}    ${address}   
completar el campo City
    [Arguments]    ${city}
    Input Text    ${txt_city}    ${city}   
completar el campo State
    [Arguments]    ${state}
    Input Text    ${txt_state}    ${state}   
completar el campo Zip Code
    [Arguments]    ${zip_code}
    Input Text    ${txt_zipCode}    ${zip_code}
completar el campo Credit Card Number
    [Arguments]    ${credit_card_number}
    Input Text    ${txt_creditCardNumber}    ${credit_card_number}
completar el campo Name on Card
    [Arguments]    ${name_on_card}
    Input Text    ${txt_nameOnCard}    ${name_on_card}   
Click en el boton comprar vuelo
    Click Button    ${btn_purchase_flight}