*** Settings ***
Resource    ../../../pages/base_page.robot
Suite Setup     Obtener fecha y hora
Test Setup    base_page.Abrir navegador
Test Teardown    base_page.Cerrar navegador