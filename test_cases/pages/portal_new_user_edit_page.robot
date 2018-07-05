*** Settings ***
Documentation     Keywords for new user edit page
Library           SeleniumLibrary

*** Variables ***
&{PNUP_LOCATORS}    new_user_header=//span[text()='New User']
...                 first_name_field=firstName
...                 last_name_field=lastName
...                 user_name_field=username
...                 password_field=password
...                 confirm_password_field=confirmPassword
...                 email_field=email
...                 save_button=(//button[@value='Save'])[1]

*** Keywords ***
New User Edit Page Should Be Loaded
    [Documentation]    Check if the new user edit page is loaded and ready to use
    Wait Until Page Contains Element    ${PNUP_LOCATORS.new_user_header}

Input First Name
    [Arguments]    ${first-name}
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.first_name_field}
    Input Text    ${PNUP_LOCATORS.first_name_field}    ${first-name}

Input Last Name
    [Arguments]    ${last-name}
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.last_name_field}
    Input Text    ${PNUP_LOCATORS.last_name_field}    ${last-name}

Input User Name
    [Arguments]    ${user-name}
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.user_name_field}
    Input Text    ${PNUP_LOCATORS.user_name_field}    ${user-name}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.password_field}
    Input Text    ${PNUP_LOCATORS.password_field}    ${password}

Input Confirm Password
    [Arguments]    ${confirm-password}
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.confirm_password_field}
    Input Text    ${PNUP_LOCATORS.confirm_password_field}    ${confirm-password}

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.email_field}
    Input Text    ${PNUP_LOCATORS.email_field}    ${email}

Click Save Button
    Wait Until Element Is Enabled    ${PNUP_LOCATORS.save_button}
    Click Element    ${PNUP_LOCATORS.save_button}
