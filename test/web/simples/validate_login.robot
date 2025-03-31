*** Settings ***
Library    SeleniumLibrary

Resource    ../../../pages/base_page.robot

*** Variables ***
${BROWSER}      chrome
${BASE_URL}     https://www.blazedemo.com
${LOGIN_URL}    ${BASE_URL}/login
${EMAIL}        prueba@demo.com
${PASSWORD}     123456

*** Test Cases ***
Cargar Página De Login
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Title Should Be    BlazeDemo
    Page Should Contain Element    name=email
    Page Should Contain Element    name=password
    Page Should Contain Element    css=.btn.btn-primary
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/validate_login/1_Cargar Página De Login.jpg
    Close Browser

Login Con Credenciales Dummy
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    name=email        ${EMAIL}
    Input Text    name=password     ${PASSWORD}
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/validate_login/2_Login Con Credenciales Dummy.jpg
    Click Button    css=.btn.btn-primary
    Wait Until Page Contains    Page Expired    timeout=5s
    Close Browser


Login Sin Completar Campos
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Click Button    css=.btn.btn-primary
    Sleep    1s
    Capture Page Screenshot    screenshots/blazedemo/${date}/validate_login/3_Login Sin Completar Campos.jpg
    Wait Until Location Is    ${LOGIN_URL}    timeout=5s
    Close Browser

