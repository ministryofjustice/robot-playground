*** Settings ***
Library   Selenium2Library
*** Variables ***
${Search Field}  search 
${Search Input}  dentures
${Click Search Button}  searchButton 
***Test Cases***
Wiki Search Test Case
    Open Browser  url=https://en.wikipedia.org/   browser=Chrome
         Input Text    ${Search Field}    ${Search Input}
         Click Button    ${Click Search Button}