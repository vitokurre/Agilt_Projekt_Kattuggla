*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

User can train a single choice model to the next data point
   Sleep  1s
   Wait Until Page Contains  Models
   Click Element  ${BODYMODEL}
   Sleep  1s
   Wait Until Page Contains  It does not look like you have trained the model
   Click Element  ${STARTTRAINING}
   Sleep  1s
   Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
   Click Element  ${ADDLABEL}
   Sleep  1s
   Wait Until page Contains  Add a new label
   Sleep  1s
   Input Text  ${FIRSTNAMELABEL}  Test 1
   Click Element  ${ADDAFIRSTNAMEDLABEL}
   Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
   Sleep  2s
   Click Element  ${ADDASECOUNDLABEL}
   Sleep  1s
   Wait Until page Contains  Add a new label
   Sleep  1s
   Input Text  ${SECOUNDNAMELABEL}  Test 2
   Sleep  3s
   Click Element  ${ADDASECOUNDNAMEDLABEL}
   Sleep  1s
   Click Element  ${SINGLECHOISE}
   Wait Until page Contains  Lets start by giving Labelf 20 samples
   Sleep  1s

   Wait Until Page Contains Element  ${DATAPOINT}
   ${text} =  Get Text  ${DATAPOINT}
   Click Element  ${TEST1LABEL}
   Element Text Should Not Be  ${DATAPOINT}  ${text}

   Sleep  1s

*** Variables ***

${BODYMODEL}              //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${STARTTRAINING}          //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div
${ADDLABEL}               //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div/span
${FIRSTNAMELABEL}         //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDAFIRSTNAMEDLABEL}    //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${ADDASECOUNDLABEL}       //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${SECOUNDNAMELABEL}       //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDASECOUNDNAMEDLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${SINGLECHOISE}           //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${TEST1LABEL}             //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
#${DATAPOINT}              /html/body/div[1]/div/div[5]/div/div[1]/div[4]/div/div/span/div/div/div[1]/div[1]/div/span
${DATAPOINT}              //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

User Can Change Workspace
    [Documentation]  Once user is logged in; being able to change workspace
    [Tags]  Workspace
    Select Team Kattuggla As Workspace

User Can Create Model
    [Documentation]  Once workspace is changed; being able to create model
    [Tags]  Model
    Create A Model

User can train a model
    [Documentation]  Once one label is selected; being able to train it
    [Tags]  Label
    User can train a single choice model to the next data point

User Can Delete Model
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User




