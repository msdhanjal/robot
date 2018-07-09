*** Settings ***
Library           DatabaseLibrary
Library           OperatingSystem

*** Variables ***
${DBHost}         q
${DBName}         a
${DBPass}         z
${DBPort}         e
${DBUser}         r

*** Test Cases ***
Data Base Test Case
    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Retrieve Row Count From    sip_buddies
    Retrieve Records From    sip_buddies

*** Keywords ***
Retrieve Row Count From
    [Arguments]    ${table-name}
    ${result}=    Row Count    SELECT id FROM ${table-name};
    Log    ${result}
    Log To Console    ${result}

Retrieve Records From
    [Arguments]    ${table-name}
    ${result}=    Execute SQL String    SELECT * FROM ${table-name};
    Log    ${result}
    Log To Console    ${result}
