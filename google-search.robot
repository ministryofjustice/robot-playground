*** Settings ***
Library    Selenium2Library
Test Teardown  Run Keyword    Close Browser

*** Variables ***
${url}    https://google.co.uk
${browser}     chrome

${search_for}    Dancing
${assert_on_page}    Dance - Wikipedia

${search_text_locator}  name:q
${search_button_locator}    name:btnK

*** Test Cases ***
Search on Google
    Open Browser  ${url}  ${browser}
    Click Button    Accept all
    Input Text      ${search_text_locator}      ${search_for}
    Wait Until Element Is Visible    ${search_button_locator}
    Click Button    ${search_button_locator}
    Page Should Contain    ${assert_on_page}
