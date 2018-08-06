*** Settings ***
Documentation     Common keywords for portal
Library           String
Library           SeleniumLibrary

*** Variables ***
${env}=             https://__ENV-NAME__-__WEB-X__.dev.coredial.com/login
${browser}=         chrome

*** Keywords ***
Open Environment
    [Arguments]    ${name}    ${webx}
    ${url}=    Replace String    ${env}    __ENV-NAME__    ${name}
    ${url}=    Replace String    ${url}    __WEB-X__    ${webx}
    Open Browser    ${url}    ${browser}
