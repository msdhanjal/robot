*** Settings ***
Library           DatabaseLibrary
Library           OperatingSystem

*** Variables ***
${DBHost}         staging-web.dev.coredial.com
${DBName}         voiceaxis
${DBPass}         dr0az3eh
${DBPort}         3306
${DBUser}         voiceaxis

*** Test Cases ***
Data Base Test Case
    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Retrieve Row Count From
    Retrieve Records From

*** Keywords ***
Retrieve Row Count From
    # [Arguments]    ${table-name}
    ${result}=    Row Count    select * from user_extension where userId = 5;
    Log    ${result}
    Log To Console    ${result}

Retrieve Records From
    # [Arguments]    ${table-name}
    # ${result}=    Execute SQL String    select extensionId from user_extension where userId = 5;
    ${output} =    Query    select extensionId from user_extension where userId = 4;
    Log    ${output}
    # Log    ${result}
    Log To Console    ${output}
