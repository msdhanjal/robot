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
...                 tab_name=//a//span[contains(text(),'__TAB-NAME__')]
...                 expanded_tab_up_arrow=//a[contains(@class,'in') and span[contains(text(),'__TAB-NAME__')]]
...                 collapsed_tab=//a[not(contains(@class,'in')) and span[contains(text(),'__TAB-NAME__')]]
...                 collapsed_tab_down_arrow=//a[not(contains(@class,'in')) and span[contains(text(),'__TAB-NAME__')]]//i

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

Expand Tab
    [Arguments]    ${tab-name}
    ${COLLAPSED-TAB}=    Replace String    ${PCK_LOCATORS.collapsed_tab}    __TAB-NAME__    ${tab-name}
    ${COLLAPSED-ARROW}=    Replace String    ${PCK_LOCATORS.collapsed_tab_down_arrow}    __TAB-NAME__    ${tab-name}
    ${EXPANDED-TAB}=    Replace String    ${PCK_LOCATORS.expanded_tab_up_arrow}    __TAB-NAME__    ${tab-name}
    ${IsTabCollapsed}=    Run Keyword And Return Status    Element Should Be Visible    ${COLLAPSED-TAB}
    Run Keyword If      ${IsTabCollapsed}    Click Element    ${COLLAPSED-ARROW}
    Run Keyword If      ${IsTabCollapsed}    Wait Until Element Is Visible    ${EXPANDED-TAB}

Click Tab
    [Arguments]    ${tab-name}
    ${tab}=    Replace String    ${PCK_LOCATORS.tab_name}    __TAB-NAME__    ${tab-name}
    Wait Until Element Is Enabled    ${tab}
    Click Element    ${tab}
