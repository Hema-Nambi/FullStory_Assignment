*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Variables         ../PageObjects/Locators.py
Variables         ../PageObjects/TestData.py
Library           Decode.py

*** Keywords ***
Open Website using URL
     [Arguments]        ${URL}
     Open Browser       ${URL}    Chrome
     Maximize Browser Window

Open Application
    Open Website using URL          ${FullStoryLogin}
    Add Cookie           ${cookieName}           ${cookieValue}

Login into Full Story
    [Arguments]           ${encEmail}            ${encPass}
    Set Selenium Speed          0.4
    ${Email}=     Decode pwd       ${encEmail}
    ${Pass}=     Decode pwd       ${encPass}
    Input Text        ${txt_email}           ${Email}
    Click Element     ${btn_Login}
    Input Password    ${txt_password}        ${Pass}
    Click Element     ${btn_Login}
    Wait Until Location Contains          ${FullStoryHomePage}

Close Website
     Close All Browsers