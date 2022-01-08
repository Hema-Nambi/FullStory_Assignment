*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Suite Teardown    Close Website
Resource          resource.robot
Variables         ../PageObjects/locators.py
Variables         ../PageObjects/TestData.py
Test Setup        Set Selenium Timeout          30 seconds

*** Test Cases ***
Creating Note for a session
    Open Application
    Login into Full Story        ${encEmailFS}            ${encPassFS}
    Sleep         5
    Click Element        ${btn_playSession}
    Sleep         5
    Wait Until Element Is Visible         ${btn_NoteAndShare}
    Click Element        ${btn_NoteAndShare}
    Wait Until Element Is Visible       ${txtArea_NoteText}
    Input Text        ${txtArea_NoteText}       ${Notes}
    Wait Until Element Is Visible       ${btn_Note}
    Click Element        ${btn_Note}
    Wait Until Element Is Visible       ${Link_Notes}
    Click Element        ${Link_Notes}
    Sleep     5
    Wait Until Element Is Visible       ${SentToJIRA}
    Click Element        ${SentToJIRA}
    Wait Until Element Is Visible       ${txt_Summary}
    #Element Text Should Be      ${txt_Summary}     ${Notes}
    Wait Until Element Is Visible       ${btn_Send}
    Click Element        ${btn_Send}
    Sleep       2
    Page Should Contain Element     ${link_highlight}
    Page Should Contain             Successfully sent highlight.