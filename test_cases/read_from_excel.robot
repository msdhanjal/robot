*** Settings ***
Library           ExcelLibrary
Library           OperatingSystem
Library           robot.api.logger
Library           Selenium2Library

*** Variables ***
${file-name}      test_cases\\files\\TestSheet.xls

*** Test Cases ***
Get Value From Excel
    Open given Excel file    ${file-name}
    ${value}=    Sheet Name Test Case Name Column Name    Data    TC_02    Url
    Log    ${value}
    Log To Console    ${value}

*** Keywords ***
Open given Excel file
    [Arguments]    ${file-name}
    # Check that the given Excel Exists
    # ${inputfileStatus}    ${msg}    Run Keyword And Ignore Error    OperatingSystem.File Should Exist    ${file-name}
    # Run Keyword If    "${inputfileStatus}"=="PASS"    info    ${file-name} Test data file exist    ELSE    Fail    Cannot locate the given Excel file.
    Open Excel    ${file-name}

Sheet Name Test Case Name Column Name
    [Arguments]    ${sheet-name}    ${test-case-name}    ${column-name}
    log    ${column-name}
    ${column-count}    Get Column Count    ${sheet-name}
    : FOR    ${y}    IN RANGE    0    ${column-count}
    \    ${header}=    Read Cell Data By Coordinates    ${sheet-name}    ${y}    0
    \    #Check if this is the given header
    \    Run Keyword If    "${header}"=="${column-name}"    Set Test Variable    ${column-number}    ${y}
    log    ${column-number}
    #Get the total rows in the Sheet
    ${total-rows}    Get Row Count    ${sheet-name}
    : FOR    ${row-number}    IN RANGE    1    ${total-rows}+1
    \    ${TC_Num}=    Read Cell Data By Coordinates    ${sheet-name}    0    ${row-number}
    \    #Incase TestCase No is same , fetch the data from same row and given column No
    \    ${search-result}    Run Keyword If    "${test-case-name}"=="${TC_Num}"    Read Cell Data By Coordinates    ${sheet-name}    ${column-number}
    \    ...    ${row-number}
    \    Run Keyword If    "${test-case-name}"=="${TC_Num}"    Exit For Loop
    [Return]    ${search-result}