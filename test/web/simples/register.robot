*** Settings ***
Library    SeleniumLibrary

Resource    ../../../pages/base_page.robot

*** Variables ***
${BROWSER}       chrome
${BASE_URL}      https://www.blazedemo.com
${REGISTER_URL}  ${BASE_URL}/register
${NAME}          Andrés Tester
${COMPANY}       BlazeCorp
${EMAIL}         andres.test@demo.com
${PASSWORD}      clave123
${PASSWORD_2}    clave123
${BAD_PASSWORD}  diferente123

*** Test Cases ***
Cargar Página De Registro
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Title Should Be    BlazeDemo
    Page Should Contain Element    name=name
    Page Should Contain Element    name=company
    Page Should Contain Element    name=email
    Page Should Contain Element    name=password
    Page Should Contain Element    name=password_confirmation
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/register/1_registro_carga.jpg
    Page Should Contain Element    css=.btn.btn-primary
    Close Browser

Registro Exitoso Con Datos Válidos
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    name=name                      ${NAME}
    Input Text    name=company                  ${COMPANY}
    Input Text    name=email                    ${EMAIL}
    Input Text    name=password                 ${PASSWORD}
    Input Text    name=password_confirmation    ${PASSWORD_2}
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/register/2_Registro Exitoso Con Datos Válidos.jpg
    Click Button  css=.btn.btn-primary
    Wait Until Page Contains    Page Expired    timeout=5s
    Close Browser

Registro Fallido Por Contraseñas Distintas
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    name=name                     ${NAME}
    Input Text    name=company                  ${COMPANY}
    Input Text    name=email                    ${EMAIL}
    Input Text    name=password                 ${PASSWORD}
    Input Text    name=password_confirmation    ${BAD_PASSWORD}
    Click Button  css=.btn.btn-primary
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/register/3_Registro Fallido Por Contraseñas Distintas.jpg
    Location Should Be    ${REGISTER_URL}
    Close Browser

Registro Sin Llenar Campos
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Click Button  css=.btn.btn-primary
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/register/4_registro_campos_vacios.png
    Location Should Be    ${REGISTER_URL}
    Close Browser
