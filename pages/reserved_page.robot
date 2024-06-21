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
Preencher o campo Name
    [Arguments]    ${name}
    Input Text    ${txt_name}  ${name}    
Preencher o campo Address
    [Arguments]    ${address}
    Input Text    ${txt_address}    ${address}   
Preencher o campo City
    [Arguments]    ${city}
    Input Text    ${txt_city}    ${city}   
Preencher o campo State
    [Arguments]    ${state}
    Input Text    ${txt_state}    ${state}   
Preencher o campo Zip Code
    [Arguments]    ${zip_code}
    Input Text    ${txt_zipCode}    ${zip_code}
Preencher o campo Credit Card Number
    [Arguments]    ${credit_card_number}
    Input Text    ${txt_creditCardNumber}    ${credit_card_number}
Preencher o campo Name on Card
    [Arguments]    ${name_on_card}
    Input Text    ${txt_nameOnCard}    ${name_on_card}   
Clicar no botao Purchase Flight
    Click Button    ${btn_purchase_flight}