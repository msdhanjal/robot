*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary

*** Test Cases ***
Create L1 User
    [Documentation]    Login as the admin and create a L4 User
    Open Stage2 Environment
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    
