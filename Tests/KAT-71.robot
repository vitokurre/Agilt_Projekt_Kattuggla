*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Choose Model And Verify Correct Labeling
    #Sleep  180 s
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    Wait Until Page Contains Element  ${CLICKDOWNTRAININGELF}
    Click Element  ${CLICKDOWNTRAININGELF}
    Wait Until Page Contains  This is an overview of the projected distribution of labels (user labeled+predicted by the model) across your datasets.
    Wait Until Page Contains  Test your model
    Sleep  900 s
    Wait Until Page Contains Element  ${TESTTEXTFIELD}
    Input Text  ${TESTTEXTFIELD}  could i create a user account?
    Wait Until Page Contains Element  ${TESTBUTTON}
    Click Element  ${TESTBUTTON}
    Wait Until Page Contains Element  ${TESTLABELING}
    Element Text Should Be  ${TESTLABELING}  ACCOUNT
    Wait Until Page Contains Element  ${MODELSBUTTON}
    Click Element  ${MODELSBUTTON}


    #grönt fram till hit.
    #nu måste jag plocka ut "account" ur ${TESTLABELING} och jämföra med ${CORRECTLABELING}
    #när detta är klart och stämmer så klickar vi på models därefter raderas modellen som vanligt.


    #Wait Until Page Contains Element  ${XBUTTON}
    #Click Element  ${XBUTTON}
    #Sleep  1s
    #Wait Until Page Contains Element  ${MODELBUTTON}
    #Click Element  ${MODELBUTTON}
    #Wait Until Page Contains Element  ${CHOOSEMODEL}

Create A Trained Model
    Sleep  1s
    Wait Until Page Contains Element  ${NEWMODELBUTTON}
    Click Element  ${NEWMODELBUTTON}
    Wait Until Page Contains  Create your own model from scratch.
    Wait Until Page Contains Element  ${SETUPCONTINUE}
    Click Element  ${SETUPCONTINUE}
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  ${DATASETCONTINUE}
    Wait Until Page Contains  Please click on the column containing the text
    #här bryter jag upp
    Sleep  1s
    Wait Until Page Contains Element  ${TRAINDIRECTLYONLABELS}
    Click Element  ${TRAINDIRECTLYONLABELS}
    Wait Until Page Contains  Select the column which contains the labels
    Wait Until Element Is Visible  ${COLUMNCONTINUE}
    Sleep  1s
    Click Element  ${COLUMNCONTINUE}
    Wait Until Page Contains  Please click on the column containing the labels
    Wait Until Page Contains Element  ${LASTCREATEMODELCONTINUE}
    Scroll Element Into View  ${LASTCREATEMODELCONTINUE}
    Click Element  ${LASTCREATEMODELCONTINUE}
    Sleep  1s
    Wait Until Page Contains  Name your model
    Wait Until Page Contains Element  ${CONTINUESCRATCH}
    Click Element  ${CONTINUESCRATCH}





Ueser can see all labels


*** Variables ***
${TRAINDIRECTLYONLABELS}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/label/div
${LASTCREATEMODELCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button/div
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div
${TESTTEXTFIELD}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
 #//*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div detta element syns men kan inte skriva in text
${TESTBUTTON}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]/div
${CORRECTLABELING}  ACCOUNT
${TESTLABELING}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[1]
${CLICKDOWNTRAININGELF}  //*[@id="app"]/div[3]/div/div/button/div/i
${STRINGTOCEHCK}
${MODELSBUTTON}  //*[@id="app"]/div[7]/div[1]/nav/div/a[1]

*** Test Cases ***

User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    Select Team Kattuggla As Workspace
    Create A Trained Model

User can test correct labeling on trained model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  TestTrainedModel
    Choose Model And Verify Correct Labeling

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User






