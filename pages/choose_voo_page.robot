*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${btn_choose}    css=.btn.btn-small
${titulo_secao_choose}    css=h3

*** Keywords ***
Clicar no botao Choose This Flight
    Click Button    ${btn_choose}