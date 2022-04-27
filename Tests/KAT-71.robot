*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Choose Model To Add Label
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    Wait Until Page Contains  It does not look like you have trained the model
    Wait Until Page Contains Element  ${STARTTRAINING}
    Click Element  ${STARTTRAINING}
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element  ${ADDLABEL}
    Click Element  ${ADDLABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element  ${NEWLABELNAME}
    Input Text  ${NEWLABELNAME}  Katt
    Wait Until Page Contains Element  ${ADDONELABEL}
    Click Element  ${ADDONELABEL}
    Wait Until Page Contains Element  ${NAMEONFIRSTLABEL}
    Element Text Should Be  ${NAMEONFIRSTLABEL}  KATT
    Wait Until Page Contains Element  ${ADDSEKUNDLABEL}
    Click Element  ${ADDSEKUNDLABEL}
    Wait Until Page Contains Element  ${INPUTTEXTLABEL}
    Input Text  ${INPUTTEXTLABEL2}  Uggla
    Wait Until Page Contains Element  ${ADDEDSECONDLABELDONE}
    #detta element är addlabel efter Uggla
    Click Element  ${ADDEDSECONDLABELDONE}
    Wait Until Page Contains  Choose model type
    Sleep  1s
    Wait Until Page Contains Element  ${CHOOSESINGLE}
    Click Element  ${CHOOSESINGLE}
    Wait Until Page Contains  Lets start by giving Labelf 20 samples
    Wait Until Page Contains Element  ${XBUTTON}
    Click Element  ${XBUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${MODELBUTTON}
    Click Element  ${MODELBUTTON}
    Wait Until Page Contains Element  ${CHOOSEMODEL}

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

#${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
#${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
#${ADDLABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
#${NEWLABELNAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
#${ADDONELABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
#${NAMEONFIRSTLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
#${ADDSEKUNDLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
#${CHOOSESINGLE}  //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
#${INPUTTEXTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
#${INPUTTEXTLABEL2}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
#${ADDEDSECONDLABELDONE}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
#${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
#${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div
*** Test Cases ***

User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    Select Team Kattuggla As Workspace
    Create A Trained Model

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User






