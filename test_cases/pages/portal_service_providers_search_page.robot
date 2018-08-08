*** Settings ***
Documentation     Keywords for Portal Home page
Library           SeleniumLibrary

*** Variables ***
&{PSPSP_LOCATORS}   selected_servive_provider_header=//li[@class='selected']//a[text()='Service Providers']
...                 settings_tab=//a[text()='Settings']
...                 new_service_provider_button=(//a[text()='New Service Provider'])[1]

*** Keywords ***
Service Providers Search Page Should Be Loaded
    [Documentation]    Check if the service providers search page is loaded and ready to use
    Wait Until Element Is Enabled    ${PSPSP_LOCATORS.selected_servive_provider_header}
    Location Should Contain    /service-provider

Click New Service Provider Button
    Wait Until Element Is Enabled    ${PSPSP_LOCATORS.new_service_provider_button}
    Click Element    ${PSPSP_LOCATORS.new_service_provider_button}