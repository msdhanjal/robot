*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/portal_new_user_edit_page.robot
Resource          pages/portal_home_page.robot
Resource          pages/portal_settings_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String

*** Variables ***
${random}    ${EMPTY}

*** Test Cases ***
Meeting Test
    Open Qa Environment
    Portal Login Page Should Be Loaded
    Login With Credentials    account29100509    Password1
    Wait Until Element Is Enabled    //uc-icon[@name='meeting']
    Click Element    //uc-icon[@name='meeting']
    Wait Until Element Is Visible    //div[@class='meeting-section']//button[contains(text(), 'Start My Meeting')]
    Click Element    //div[@class='meeting-section']//button[contains(text(), 'Start My Meeting')]
    # Select Window    title=
    Sleep    5s
    Handle Alert    Allow
    Wait Until Element Is Visible    //div[@class='enter-meeting']//button[contains(text(), 'Enter Meeting')]    10s
    Click Element    //div[@class='enter-meeting']//button[contains(text(), 'Enter Meeting')]