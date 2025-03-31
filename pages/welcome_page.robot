*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${title_section_welcome}    css=h1
${select_from}    name=fromPort
${select_to}    name=toPort
${bton_find_flights}   css=.btn.btn-primary

*** Keywords ***
Escoger ciudad de origen
    [Arguments]    ${city_from}
    Select From List By Value    ${select_from}    ${city_from}
Escoger ciudad de destino
    [Arguments]    ${city_to}
    Select From List By Value    ${select_to}    ${city_to}
Click en boton Find Flights
    Click Button    ${bton_find_flights}