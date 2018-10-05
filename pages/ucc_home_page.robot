*** Settings ***
Documentation     Keywords for Portal Settings page
Library           SeleniumLibrary

*** Variables ***
&{UCHP_LOCATORS}    tutorial_welcome_button=tutorial-welcome-button
...                 end_tutorial_button=//button[@class='tutorial-end']
...                 meeting_icon=//uc-icon[@name='meeting']
...                 dashboard_header=//h1[text()='Dashboard']
...                 start_my_meeting_button=//div[@class='meeting-section']//button[contains(text(), 'Start My Meeting')]
...                 dialpad_icon_top=//div[@class='left']//md-icon[@md-font-icon='mdi-dialpad']
...                 phone_number_field=tel-input
...                 dial_phone_button=//button[@type='button']//md-icon[@md-font-icon='mdi-phone']

*** Keywords ***
Ucc Home Page Should Be Loaded
    [Documentation]    Check if UC home page is loaded and ready to use
    Wait Until Element Is Enabled    ${UCHP_LOCATORS.dashboard_header}
    Location Should Contain    /contacts

Handle First Time Tutorial
    ${IsElementVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${UCHP_LOCATORS.tutorial_welcome_button}
    Run Keyword If      ${IsElementVisible}    Click Element    ${UCHP_LOCATORS.tutorial_welcome_button}
    ...                 Wait Until Element Is Visible    ${UCHP_LOCATORS.end_tutorial_button}
    ...                 Click Element    ${UCHP_LOCATORS.end_tutorial_button}

Click Meeting Icon
    Wait Until Element Is Enabled    ${UCHP_LOCATORS.meeting_icon}
    Click Element    ${UCHP_LOCATORS.meeting_icon}

Click Start My Meeting Button
    Wait Until Element Is Visible    ${UCHP_LOCATORS.start_my_meeting_button}
    Click Element    ${UCHP_LOCATORS.start_my_meeting_button}

Click Dialpad Icon
    Wait Until Element Is Visible    ${UCHP_LOCATORS.dialpad_icon_top}
    Click Element    ${UCHP_LOCATORS.dialpad_icon_top}

Dial Phone Number
    [Arguments]    ${num}
    Wait Until Element Is Enabled    ${UCHP_LOCATORS.phone_number_field}
    Input Text    ${UCHP_LOCATORS.phone_number_field}    ${num}
    Wait Until Element Is Enabled    ${UCHP_LOCATORS.dial_phone_button}
    Click Element    ${UCHP_LOCATORS.dial_phone_button}