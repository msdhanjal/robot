*** Settings ***
Library             SeleniumLibrary
Library             String
Library             Process
Library             OperatingSystem
Library             Telnet

*** Test Cases ***
Test IPConfig
    Run    ssh cdqa@uat-box.dev.coredial.com
    #Log To Console     ${frt}