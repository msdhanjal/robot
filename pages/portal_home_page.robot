*** Settings ***
Documentation     Keywords for Portal Home page
Library           SeleniumLibrary

*** Variables ***
&{PHP_LOCATORS}     home_tab=//a[text()='Home']
...                 settings_tab=//a[text()='Settings']
...                 service_providers_tab=//a[text()='Service Providers']
...                 l2_level_breadcrumb=//div[contains(@class, 'bread-wrap')]//a[@class='breadcrumb_item_link']//span[contains(text(), '__L2-SP__')]

*** Keywords ***
Portal Home Page Should Be Loaded
    [Documentation]    Check if the portal home page is loaded and ready to use
    Wait Until Element Is Enabled    ${PHP_LOCATORS.home_tab}
    Location Should Contain    coredial.com

Click On Settings Tab
    Wait Until Element Is Enabled    ${PHP_LOCATORS.settings_tab}
    Click Element    ${PHP_LOCATORS.settings_tab}

Click On Service Providers Tab
    Wait Until Element Is Enabled    ${PHP_LOCATORS.service_providers_tab}
    Click Element    ${PHP_LOCATORS.service_providers_tab}

User Should Be On L2 Level For
    [Arguments]    ${name}
    ${l2_name}=    Replace String    ${PHP_LOCATORS.l2_level_breadcrumb}    __L2-SP__    ${name}
    Wait Until Element Is Visible    ${l2_name}
    Location Should Contain    /provider/