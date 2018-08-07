*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/ucc_main_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String
Library           Dialogs

*** Variables ***
${random}    ${EMPTY}

*** Test Cases ***
Meeting Test
    Open Environment    uat    web2
    Portal Login Page Should Be Loaded
    Login With Credentials    bob1    Password1
    Handle First Time Tutorial
    Click Meeting Icon
    Click Start My Meeting Button
    Wait Until Keyword Succeeds    10s    2s    Select Window    NEW
    
    #Handle Alert    Allow
    Wait Until Element Is Visible    //div[@class='enter-meeting']//button[contains(text(), 'Enter Meeting')]    10s
    Click Element    //div[@class='enter-meeting']//button[contains(text(), 'Enter Meeting')]