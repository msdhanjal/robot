*** Settings ***
Documentation     Keywords for Portal Service Providers Edit Page
Library           SeleniumLibrary

*** Variables ***
&{PSPEP_LOCATORS}   new_servive_provider_header=//span[text()='New Service Provider']
...                 company_name_field=//input[@id='companyName']
...                 identifier_field=//input[@id='identifier']
...                 content_prefix_field=//input[@id='prefix']
...                 asterisk_checkbox=//input[@id='platform_1']
...                 broadworks_checkbox=//input[@id='platform_2']
...                 street_field=//input[@id='street1']
...                 city_field=//input[@id='city']
...                 state_field=//select[@id='state']
...                 zipcode_field=//input[@id='zipCode']
...                 add_hostname_field=//input[@id='hostName']
...                 current_hostname_field=//select[@id='currentHostName']
...                 uc_meeting_hostname_field=//input[@id='meetingSubdomain']
...                 tax_automation_checkbox=//input[@id='Tax Automation']
...                 contract_type_field=//select[@id='statement_of_work_template_id']
...                 contract_effective_date=//input[@id='contract_effective_date']
...                 contract_duration_field=//input[@id='contract_duration']
...                 save_button=(//button[contains(text(), 'Save')])[1]

*** Keywords ***
New Service Providers Edit Page Should Be Loaded
    [Documentation]    Check if the service providers search page is loaded and ready to use
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.new_servive_provider_header}
    Location Should Contain    /service-provider/-1

Input Company Name
    [Arguments]    ${company-name}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.company_name_field}
    Input Text    ${PSPEP_LOCATORS.company_name_field}    ${company-name}

Input Identifier
    [Arguments]    ${identifier}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.identifier_field}
    Input Text    ${PSPEP_LOCATORS.identifier_field}    ${identifier}

Input Content Prefix
    [Arguments]    ${content-prefix}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.content_prefix_field}
    Input Text    ${PSPEP_LOCATORS.content_prefix_field}    ${content-prefix}

Select Asterisk Checkbox
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.asterisk_checkbox}
    Select Checkbox    ${PSPEP_LOCATORS.asterisk_checkbox}

Unselect Asterisk Checkbox
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.asterisk_checkbox}
    Unselect Checkbox    ${PSPEP_LOCATORS.asterisk_checkbox}

Select Broadworks Checkbox
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.broadworks_checkbox}
    Select Checkbox    ${PSPEP_LOCATORS.broadworks_checkbox}

Unselect Broadworks Checkbox
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.broadworks_checkbox}
    Unselect Checkbox    ${PSPEP_LOCATORS.broadworks_checkbox}

Input Street
    [Arguments]    ${street}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.street_field}
    Input Text    ${PSPEP_LOCATORS.street_field}    ${street}

Input City
    [Arguments]    ${city}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.city_field}
    Input Text    ${PSPEP_LOCATORS.city_field}    ${city}

Select State
    [Arguments]    ${street}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.state_field}
    Select From List By Label    ${PSPEP_LOCATORS.state_field}    ${street}