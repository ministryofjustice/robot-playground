*** Settings ***
library  Selenium2Library
*** Variables ***
${SearchInputBox}  gh-ac
${SearchButton}  gh-btn
*** Test Cases ***
ebay search test case
    Open Browser  url=https://www.ebay.co.uk/  browser=chrome
    Input Text    ${SearchInputBox}    millwall
    Click Button    ${SearchButton}