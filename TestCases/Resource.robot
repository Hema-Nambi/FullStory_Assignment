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

Login into FullStory
    [Arguments]           ${encEmail}            ${encPass}
    Set Selenium Speed          0.4
    ${Email}=     Decode pwd       ${encEmail}
    ${Pass}=     Decode pwd       ${encPass}
    Input Text        ${txt_email}           ${Email}
    Click Element     ${btn_Login}
    Input Password    ${txt_password}        ${Pass}
    Click Element     ${btn_Login}
    Wait Until Location Contains          ${FullStoryHomePage}

Check visibility and click element
    [Arguments]        ${element}
    Wait Until Element Is Visible         ${element}
    Click Element        ${element}

Login to Jira
    [Arguments]           ${encEmail}            ${encPass}
    Set Selenium Speed          0.4
    ${Email}=     Decode pwd       ${encEmail}
    ${Pass}=     Decode pwd       ${encPass}
    Input Text        ${txt_JiraEmail}           ${Email}
    Click Element     ${btn_JiraLoginContinue}
    Input Password    ${txt_JiraPassword}        ${Pass}
    Click Element     ${btn_JiraLogIn}

Click Element with xpath using JS
     [Arguments]         ${locator}
     Execute Javascript         document.evaluate("${locator}",document.body,null,9,null).singleNodeValue.click();


Close Website
     Close All Browsers