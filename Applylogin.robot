*** Settings ***
library  Selenium2Library
*** Test Cases ***
apply login test case
    Open Browser  url=https://main-applyforlegalaid-uat.cloud-platform.service.justice.gov.uk/  browser=chrome
    Click Button  Sign In
    Input Text    email    martin.ronan@example.com
    Input Password    password    password
    Click Button    commit
