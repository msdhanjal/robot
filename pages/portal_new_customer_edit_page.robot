*** Settings ***
Documentation     Keywords for new customer edit page
Library           SeleniumLibrary

*** Variables ***
&{PNCP_LOCATORS}    new_customer_header=//span[text()='Add Customer']
...                 
*** Keywords ***
New Customer Edit Page Should Be Loaded
    [Documentation]    Check if the new user customer page is loaded and ready to use
    Wait Until Page Contains Element    ${PNCP_LOCATORS.new_user_header}
