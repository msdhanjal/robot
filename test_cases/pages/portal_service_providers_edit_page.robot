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
...                 email_field=//input[@id='email']
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