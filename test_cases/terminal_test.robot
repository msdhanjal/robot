*** Settings ***
Library             SeleniumLibrary
Library             String
Library             Process
Library             OperatingSystem
Library             Telnet

*** Test Cases ***
Test Terminal
    ${r}=    Run    pwd
    Log To Console    ${r}
    Run    cd ..
    ${r2}=    Run    pwd
    Log To Console    ${r2}

    # Sleep    5s
    # Run    vssh    web
    # #Log To Console     ${frt}