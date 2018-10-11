*** Settings ***
Resource          ../pages/portal_login_page.robot
Resource          ../pages/portal_new_user_edit_page.robot
Resource          ../pages/portal_home_page.robot
Resource          ../pages/portal_settings_page.robot
Resource          ../pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String

*** Variables ***
${random}    ${EMPTY}

*** Test Cases ***
Create L1 User
    [Documentation]    Login as the admin and create a L1 User
    Setup
    Open Environment    qa    web
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    Portal Home Page Should Be Loaded
    Click On Settings Tab
    Portal Settings Page Should Be Loaded
    Expand Tab    Manage Users
    # Click Tab    Server Settings
    Click Manage Users Tab
    Click New User Button
    New User Edit Page Should Be Loaded
    Input First Name    Robot+${random}
    Input Last Name    Test+${random}
    Input User Name    robotuser+${random}
    Input Password    Password1
    Input Confirm Password    Password1
    Input Email    robottest+${random}@coredial.com
    #Click Save Button
    Close All Browsers
    
*** Keywords ***
Setup
    # Generate random string for new user data
    ${r}=    Generate Random String    3    [UPPER][NUMBERS]
    Set Test Variable    ${random}    ${r}
    #Log    Random = ${random}
