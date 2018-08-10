*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/portal_new_user_edit_page.robot
Resource          pages/portal_service_providers_search_page.robot
Resource          pages/portal_service_providers_edit_page.robot
Resource          pages/portal_home_page.robot
Resource          pages/portal_settings_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String
Library           Dialogs

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
    #${company}=    Get Value From User    Please enter Company Name
    Input Company Name    Test
    Input Identifier    Test
    Input Content Prefix    Test
    Select Asterisk Checkbox
    Input Email    Test@Test.com
    Input City    Test
    Input Street    1111
    Select State    Pennsylvania
    Input Zipcode    12125
    Input Hostname    TestHost
    Click Add Hostname Button
    Input Uc Meeting Hostname    www.test2
    Select Tax Automation Checkbox
    Select Contract Type    Premier
    Input Contract Effective Date    08/07/2018
    Input Contract Duration    5
    
    Close All Browsers

*** Keywords ***
Setup
    # Generate random string for new user data
    ${r}=    Generate Random String    3    [UPPER][NUMBERS]
    Set Test Variable    ${random}    ${r}
    #Log    Random = ${random}
