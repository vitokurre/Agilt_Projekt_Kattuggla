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
    Sleep  1s
    Click Element  ${CONTINUESCRATCH}
    #
    Sleep  900s
    #Här behöver vi logga ut
    #Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/nav/div/div[4]/div/button/div/div
    #Click Element  //*[@id="app"]/div[7]/div[1]/nav/div/div[4]/div/button/div/div
    #Sleep  1s
    #Wait Until Page Contains Element  //*[@id="app"]/div[6]/div/div[3]/div/a/div[1]/div
    #Click Element  //*[@id="app"]/div[6]/div/div[3]/div/a/div[1]/div

Choose Model And Click On Share
    Sleep  1s
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    #Click Element  ${CHOOSEMODEL}
    #Wait Until Page Contains Element  ${CLICKDOWNTRAININGELF}
    #Click Element  ${CLICKDOWNTRAININGELF}
    #Wait Until Page Contains  Customer support data model
    #Sleep  2s
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODELMENU}
    Sleep  1s
    Click Element  ${MODELMENU}
    Wait Until Page Contains Element  ${SHAREBUTTON}
    Sleep  1s
    Click Element  ${SHAREBUTTON}
    Wait Until Page Contains  If you share a model, you can send the link to friends and colleagues and let them try it out!
    Sleep  2s

    #Här ligger vi in det nya***

    Wait Until Page Contains Element  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div/div/div[2]/button/div
    Click Element  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div/div/div[2]/button/div

    Wait Until Page Contains Element  //*[@id="app"]/div[2]/div/div/span/div[1]/div[1]/table/tbody/tr/td[3]/span/span/button/div
    Click Element  //*[@id="app"]/div[2]/div/div/span/div[1]/div[1]/table/tbody/tr/td[3]/span/span/button/div

    #här slutar det nya ***


    #Wait Until Page Contains Element  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div/div/div[2]/button/div
    #Click Element  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div/div/div[2]/button/div
    #Wait Until Page contains Element  //*[@id="app"]/div[2]/div/div/span/div/div[1]/table/tbody/tr/td[3]/span/span/button/div/i
    #Click Element  //*[@id="app"]/div[2]/div/div/span/div/div[1]/table/tbody/tr/td[3]/span/span/button/div/i
    Wait Until Page Contains Element  ${SHAREDLINKTOCLICK}
    Sleep  1s
    ${SHAREDLINKTOSAVE}  Get Element Attribute  ${SHAREDLINKTOCLICK}  href
    Set Global Variable  ${SHAREDLINKTOSAVE}
    Log   ${SHAREDLINKTOSAVE}



Log out user from model
    Wait Until Page Contains Element  ${ACCOUNTMENU}
    Sleep  1s
    Click Element  ${ACCOUNTMENU}
    Wait Until Page Contains Element  ${LOGOUT}
    Sleep  1s
    Click Element  ${LOGOUT}
    Wait Until Page Contains Element  ${DONTHAVEANACCOUNT?}
    Log   ${SHAREDLINKTOSAVE}

Click On Shared Link And Test The Model
    Log  ${SHAREDLINKTOSAVE}
    Go to  ${SHAREDLINKTOSAVE}
    Wait Until Location Is  ${SHAREDLINKTOSAVE}
    Wait Until Page Contains  Hey! Write an example and click submit to try me out! You can try me out in any language! Below are the labels if you need more context:
    Wait Until Page Contains Element  ${TEXTAREA}
    Input Text  ${TEXTAREA}  I just ordered a pizza from Mordors Kitchen, when will it be delivered to my home here in Rivendell? Please use the eagles and not foodora this time. Last time my food was cold.
    Wait Until Page Contains Element  ${SUBMITBUTTON}
    Click Element  ${SUBMITBUTTON}
    Wait Until Page Contains Element  ${TESTLABELINGOUTLOGGED}
    Element Text Should Be  ${TESTLABELINGOUTLOGGED}  ORDER

