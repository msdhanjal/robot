*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Firefox
    Open Browser    https://www.yahoo.com    firefox
    Open Browser    https://www.google.com    chrome
    Switch Browser    1
    Click Element    uh-signin
    Switch Browser    2
    Input Text    lst-ib    apple
    Switch Browser    1
    Input Text    login-username    TestUsername
    Switch Browser    2
    Click Element    //a[text()='Gmail']

#Teardown
    #Close All Browsers