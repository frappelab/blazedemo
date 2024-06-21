*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${titulo_secao_welcome}    css=h1
${select_from_port}    name=fromPort
${select_to_port}    name=toPort
${bton_find_flights}   css=.btn.btn-primary

*** Keywords ***
Escolher a cidade de partida
    [Arguments]    ${city_from_port}
    Select From List By Value    ${select_from_port}    ${city_from_port}
Escolher a cidade de destino
    [Arguments]    ${city_to_port}
    Select From List By Value    ${select_to_port}    ${city_to_port}
Clicar botao Find Flights
    Click Button    ${bton_find_flights}