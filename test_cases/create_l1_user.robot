*** Settings ***
Resource          pages/portal_login_page.robot
Resource          pages/new_user_edit_page.robot
Resource          pages/portal_home_page.robot
Resource          pages/portal_settings_page.robot
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary

*** Test Cases ***
Create L1 User
    [Documentation]    Login as the admin and create a L4 User
    Open Stage2 Admin Environment
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    Portal Home Page Should Be Loaded
    Go To Settings
    #Portal Settings Page Should Be Loaded
    Click Manage Users Tab
    Click New User Button
    New User Edit Page Should Be Loaded
    Input First Name    Robot1
    Input Last Name    Test1
    Input User Name    robotuser
    Input Password    Password1
    Input Confirm Password    Password1
    Input Email    robottest@coredial.com
    Click Save Button
    
