*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***
Train a new model
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
    Sleep  3s
    Page Should Contain Element  ${BETABUTTON}
    Sleep  1s
    Click Element  ${BETABUTTON}
    Wait Until Element Is Visible  ${COLUMNCONTINUE}
    Sleep  1s
    Click Element  ${COLUMNCONTINUE}
    Sleep  3s
    Scroll Element Into View  ${NEXTCONTINUE}
    Wait Until Page Contains Element  ${NEXTCONTINUE}
    Sleep  1s
    Click Element  ${NEXTCONTINUE}
    Sleep  1s
    Wait Until Page Contains Element  ${CREATEMODEL_BUTTON}
    Click Element  ${CREATEMODEL_BUTTON}
    Sleep  3s
    Page Should Contain Element  ${MODELSNUMBER}
    Sleep  3s
    Wait Until Page Contains Element  ${TESTMODEL}
    Sleep  3s
    Click Element  ${TESTMODEL}
    Sleep  5s
    Wait Until Page Contains Element  ${TRAINING_XBUTTON}
    Sleep  1s
    Click Element  ${TRAINING_XBUTTON}
    Sleep  5s
    Wait Until Page Contains  Model is processing
    Sleep  13m
    Wait Until Page Contains Element  ${MODEL_BUTTON}
    Sleep  1s
    Click Element  ${MODEL_BUTTON}

Enter an unpreset data point
    Wait Until Page Contains Element  ${TESTMODEL_2}
    Sleep  3s
    Click Element  ${TESTMODEL_2}
    Sleep  3s
    Wait Until Page Contains  Model is online
    Sleep  1s
    Wait Until Page Contains Element  ${EXEMPELTEXTFIELD}
    Sleep  3s
    Input Text  ${EXEMPELTEXTFIELD}  When do I pay my invoice?
    Sleep  3s
    Scroll Element Into View  ${SUMMITBUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${SUMMITBUTTON}
    Sleep  1s
    Click Element  ${SUMMITBUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${CATEGORYTABLE}
    Sleep  1s
    Element Text Should Be  ${CATEGORYTABLE}  INVOICES
    Sleep  1s
    Wait Until Page Contains Element  ${MODELBUTTON_2}
    Sleep  1s
    Click Element  ${MODELBUTTON_2}
    Sleep  1s
    Wait Until Page Contains  My Models (1)


*** Variables ***
${BETABUTTON}           //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/label/div
${CONTINUEBUTTON}       //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button/div
${MODELNAME_TEXTFIELD}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div
${CREATEMODEL_BUTTON}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
${MODELSNUMBER}         //*[@id="app"]/div[7]/div[1]/main/div/div/nav/div/div[1]
${TESTMODEL}            //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${TESTMODEL_2}          //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div
${TRAINING_XBUTTON}     //*[@id="app"]/div[3]/div/div/button/div/i
${MODEL_BUTTON}         //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div/span[1]
${EXEMPELTEXTFIELD}     //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
${EXEMPLECOLUMN}        //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div
${SUMMITBUTTON}         //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]/div
${CATEGORYTABLE}        //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[1]
${NEXTCONTINUE}         //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${MODELBUTTON_2}        //*[@id="app"]/div[7]/div[1]/nav/div/a[1]/div


*** Test Cases ***

User is logged in; have changed workspace.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    #Select Team Kattuggla As Workspace

User Can Enter An Unpreset Data Point
    [Documentation]  Once logged in and change workspce; unpreset data point can be categorized
    [Tags]  Data Point
    Train a new model
    Enter an unpreset data point


User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Delete Model
    Log Out User
