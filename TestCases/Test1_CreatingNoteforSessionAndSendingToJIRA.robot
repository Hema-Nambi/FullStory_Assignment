*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Suite Setup       Open Application
Suite Teardown    Close Website
Resource          resource.robot
Variables         ../PageObjects/locators.py
Variables         ../PageObjects/TestData.py
Test Setup        Set Selenium Timeout          30 seconds

*** Test Cases ***
Creating Note for a session
    #Logging into FullStory
    Login into FullStory        ${encEmailFS}            ${encPassFS}
    Sleep         5

    #Creating note from Session
    Click Element        ${btn_playSession}
    Sleep         5
    Check visibility and click element       ${btn_NoteAndShare}
    Wait Until Element Is Visible       ${txtArea_NoteText}
    Input Text        ${txtArea_NoteText}       ${Notes}
    Check visibility and click element         ${btn_Note}

    #Sending Note to JIRA
    Check visibility and click element        ${Link_Notes}
    Sleep     5
    Check visibility and click element        ${SentToJIRA}
    Wait Until Element Is Visible       ${txt_Summary}

    Check visibility and click element       ${btn_Send}
    Sleep       2
    Page Should Contain Element     ${link_highlight}
    Page Should Contain             Successfully sent highlight.

    #Delete Notes
    Check visibility and click element        ${link_Delete}
    Handle Alert        action=ACCEPT