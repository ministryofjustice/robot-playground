*** Settings ***
library  Selenium2Library
*** Variables ***
${loginbox}  email
${passwordbox}  password
${login1}    martin.ronan@example.com
${password1}    password
*** Test Cases ***
apply login test case
    Open Browser  url=https://main-applyforlegalaid-uat.cloud-platform.service.justice.gov.uk/  browser=chrome
    Click Button  Sign In
    #Click Link    start
    Input Text    ${loginbox}    ${login1}
    Input Password    ${passwordbox}    ${password1}
    Click Button    commit
    #when creating this script I could not write the code to use the Start Now button as I could not see a button link
    #that was becuase the button is not actually a button.  Instead I used the sign in link instead which actually is not
    #a link but is a button so this worked fine.
    #to use the Start Now button rather than the Sign In link you can use click link and start as the locator
    #Click Link    start