*** Settings ***
Documentation     Keywords for Portal Service Providers Edit Page
Library           SeleniumLibrary

*** Variables ***
&{PSPEP_LOCATORS}   new_servive_provider_header=//span[text()='New Service Provider']
...                 company_name_field=companyName
...                 identifier_field=identifier
...                 content_prefix_field=prefix
...                 asterisk_checkbox=platform_1
...                 broadworks_checkbox=platform_2
...                 street_field=street1
...                 city_field=city
...                 state_field=state
...                 zipcode_field=zipCode
...                 add_hostname_field=hostName
...                 add_hostname_button=addHost
...                 current_hostname_field=currentHostName
...                 uc_meeting_hostname_field=meetingSubdomain
...                 tax_automation_checkbox=//input[@id='Tax Automation']
...                 contract_type_field=statement_of_work_template_id
...                 contract_effective_date=contract_effective_date
...                 contract_duration_field=contract_duration
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

Input Zipcode
    [Arguments]    ${zip}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.zipcode_field}
    Input Text    ${PSPEP_LOCATORS.zipcode_field}    ${zip}

Input Hostname
    [Arguments]    ${hostname}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.add_hostname_field}
    Input Text    ${PSPEP_LOCATORS.add_hostname_field}    ${hostname}

Click Add Hostname Button
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.add_hostname_button}
    Click Element    ${PSPEP_LOCATORS.add_hostname_button}

Input Uc Meeting Hostname
    [Arguments]    ${uc-hostname}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.uc_meeting_hostname_field}
    Input Text    ${PSPEP_LOCATORS.uc_meeting_hostname_field}    ${uc-hostname}

Select Tax Automation Checkbox
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.tax_automation_checkbox}
    Select Checkbox    ${PSPEP_LOCATORS.tax_automation_checkbox}

Unselect Tax Automation Checkbox
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.tax_automation_checkbox}
    Unelect Checkbox    ${PSPEP_LOCATORS.tax_automation_checkbox}

Select Contract Type
    [Arguments]    ${contract-type}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.contract_type_field}
    Select From List By Label    ${PSPEP_LOCATORS.contract_type_field}    ${contract-type}

Input Contract Effective Date
    [Arguments]    ${con-eff-date}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.contract_effective_date}
    Input Text    ${PSPEP_LOCATORS.contract_effective_date}    ${con-eff-date}

Input Contract Duration
    [Arguments]    ${con-duration}
    Wait Until Element Is Enabled    ${PSPEP_LOCATORS.contract_duration_field}
    Input Text    ${PSPEP_LOCATORS.contract_duration_field}    ${con-duration}