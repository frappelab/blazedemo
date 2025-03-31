*** Settings ***
Library    SeleniumLibrary

Resource    ../../../pages/base_page.robot


*** Variables ***
${BROWSER}      chrome
${BASE_URL}     https://www.blazedemo.com
${RESET_URL}    ${BASE_URL}/password/reset
${EMAIL}        prueba@demo.com

*** Test Cases ***
Cargar Página De Recuperación De Contraseña
    Open Browser    ${RESET_URL}    ${BROWSER}
    Title Should Be    BlazeDemo
    Page Should Contain Element    name=email
    Page Should Contain Element    css=.btn.btn-primary
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/reset_password/1_Cargar Página De Recuperación De Contraseña.jpg
    Close Browser

Enviar Formulario Con Email Válido
    Open Browser    ${RESET_URL}    ${BROWSER}
    Input Text    name=email    ${EMAIL}
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/reset_password/2_Enviar Formulario Con Email Válido.jpg
    Click Button  css=.btn.btn-primary
    Wait Until Page Contains    Page Expired
    Close Browser

Enviar Formulario Sin Email
    Open Browser    ${RESET_URL}    ${BROWSER}
    Click Button  css=.btn.btn-primary
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/reset_password/3_Enviar Formulario Sin Email.jpg
    Location Should Be    ${RESET_URL}
    Close Browser
