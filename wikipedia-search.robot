*** Settings ***
Library    Selenium2Library
Test Teardown  Run Keyword    Close Browser

*** Variables ***
${url}    https://wikipedia.org
${browser}     chrome

${search_for}    Alphabet
${assert_on_page}    From Wikipedia, the free encyclopedia

${search_text_locator}  id:searchInput
${search_button_locator}    class:pure-button

*** Test Cases ***
Search on Google
    Open Browser  ${url}  ${browser}
    Input Text      ${search_text_locator}      ${search_for}
    Wait Until Element Is Visible    ${search_button_locator}
    Click Button    ${search_button_locator}
    Page Should Contain    ${assert_on_page}
