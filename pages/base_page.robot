*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    welcome_page.robot
Resource    choose_flight_page.robot
Resource    reserved_page.robot
Resource    purchase_data.robot

*** Variables ***
${timeout}    10000ms
${url}    https://www.blazedemo.com/
${browser}    Chrome
${date}

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tomar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    8000ms
    Wait Until Element Contains    css=h1    Welcome to the Simple Travel Agency!
Cerrar navegador
    Sleep    500ms 
    Close Browser
Obtener fecha y hora
    ${date} =    Get Current Date    #Leer fecha y hora del sistema operativo
    ${date} =    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    ${date}    Set Global Variable    ${date}
Tomar Screenshot
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    screenshots/blazedemo/${date}/${TEST_NAME}/${screenshot_name}.jpg
