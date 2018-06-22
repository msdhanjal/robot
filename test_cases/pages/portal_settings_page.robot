*** Settings ***
Documentation     Keywords for Portal Settings page
Library           SeleniumLibrary

*** Variables ***
&{PSP_LOCATORS}     account_settings_header=//h1//span[text()='Account Settings']
...                 manage_users_tab=//span[text()='Manage Users']
...                 new_user_button=(//a[text()='New User'])[1]

*** Keywords ***
# Portal Settings Page Should Be Loaded
#     [Documentation]    Check if the portal settings page is loaded and ready to use
#     Wait Until Element Is Enabled    ${PSP_LOCATORS.account_settings_header}
#     Location Should Contain    /setting/account

Click Manage Users Tab
    [Documentation]    Clicks the Manage Users Tab
    Wait Until Element Is Enabled    ${PSP_LOCATORS.manage_users_tab}
    Click Element    ${PSP_LOCATORS.manage_users_tab}

Click New User Button
    Wait Until Element Is Enabled    ${PSP_LOCATORS.new_user_button}
    Click Element    ${PSP_LOCATORS.new_user_button}
