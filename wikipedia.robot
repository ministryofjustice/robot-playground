*** Settings ***
library  Selenium2Library
*** Variables ***
${SearchInputBox}  searchInput
${SearchButton}  searchButton
*** Test Cases ***
wikipedia search test case
    Open Browser  url=https://en.wikipedia.org/wiki/Main_Page  browser=chrome
    Input Text    ${SearchInputBox}    millwall
    Press Keys    searchButton    ENTER