*** Settings ***
Documentation     Keywords for Portal Login page
Library           SeleniumLibrary

*** Variables ***
&{PLP_LOCATORS}     username=username
...                 password=password
...                 login_button=//button[text()='Sign In']

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${PLP_LOCATORS.username}    ${username}
    Input Text    ${PLP_LOCATORS.password}    ${password}
    Click Element    ${PLP_LOCATORS.login_button}

Portal Login Page Should Be Loaded
    [Documentation]    Check if the login page is loaded and ready to use
    Wait Until Element Is Enabled    ${PLP_LOCATORS.login_button}
    Location Should Contain    /login
    