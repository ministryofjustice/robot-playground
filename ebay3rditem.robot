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
    Wait Until Element Is Visible    gh-as-a
   Click Element    css:#srp-river-results li:nth-child(3) div.s-item__info.clearfix > a > div  
   #Click Element    css:#srp-river-results > ul > li:nth-child(3) > div > div.s-item__info.clearfix > a > div
    #As per above commented out Click Element.  As we were searching for the 3rd item in a list we used Element to determine
    #what to click.  Each item in the list had a child(number) where above 3 represents the 3rd item
    #We had to use element as there was no name or ID to choose from.  The element name came from the class the link 
    #was part of.  We got the below line by using inspect element, right clicking in the class and then using copy>copy selector
    #I then posted this below. 
    #srp-river-results > ul > li:nth-child(3) > div > div.s-item__info.clearfix > a > div 
    #We were recommended to remove some of the dividers and only search for the essential HTML as some of the dividers
    #are prone to change if the code changes
    #so             css:#srp-river-results > ul > li:nth-child(3) > div > div.s-item__info.clearfix > a > div
    #changed to     css:#srp-river-results li:nth-child(3) div.s-item__info.clearfix > a > div
    #when removing the > > it is important not to leave 2 spaces between words as it will think its a new command.