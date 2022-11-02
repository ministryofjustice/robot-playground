*** Settings ***
Library   Selenium2Library
*** Variables **
*** Test Cases ***
Applicant Details Test Case
    Open Browser  url=https://main-applyforlegalaid-uat.cloud-platform.service.justice.gov.uk/  browser=Chrome
    #the start Now button is not a button, use Click Element
    Click Element    id:start  
 