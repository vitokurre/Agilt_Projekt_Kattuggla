*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Select My First Workspace As Workspace
    Sleep  1s
    Wait Until Location Is  https://stag.labelf.ai/main/64/models/view
    Wait Until Page Contains  My first workspace


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

Choose Model And Click On Share
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    #Click Element  ${CHOOSEMODEL}
    #Wait Until Page Contains Element  ${CLICKDOWNTRAININGELF}
    #Click Element  ${CLICKDOWNTRAININGELF}
    #Wait Until Page Contains  Customer support data model
    #Sleep  2s
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODELMENU}
    Click Element  ${MODELMENU}
    Wait Until Page Contains Element  ${SHAREBUTTON}
    Click Element  ${SHAREBUTTON}
    Wait Until Page Contains  If you share a model, you can send the link to friends and colleagues and let them try it out!
    Sleep  2s
    Wait Until Page Contains Element  ${SHAREDLINKTOCLICK}
    ${SHAREDLINKTOSAVE}  Get Element Attribute  ${SHAREDLINKTOCLICK}  href
    #Should Be Equal    ${SHAREDLINKTOSAVE}    https://stag.labelf.ai/shared/b7a8085932704503880de409cb996b15


Log out user from model
    Wait Until Page Contains Element  //*[@id="app"]/div[10]/div[1]/nav/div/div[4]/div/button/div/div
    Click Element  //*[@id="app"]/div[10]/div[1]/nav/div/div[4]/div/button/div/div
    Wait Until Page Contains Element  //*[@id="app"]/div[9]/div/div[3]/div/a/div[1]
    Click Element  //*[@id="app"]/div[9]/div/div[3]/div/a/div[1]
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]/div

Click On Shared Link And Test The Model
    Log  ${SHAREDLINKTOSAVE}
    Go to  ${SHAREDLINKTOSAVE}
    Wait Until Location Is  ${SHAREDLINKTOSAVE}
    #https://stag.labelf.ai/shared/b7a8085932704503880de409cb996b15
    Sleep  2s




Choose Model And Verify Correct Labeling
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    #Wait Until Page Contains Element  ${CLICKDOWNTRAININGELF}
    #Click Element  ${CLICKDOWNTRAININGELF}
    Wait Until Page Contains  This is an overview of the projected distribution of labels (user labeled+predicted by the model) across your datasets.
   # Sleep  900 s
    Wait Until Page Contains Element  ${MODELSBUTTON1}
    Click Element  ${MODELSBUTTON1}
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    #Wait Until Page Contains  You can test the model below
    #Wait Until Page Contains Element  ${TESTTEXTFIELD}
    #Input Text  ${TESTTEXTFIELD}  Stay a while and listen. If you want to fight Diablo, lord of the Destruction then you need the password to the monasteries gate.
    #Wait Until Page Contains Element  ${TESTBUTTON}
    #Click Element  ${TESTBUTTON}
    #Wait Until Page Contains Element  ${TESTLABELING}
    #Element Text Should Be  ${TESTLABELING}  ACCOUNT
    Wait Until Page Contains Element  ${MODELSBUTTON2}
    Click Element  ${MODELSBUTTON2}


Log in User Marcus
    Input Text  ${MAIL}   marcus.davidsson@iths.se
    Input Text  ${PASSWORD}  vitoKurre2022
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    #Wait Until Page Contains  Welcome to Labelf!


*** Variables ***
${TRAINDIRECTLYONLABELS}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/label/div
${LASTCREATEMODELCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button/div
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div
${TESTTEXTFIELD}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
${TESTBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]/div
${CORRECTLABELING}  ACCOUNT
${TESTLABELING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[1]
${CLICKDOWNTRAININGELF}  //*[@id="app"]/div[3]/div/div/button/div/i
${STRINGTOCEHCK}
${MODELSBUTTON2}  //*[@id="app"]/div[7]/div[1]/nav/div/a[1]/div
${MODELSBUTTON1}  //*[@id="models-button-navbar"]/div
${SHAREBUTTON}  //*[@id="sharing-button-model-card"]/div[1]/div
${MODELMENU}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${SHAREDLINKTOCLICK}
${SHAREDLINKTOSAVE}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div/div/span/div/div[1]/table/tbody/tr/td[3]/a

*** Test Cases ***

User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User Marcus
    Select My First Workspace As Workspace
    #Create A Trained Model

#User can test correct labeling on trained model.
    #[Documentation]  Once logged in; being able to change workspace
    #[Tags]  TestTrainedModel
    #Choose Model And Verify Correct Labeling

User can share model with a link in setting.
    [Documentation]  Once model works; being able to share the model
    [Tags]  TestTrainedModel
    Choose Model And Click On Share
    Log out user from model

User outside labelf can acces the model by the link and try out the model.
    [Documentation]  Once the link to the shared model is clicked; being able to acces the model and try it out
    [Tags]  TestTrainedModel
    Click On Shared Link And Test The Model

#User delete model and then logging out
    #[Documentation]  Once a model is created; being able to delete a model and then log out
    #[Tags]  Model
    #Delete Model
    #Log Out User





