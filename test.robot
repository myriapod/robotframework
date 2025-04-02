*** Settings ***
Documentation    Test using Selenium Library to search ${SEARCH URL}
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${URL}      https://www.python.org/
${VALID TITLE}    Welcome to Python.org
${BROWSER}        Firefox
${SEARCH}    robotframework
${SEARCH BAR ID}    id-search-field
${SEARCH BUTTON ID}    submit
${SEARCH URL}    https://www.python.org/search/?q=${SEARCH}&submit=

*** Test Cases ***
Valid Search
    Open Search Page
    Input Search
    Click Search Button
    Search Page Should Be Open

*** Keywords ***
Open Search Page
    Open Browser    ${URL} ${BROWSER}
    Title Should Be    ${VALID TITLE}

Input Search
    Input Text    ${SEARCH BAR ID}    ${SEARCH}

Click Search Button
    Click Button    ${SEARCH BUTTON ID}

Search Page Should Be Open
    Location Should Be        ${SEARCH URL}