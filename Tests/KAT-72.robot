*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***
Enter an unpreset data point
    Sleep  1s
    Wait Until Page Contains Element  ${NEWMODELBUTTON}
    Click Element  ${NEWMODELBUTTON}
    Wait Until Page Contains  Create your own model from scratch.
    Wait Until Page Contains Element  ${SETUPCONTINUE}
    Click Element  ${SETUPCONTINUE}
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  ${DATASETCONTINUE}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Wait Until Page Contains Element  ${BETABUTTON}
    Click Element  ${BETABUTTON}
    Wait Until Element Is Visible  ${COLUMNCONTINUE}
    Sleep  1s
    Click Element  ${COLUMNCONTINUE}
    Wait Until Page Contains  Please click on the column containing the labels
    Sleep  1s
    Wait Until Page Contains Element ${CONTINUEBUTTON}
    Click Element  ${CONTINUEBUTTON}
    Wait Until Page Contains  Customer support data model
    #Input Text  ${DESCRIPTION}  This is a Discription of created model
    Wait Until Page Contains Element  ${CONTINUESCRATCH}
    Click Element  ${CONTINUESCRATCH}
    Wait Until Page Contains  ${MODELSNUMBER}
    Wait Until Page Contains  ${CREATEDMODEL}
    Click Element  ${CREATEDMODEL}
    Wait Until Page Contains  Test your model
    Input Text  ${EXEMPLECOLUMN} When will my order arrive?
    Wait Until Page Contains Element  ${SUMMITBUTTON}
    Click Element  ${SUMMITBUTTON}
    Wait Until Page Contains  ${CATEGORYTABLE}
    Sleep  1s
    Input Text  ${EXEMPLECOLUMN} When do I get my invoice?
    Wait Until Page Contains Element  ${SUMMITBUTTON}
    Click Element  ${SUMMITBUTTON}
    Wait Until Page Contains  ${CATEGORYTABLE}
    Sleep  1s
    Input Text  ${EXEMPLECOLUMN} What is the latest trend?
    Wait Until Page Contains Element  ${SUMMITBUTTON}
    Click Element  ${SUMMITBUTTON}
    Wait Until Page Contains  ${CATEGORYTABLE}
    Sleep  1s

*** Variables ***
${BETABUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div/input
${CONTINUEBUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button/div
${MODELSNUMBER}  //*[@id="app"]/div[7]/div[1]/main/div/div/nav/div/div[1]
${CREATEDMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[1]
${EXEMPLECOLUMN}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div
${SUMMITBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]/div
${CATEGORYTABLE}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]
*** Test Cases ***

User is logged in; have changed workspace.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    Select Team Kattuggla As Workspace

User Can Enter An Unpreset Data Point
    [Documentation]  Once logged in and change workspce; Being able to unpreset data point
    [Tags]  Data Point
    Enter an unpreset data point

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User
