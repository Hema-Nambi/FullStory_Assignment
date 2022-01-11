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
Integrating Jira with FS
        Login into FullStory      ${encEmailFS}            ${encPassFS}
        Check visibility and click element       ${icon_Profile}
        Check visibility and click element       ${btn_Settings}
        Check visibility and click element       ${link_ManageIntegration}
        #Adding JIRA Integration
        Check visibility and click element       ${btn_AddJira}
        Check visibility and click element       ${btn_Authorize}
        Sleep     2
        #Switching to JIRA window
        Select window      New
        Sleep     2
        Login to Jira       ${encJiraEmail}     ${encJiraPassword}
        #Switching back to FullStory
        Select Window       Main
        Check visibility and click element       ${Sel_project}
        Check visibility and click element       ${Search_project}
        Input Text        ${Search_project}           ${ProjectName}
        Check visibility and click element       ${Sel_FullStoryAssignment}
        Page Should Contain             Successfully updated integration settings.
        Sleep   2
        Check visibility and click element      ${Sel_IssueType}
        Check visibility and click element      ${Search_IssueType}
        Input Text        ${Search_IssueType}           ${IssueType}
        Check visibility and click element       ${Sel_Bug}
        Page Should Contain             Successfully updated integration settings.

        Wait Until Element Is Visible       ${btn_done}
        Click Element with xpath using JS      ${btn_done}






