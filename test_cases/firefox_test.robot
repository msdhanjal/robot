*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Firefox
    Open Browser    https://www.google.com    firefox

Chrome
    Open Browser    https://www.google.com    chrome