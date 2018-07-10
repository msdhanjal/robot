*** Settings ***
Documentation     Common keywords for portal
Library           SeleniumLibrary

*** Variables ***
${env}=             https://qa-web2.dev.coredial.com/login
${qa}=              https://qa-web3.dev.coredial.com/login
${admin-qa}=        https://qa-web.dev.coredial.com/login
${uat}=             https://uat-web2.dev.coredial.com/login
${admin-uat}=       https://uat-web.dev.coredial.com/login
${stage2}=          https://stage2-web2.dev.coredial.com/login
${admin-stage2}=    https://stage2-web.dev.coredial.com/login
${browser}=         chrome

*** Keywords ***
Open Environment
    Open Browser    ${env}    ${browser}

Open Qa Environment
    [Arguments]
    Open Browser    ${qa}    ${browser}

Open Uat Environment
    [Arguments]
    Open Browser    ${uat}    ${browser}

Open Stage2 Environment
    [Arguments]
    Open Browser    ${stage2}    ${browser}

Open Qa Admin Environment
    [Arguments]
    Open Browser    ${admin-qa}    ${browser}

Open Uat Admin Environment
    [Arguments]
    Open Browser    ${admin-uat}    ${browser}

Open Stage2 Admin Environment
    [Arguments]
    Open Browser    ${admin-stage2}    ${browser}
    