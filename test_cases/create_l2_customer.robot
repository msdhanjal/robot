*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/portal_new_user_edit_page.robot
Resource          pages/portal_service_providers_search_page.robot
Resource          pages/portal_home_page.robot
Resource          pages/portal_settings_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String

*** Variables ***
${random}       ${EMPTY}
${sp}=          RobotTestServiceProvider

*** Test Cases ***
Create L2 User
    [Documentation]    Login as the admin and create a L2 customer
    Setup
    Open Environment    uat    web
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    Portal Home Page Should Be Loaded
    Click On Service Providers Tab
    Service Providers Search Page Should Be Loaded
    Click New Service Provider Button
    New Service Providers Edit Page Should Be Loaded

    User Should Be On L2 Level For    ${sp}+random
    
    Close All Browsers

*** Keywords ***
Setup
    # Generate random string for new user data
    ${r}=    Generate Random String    3    [UPPER][NUMBERS]
    Set Test Variable    ${random}    ${r}
    #Log    Random = ${random}
