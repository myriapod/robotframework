*** Settings ***
Documentation    Test searching and accessing videos on Youtube
Library          SeleniumLibrary
#Test Teardown    Close Browser

*** Variables ***
${URL}    https://www.youtube.com
${SEARCH KEYWORD}    cracking the cryptic

*** Keywords ***
Open Youtube
    Open Browser    ${URL}    Firefox
    Title Should Be    YouTube

Search Keyword
    Input Text    search_query    ${SEARCH KEYWORD}

Click Search Button
    Click Element    class:ytSearchboxComponentSearchButton
    Title Should Be    ${SEARCH KEYWORD} - YouTube

Reject Cookies
    Click Element    class:yt-spec-button-shape-next yt-spec-button-shape-next--filled yt-spec-button-shape-next--mono yt-spec-button-shape-next--size-m yt-spec-button-shape-next--enable-backdrop-filter-experiment

Click Youtube Channel
    Click Element    class:"style-scope ytd-channel-name"
    Title Should Be    "Cracking The Cryptic - YouTube"

*** Test Cases ***
Reach YouTube Channel
    Open Youtube
    Search Keyword
    Click Search Button
    Reject Cookies
    Click Youtube Channel