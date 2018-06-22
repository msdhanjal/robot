*** Settings ***
Documentation     Common keywords for portal
Library           SeleniumLibrary

*** Variables ***
${qa}=              https://qa-web2.dev.coredial.com/login
${admin-qa}=        https://qa-web.dev.coredial.com/login
${uat}=             https://uat-web2.dev.coredial.com/login
${admin-uat}=       https://uat-web.dev.coredial.com/login
${stage2}=          https://stage2-web2.dev.coredial.com/login
${admin-stage2}=    https://stage2-web.dev.coredial.com/login

*** Keywords ***
Open Qa Environment
    [Arguments]
    Open Browser    ${qa}    chrome

Open Uat Environment
    [Arguments]
    Open Browser    ${uat}    chrome

Open Stage2 Environment
    [Arguments]
    Open Browser    ${stage2}    chrome