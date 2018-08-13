*** Settings ***
Library             SeleniumLibrary
Library             String
Library             Process
Library             OperatingSystem
Library             Telnet

*** Test Cases ***
Test Terminal
    # Run    ssh cdqa@uat-box.dev.coredial.com
    # Sleep    5s
    # Run    vssh    web
    # #Log To Console     ${frt}