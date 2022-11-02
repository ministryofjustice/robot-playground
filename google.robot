*** Settings ***
library  Selenium2Library
*** Variables ***
${SearchInputBox}  q
${SearchButton}  btnK
*** Test Cases ***
google ebay search test case
    Open Browser  url=https://www.google.co.uk/  browser=chrome
    Click Button    Accept all
    Input Text    ${SearchInputBox}    robot man the aliens
    #Wait Until Element Is Visible    name:btnK
    #Click Button    ${SearchButton}
    Press Keys    q    ENTER