Log in User Marcus 1
    Input Text  ${MAIL}   marcus.davidsson@iths.se
    Input Text  ${PASSWORD}  vitoKurre2022
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    #Wait Until Page Contains  Welcome to Labelf!

Log in User Marcus 2
    Input Text  ${MAIL}   marcus.davidsson@iths.se
    Input Text  ${PASSWORD}  vitoKurre2022
    #Wait Until Element Is Visible  ${COOKIEDOWN}
    #Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    #Wait Until Page Contains  Welcome to Labelf!

Delete Model 2
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODELMENU2}
    Click Element  ${MODELMENU2}
    Wait Until Page Contains Element  ${DELETEBUTTOM}
    Click Element  ${DELETEBUTTOM}
    Sleep  1s
    Wait Until Page Contains Element  ${IAMSUREDELETE}
    Click Element  ${IAMSUREDELETE}
    Sleep  1s

Log Out User 2
    Sleep  1s
    Wait Until Page Contains Element  ${USERACCOUNT}
    Click Element  ${USERACCOUNT}
    Sleep  1s
    Wait Until Page Contains Element  ${ACCOUNTLIST}
    Sleep  1s
    Wait Until PAge Contains Element  ${LOGOUTUSER2}
    Click Element  ${LOGOUTUSER2}
    Sleep  1s
    Location Should Be  ${URL}


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
${SHAREDLINKTOCLICK}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div/div/span/div/div[1]/table/tbody/tr/td[3]/a
${SHAREDLINKTOSAVE}
${TEXTAREA}  //*[@id="app"]/div[2]/main/div/div[1]/div/div/div/div/div/div[2]/div/div[1]/div/textarea
${SUBMITBUTTON}  //*[@id="app"]/div[2]/main/div/div[1]/div/div/div/div/div/div[3]/button/div
${TESTLABELINGOUTLOGGED}  //*[@id="app"]/div[2]/main/div/div[1]/div/div/div/div/div/div[4]/div[1]/nav/div[1]/div[1]
${ACCOUNTMENU}  //*[@id="app"]/div[10]/div[1]/nav/div/div[4]/div/button/div/div
${LOGOUT}  //*[@id="app"]/div[9]/div/div[3]/div/a
${DONTHAVEANACCOUNT?}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]/div
${MODELMENU2}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${DELETEBUTTOM}  //*[@id="app"]/div[2]/div/div/div[2]/a
${IAMSUREDELETE}  //*[@id="app"]/div[6]/div/div/div[3]/button
${LOGOUTUSER2}  //*[@id="app"]/div[5]/div/div[3]/div/a

#//*[@id="app"]/div[6]/div/div[3]
#//*[@id="app"]/div[6]/div/div[3]/div/a
#//*[@id="app"]/div[6]/div/div[3]/div/a/div[1]
#//*[@id="app"]/div[6]/div/div[3]/div/a/div[1]/div
#//*[@id="app"]/div[6]/div/div[3]/div/a/div[2]
#//*[@id="app"]/div[6]/div/div[3]/div/a/div[2]/i
#//*[@id="app"]/div[6]/div/div[3]/div/a/div[1]/div
#//*[@id="app"]/div[6]/div/div[3]/div/a/div[2]
#//*[@id="app"]/div[5]/div/div[3]/div/a


*** Test Cases ***

User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User Marcus 1
    Select My First Workspace As Workspace
    Create A Trained Model

User can share model with a link in setting.
    [Documentation]  Once model works; being able to share the model
    [Tags]  TestTrainedModel
    Choose Model And Click On Share
    Log out user from model


#User need to click on share


User outside labelf can acces the model by the link and try out the model.
    [Documentation]  Once the link to the shared model is clicked; being able to acces the model and try it out
    [Tags]  TestTrainedModel
    Click On Shared Link And Test The Model

User logs in, delete model and then logging out
    [Documentation]  Once having a created model; being able to log in, delete a model and then log out
    [Tags]  Model
    Go To Web Page
    Log in User Marcus 2
    Delete Model 2
    Log out user 2





