*** Settings ***
Library    Selenium2Library
Test Teardown  Run Keyword    Close Browser

*** Variables ***
${url}    https://ebay.co.uk
${browser}     chrome

${search_for}    circular saw
${assert_on_page}    results for circular saw

${search_text_locator}  name:_nkw
${search_button_locator}    id:gh-btn

*** Test Cases ***
Search on Google
    Open Browser  ${url}  ${browser}
    Input Text      ${search_text_locator}      ${search_for}
    Wait Until Element Is Visible    ${search_button_locator}
    Click Button    ${search_button_locator}
    Page Should Contain    ${assert_on_page}
