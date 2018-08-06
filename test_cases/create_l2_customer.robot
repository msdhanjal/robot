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
Create L2 Customer
    [Documentation]    Login as the admin and create a L2 customer
    Setup
    Open Environment    uat    web2
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    Portal Home Page Should Be Loaded
    
    
*** Keywords ***
Setup
    # Generate random string for new user data
    ${r}=    Generate Random String    6    [UPPER][NUMBERS]
    Set Test Variable    ${random}    ${r}
    #Log    Random = ${random}
