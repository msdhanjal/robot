*** Settings ***
Library           ExcelLibrary
Library           OperatingSystem
Library           robot.api.logger
Library           Selenium2Library

*** Variables ***
${sFileName}      test_cases\\files\\TestSheet.xls    # DataSheet

*** Test Cases ***
TC_01_Taking URL from Excel
    Open given Excel file    ${sFileName}
    #Fetch the data from Excel for given Test Case and Column Name    \    SheetName    Row    Column
    ${sURL}    Get data from Excel with given column    Data    TC_01    Url
    Log    ${sURL}
    Log To Console    ${sURL}

*** Keywords ***
Open given Excel file
    [Arguments]    ${sFileName}
    #Check that the given Excel Exists
    ${inputfileStatus}    ${msg}    Run Keyword And Ignore Error    OperatingSystem.File Should Exist    ${sFileName}
    Run Keyword If    "${inputfileStatus}"=="PASS"    info    ${sFileName} Test data file exist    ELSE    Fail    Cannot locate the given Excel file.
    Open Excel    ${sFileName}

Get data from Excel with given column
    [Arguments]    ${sSheetName}    ${sTestCaseNo}    ${sColumnName}
    log    ${sColumnName}
    ${colCount}    Get Column Count    ${sSheetName}
    : FOR    ${y}    IN RANGE    0    ${colCount}
    \    ${header}    Read Cell Data By Coordinates    ${sSheetName}    ${y}    0
    \    #Check if this is the given header
    \    Run Keyword If    "${header}"=="${sColumnName}"    Set Test Variable    ${colNum}    ${y}
    log    ${colNum}
    #Get the total rows in the Sheet
    ${iTotalRows}    ExcelLibrary.Get Row Count    ${sSheetName}
    : FOR    ${iRowNo}    IN RANGE    1    ${iTotalRows}+1
    \    ${TC_Num}    Read Cell Data By Coordinates    ${sSheetName}    0    ${iRowNo}
    \    #Incase TestCase No is same , fetch the data from same row and given column No
    \    ${sSearchedData}    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    ExcelLibrary.Read Cell Data By Coordinates    ${sSheetName}    ${colNum}
    \    ...    ${iRowNo}
    \    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    Exit For Loop
    [Return]    ${sSearchedData}