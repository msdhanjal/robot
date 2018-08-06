*** Settings ***
Documentation     Keywords for Portal Home page
Library           SeleniumLibrary

*** Variables ***
&{SPSP_LOCATORS}    selected_servive_provider_header=//li[@class='selected']//a[text()='Service Providers']
...                 settings_tab=//a[text()='Settings']

*** Keywords ***
Service Providers Search Page Should Be Loaded
    [Documentation]    Check if the service providers search page is loaded and ready to use
    Wait Until Element Is Enabled    ${SPSP_LOCATORS.selected_servive_provider_header}
    Location Should Contain    /service-provider