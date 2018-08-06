*** Settings ***
Resource          pages/portal_common_keywords.robot
Library           SeleniumLibrary
Library           String

*** Test Cases ***
Test
    Open Environment    uat    web2