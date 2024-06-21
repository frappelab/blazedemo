*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    welcome_page.robot
Resource    choose_voo_page.robot
Resource    reserved_page.robot
Resource    purchase_data.robot

*** Variables ***
${timeout}    10000ms
${url}    https://www.blazedemo.com/
${browser}    Chrome
${date}

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    8000ms
    Wait Until Element Contains    css=h1    Welcome to the Simple Travel Agency!
Fechar navegador
    Sleep    500ms 
    Close Browser
Obter Data e Hora
    ${date} =    Get Current Date    #Ler data e hora do Sistema Operacional
    ${date} =    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    ${date}    Set Global Variable    ${date}
Tirar Screenshot
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    screenshots/blazedemo/${date}/${TEST_NAME}/${screenshot_name}.jpg
