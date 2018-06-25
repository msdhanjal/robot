*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/new_user_edit_page.robot
Resource          pages/portal_home_page.robot
Resource          pages/portal_settings_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String

*** Variables ***
${random}    ${EMPTY}

*** Test Cases ***
Create L1 User
    [Documentation]    Login as the admin and create a L4 User
    Setup
    # Open Stage2 Admin Environment
    Open Qa Admin Environment
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    Portal Home Page Should Be Loaded
    Go To Settings
    Portal Settings Page Should Be Loaded
    Click Manage Users Tab
    Click New User Button
    New User Edit Page Should Be Loaded
    Input First Name    Robot+${random}
    Input Last Name    Test+${random}
    Input User Name    robotuser+${random}
    Input Password    Password1
    Input Confirm Password    Password1
    Input Email    robottest+${random}@coredial.com
    Click Save Button
    
*** Keywords ***
Setup
    # Generate random string for new user data
    ${r}=    Generate Random String    6    [UPPER][NUMBERS]
    Set Test Variable    ${random}    ${r}
    #Log    Random = ${random}
