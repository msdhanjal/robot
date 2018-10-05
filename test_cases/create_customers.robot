*** Settings ***
Resource          ../pages/portal_login_page.robot
Resource          ../pages/portal_new_user_edit_page.robot
Resource          ../pages/portal_service_providers_search_page.robot
Resource          ../pages/portal_home_page.robot
Resource          ../pages/portal_settings_page.robot
Resource          ../pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String

*** Variables ***
${random}       ${EMPTY}
${sp}=          CD --Level 2

*** Test Cases ***
Create L2 User
    [Documentation]    Login as the admin and create a L2 user on a given service provider
    #Setup
    Open Environment    dev37    web
    Portal Login Page Should Be Loaded
    Login With Credentials    admin    Password1
    Portal Home Page Should Be Loaded
    Click On Service Providers Tab
    Service Providers Search Page Should Be Loaded
    Search For    ${sp}
    Search Results Should Contain    ${sp}
    Click Search Result    ${sp}
    User Should Be On L2 Level For    ${sp}
    Click On Customers Tab
    
    :FOR    ${i}    IN RANGE    300
    \   ${r}=    Generate Random String    5    [LOWER]
    \   Wait Until Element Is Visible    (//a[text()='New Customer'])[1]
    \   Click Element    (//a[text()='New Customer'])[1]
    \   Wait Until Element Is Visible    companyName
    \   Input Text    companyName    Test+${r}
    \   Wait Until Element Is Visible    email
    \   Input Text    email    test@test.com
    \   Wait Until Element Is Visible    billingEmail
    \   Input Text    billingEmail    test@test.com
    \   Wait Until Element Is Visible    techEmail
    \   Input Text    techEmail    test@test.com
    \   Wait Until Element Is Visible    context
    \   Input Text    context    aut${r}
    \   Select From List By Label    group_id    Default
    \   Wait Until Element Is Visible    available_tax_jurisdictions
    \   Click Element    //select[@id='available_tax_jurisdictions']//option[@value=1]
    \   Click Element    //button[contains(text(), 'Add')]
    \   Click Element    (//button[contains(text(), 'Save')])[1]
    \   Wait Until Element Is Visible    //p[contains(text(), 'Customer successfully created.')]



*** Keywords ***
Setup
    # Generate random string for new user data
    ${r}=    Generate Random String    3    [LOWER]
    Set Test Variable    ${random}    ${r}
    #Log    Random = ${random}
    