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

Edit Label Shall Appear
    Sleep  1s
    Wait Until Page Contains Element  ${MODEL_BUTTON}
    Sleep  1s
    Click Element  ${MODEL_BUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${THREEDOTS_BUTTON}
    Sleep  3s
    Click Element  ${THREEDOTS_BUTTON}
    Sleep  10s
    Wait Until Page Contains Element  ${SETTINGS_BUTTON}
    Sleep  3s
    Click Element  ${SETTINGS_BUTTON}
    Sleep  1s
    Wait Until Page Contains  Edit model name and description
    Sleep  1s
    Wait Until Page Contains  Edit labels
    Sleep  1s
    Scroll Element Into View  ${EDIT_PEN}
    Sleep  1s
    Wait Until Page Contains Element  ${EDIT_PEN}
    Sleep  1s
    Click Element  ${EDIT_PEN}
    Sleep  1s
    Wait Until Page Contains Element  ${LABELSETTING_TEXTFIELD}
    Sleep  1s
    Element Text Should Be  ${LABELSETTING_TEXTFIELD}  Add examples


*** Variables ***
${BETABUTTON}              //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/label/div
${NEXTCONTINUE}            //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${MODELNAME_TEXTFIELD}     //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div
${CREATEMODEL_BUTTON}      //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
${MODELSNUMBER}            //*[@id="app"]/div[7]/div[1]/main/div/div/nav/div/div[1]
${TESTMODEL}               //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${TESTMODEL_2}             //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div
${TRAINING_XBUTTON}        //*[@id="app"]/div[3]/div/div/button/div/i
${MODEL_BUTTON}            //*[@id="models-button-navbar"]/div/span[1]
${THREEDOTS_BUTTON}        //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button
${SETTINGS_BUTTON}         //*[@id="app"]/div[2]/div/div/div[1]/a
${EDIT_PEN}                //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[2]/div[2]/div/div[2]/a/div[2]/i
${LABELSETTING_TEXTFIELD}  //*[@id="app"]/div[3]/div/div[1]/form/div[1]/div/div/div[3]/div/div[1]
${LABEL_XBUTTON}           //div/div/div[1]/nav/div/a/div/i
${ADDEXEMPLES_TEXTFIELD}   //*[@id="app"]/div[3]/div/div[1]/form/div[1]/div/div/div[3]/div/div[2]/div/div[1]/div/div/div[1]/div/input
${UPPDATELABEL_BUTTON}     //*[@id="app"]/div[3]/div/div[1]/form/div[2]/button[2]
${OVERVIEW_BUTTON}         //*[@id="app"]/div[4]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]
${TRAINING_XBUTTON2}       //*[@id="app"]/div[3]/div/div/button
${PROCESSING_BUTTON}       //*[@id="app"]/div[9]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/span


*** Test Cases ***
User is logged in; have changed workspace.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User

User Can Edit Existing Label
    [Documentation]  Once model is trained; user can edit label and model will retrain automatically
    [Tags]  Edit Label
    #Train a new model
    Edit Label Shall Appear


#User Can Log out
    #[Documentation]  Once user is logged in; being able to log out
    #[Tags]  Account
    #Delete Model
    #Log Out User