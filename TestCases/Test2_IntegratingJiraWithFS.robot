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
        Add Project Name and Issue type          ${ProjectName}      ${IssueType}
        Remove JIRA integration
        #Integrating JIRA with Full Story when user is already logged into JIRA in the same browser
        Click Element with xpath using JS        ${btn_AddJira}
        Check visibility and click element       ${btn_Authorize}
        Add Project Name and Issue type          ${ProjectName}      ${IssueType}
        #Remove JIRA integration
        Logout of Jira

*** Keywords ***
Add Project Name and Issue type
        [Arguments]         ${Project}         ${Issue}
        Check visibility and click element       ${Sel_project}
        Check visibility and click element       ${Search_project}
        Input Text        ${Search_project}           ${Project}
        Check visibility and click element       ${Sel_FullStoryAssignment}
        Page Should Contain             Successfully updated integration settings.
        Sleep   2
        Check visibility and click element      ${Sel_IssueType}
        Check visibility and click element      ${Search_IssueType}
        Input Text        ${Search_IssueType}           ${Issue}
        Check visibility and click element       ${Sel_Bug}
        Page Should Contain             Successfully updated integration settings.
        Wait Until Element Is Visible       ${btn_done}
        Click Element with xpath using JS      ${btn_done}

Remove JIRA integration
        Check visibility and click element       ${btn_manage}
        Check visibility and click element       ${btn_remove}
        Handle Alert        action=ACCEPT
        Page Should Contain             Successfully removed integration.

Logout of Jira
       Execute Javascript    window.open('${JiraLoginPage}');
       Select Window     NEW
       Check visibility and click element       ${icon_JiraProfile}
       Check visibility and click element       ${link_JiraLogout}
       Check visibility and click element       ${btn_JiraLogout}






