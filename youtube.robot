*** Settings ***
Documentation    Test searching and accessing videos on Youtube
Library          SeleniumLibrary
Library    OperatingSystem
#Test Teardown    Close Browser

*** Variables ***
${URL}    https://www.youtube.com
${SEARCH KEYWORD}    cracking the cryptic
#${COOKIES ID}    ytd-consent-bump-v2-lightbox

*** Keywords ***
Open Youtube
    Open Browser    ${URL}    Firefox
    Title Should Be    YouTube

Reject Cookies
    Wait Until Element Is Visible    lightbox
    #Wait Until Element Is Visible    class:yt-spec-button-shape-next yt-spec-button-shape-next--filled yt-spec-button-shape-next--mono yt-spec-button-shape-next--size-m yt-spec-button-shape-next--enable-backdrop-filter-experiment
    #Click Button    aria-label:"Reject the use of cookies and other data for the purposes described"
    Click Button    aria-label:"Refuser l'utilisation de cookies et d'autres données aux fins décrites"

Search Keyword
    Input Text    search_query    ${SEARCH KEYWORD}

Click Search Button
    Click Element    class:ytSearchboxComponentSearchButton
    Title Should Be    ${SEARCH KEYWORD} - YouTube


Click Youtube Channel
    Click Element    class:"style-scope ytd-channel-name"
    Title Should Be    "Cracking The Cryptic - YouTube"

*** Test Cases ***
Reach YouTube Channel
    Open Youtube
    Search Keyword
    Reject Cookies
    Click Search Button
    #Reject Cookies
    Click Youtube Channel