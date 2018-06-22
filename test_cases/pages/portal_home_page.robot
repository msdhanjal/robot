*** Settings ***
Documentation     Keywords for Portal Home page
Library           SeleniumLibrary

*** Variables ***
&{PHP_LOCATORS}     home_tab=//a[text()='Home']
...                 settings_tab=//a[text()='Settings']

*** Keywords ***
Portal Home Page Should Be Loaded
    [Documentation]    Check if the portal home page is loaded and ready to use
    Wait Until Element Is Enabled    ${PHP_LOCATORS.home_tab}
    Location Should Contain    coredial.com

Go To Settings
    Wait Until Element Is Enabled    ${PHP_LOCATORS.settings_tab}
    Click Element    ${PHP_LOCATORS.settings_tab}

