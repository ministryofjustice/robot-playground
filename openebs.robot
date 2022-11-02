*** Settings ***
library  Selenium2Library
*** Variables ***
${loginbox}  usernameField
${passwordbox}  passwordField
${login1}    NB_CASEWORKER
${password1}    welcome1
*** Test Cases ***
ebs login test case
    Open Browser  url=https://ccmsebs.uat.legalservices.gov.uk/OA_HTML/AppsLocalLogin.jsp  browser=ie
    Input Text    ${loginbox}    ${login1}
    Input Password    ${passwordbox}    ${password1}
    Click Button    SubmitButton