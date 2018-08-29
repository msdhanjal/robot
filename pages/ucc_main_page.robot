*** Settings ***
Documentation     Keywords for Portal Settings page
Library           SeleniumLibrary

*** Variables ***
&{UCMP_LOCATORS}    tutorial_welcome_button=tutorial-welcome-button
...                 end_tutorial_button=//button[@class='tutorial-end']
...                 meeting_icon=//uc-icon[@name='meeting']
...                 start_my_meeting_button=//div[@class='meeting-section']//button[contains(text(), 'Start My Meeting')]

*** Keywords ***
Handle First Time Tutorial
    ${IsElementVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${UCMP_LOCATORS.tutorial_welcome_button}
    Run Keyword If      ${IsElementVisible}    Click Element    ${UCMP_LOCATORS.tutorial_welcome_button}
    ...                 Wait Until Element Is Visible    ${UCMP_LOCATORS.end_tutorial_button}
    ...                 Click Element    ${UCMP_LOCATORS.end_tutorial_button}

Click Meeting Icon
    Wait Until Element Is Enabled    ${UCMP_LOCATORS.meeting_icon}
    Click Element    ${UCMP_LOCATORS.meeting_icon}

Click Start My Meeting Button
    Wait Until Element Is Visible    ${UCMP_LOCATORS.start_my_meeting_button}
    Click Element    ${UCMP_LOCATORS.start_my_meeting_button}

