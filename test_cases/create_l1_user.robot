*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary

*** Variables ***


*** Test Cases ***
Create L1 User
    [Documentation]    Login as the admin and create a L4 User
    Go to    https://qa-web2.dev.coredial.com/login
    Login With Credentials    admin    Password1
    Portal Login Page Should Be Loaded
