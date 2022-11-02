*** Settings ***
Library   Selenium2Library
*** Variables ***
${Search Field}  gh-ac 
${Search Input}  dentures
${Click Search Button}  gh-btn 
*** Test Cases ***
Ebay Search Test Case
    Open Browser  url=https://www.ebay.co.uk/  browser=Chrome
    Input Text    ${Search Field}    ${Search Input} 
    Click Button    ${Click Search Button}
    #there cannot be more than 1 space inside a string (see below)
    Click Element    css:#srp-river-results li:nth-child(3) a