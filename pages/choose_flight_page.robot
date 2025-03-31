*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${btn_choose}    css=.btn.btn-small
${title_choose}    css=h3

*** Keywords ***
Click en el botón Elegir este vuelo
    Click Button    ${btn_choose}