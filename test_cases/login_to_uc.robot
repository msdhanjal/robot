*** Settings ***
Resource          ../pages/portal_login_page.robot
Resource          ../pages/portal_new_user_edit_page.robot
Resource          ../pages/portal_home_page.robot
Resource          ../pages/portal_settings_page.robot
Resource          ../pages/portal_common_keywords.robot
Resource          ../pages/ucc_home_page.robot
Library           SeleniumLibrary
Library           String

*** Test Cases ***
Login To Uc
    [Documentation]    Login as an L4 into UC
    Open Environment    qa    web2
    Portal Login Page Should Be Loaded
    Login With Credentials    mani2    Password1
    Ucc Home Page Should Be Loaded
    Click Dialpad Icon
    Dial Phone Number    6097924388