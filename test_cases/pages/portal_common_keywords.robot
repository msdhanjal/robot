*** Settings ***
Documentation     Common keywords for portal
Library           String
Library           SeleniumLibrary

*** Variables ***
${default_env}      https://qa-web2.dev.coredial.com/login
${env}=             https://__ENV-NAME__-__WEB-X__.dev.coredial.com/login
${browser}=         chrome

&{PCK_LOCATORS}     search_box=//input[@id='searchBox']
...                 search_button=//button[text()='Search']
...                 search_results=//div[contains(@class, 'box-content')]//a[contains(text(), '__SEARCH-RESULT__')]
...                 email_field=email

*** Keywords ***
Open Environment
    [Arguments]    ${name}    ${webx}
    ${url}=    Replace String    ${env}    __ENV-NAME__    ${name}
    ${url}=    Replace String    ${url}    __WEB-X__    ${webx}
    Open Browser    ${url}    ${browser}

Open Default Environment
    Open Browser    ${default_env}    ${browser}

Search For
    [Arguments]    ${text}
    Wait Until Element Is Enabled    ${PCK_LOCATORS.search_box}
    Input Text    ${PCK_LOCATORS.search_box}    ${text}
    Click Element    ${PCK_LOCATORS.search_button}

Search Results Should Contain
    [Arguments]    ${search-text}
    ${result}=    Replace String    ${PCK_LOCATORS.search_results}    __SEARCH-RESULT__    ${search-text}
    Wait Until Element Is Visible    ${result}

Click Search Result
    [Arguments]    ${search-text}
    ${result}=    Replace String    ${PCK_LOCATORS.search_results}    __SEARCH-RESULT__    ${search-text}
    Click Element    ${result}

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Enabled    ${PCK_LOCATORS.email_field}
    Input Text    ${PCK_LOCATORS.email_field}    ${email}