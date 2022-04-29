*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Go To Web Page
    Go to  ${URL}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]

Log in User
    Sleep  1s
    Input Text  ${MAIL}   felicia.au.thersthol@iths.se
    Input Text  ${PASSWORD}  iths123
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!

Select A Workspace
    Sleep  1s
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains Element  ${MAINMENULIST}
    Click Element  ${MAINMENUTEAMKATTUGGLA}
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Sleep  1s
    Wait Until Page Contains Element  ${ATTRIBUTSTRINGTEAMKATTUGGLA}
    Sleep  1s
    Element Text Should Be  ${ATTRIBUTSTRINGTEAMKATTUGGLA}  My first workspace
    Wait Until Location Is  https://stag.labelf.ai/main/67/models/view
    #Ceck the id in the link if its the right workspace
    Wait Until Page Contains  My first workspace

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

Delete Model
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODELMENU}
    Click Element  ${MODELMENU}
    Wait Until Page Contains Element  ${DELETE}
    Click Element  ${DELETE}
    Sleep  1s
    Wait Until Page Contains Element  ${SUREDELETE}
    Click Element  ${SUREDELETE}
    Sleep  1s

Log Out User
    Sleep  1s
    Wait Until Page Contains Element  ${USERACCOUNT}
    Click Element  ${USERACCOUNT}
    Wait Until Page Contains Element  ${ACCOUNTLIST}
    Click Element  ${LOGOUT}
    Location Should Be  ${URL}

End Web Test
    Close Browser

Ueser can see all labels


*** Variables ***
${BROWSER}  chrome
${URL}  https://stag.labelf.ai/login
${MAIL}  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${PASSWORD}  //*[@id="password"]
${COOKIEDOWN}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[2]
${LOGINBUTTON}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]/div
${MAINMENU}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${MAINMENULIST}  //*[@id="app"]/div[1]/div
${MAINMENUTEAMKATTUGGLA}  //*[@id="app"]/div[1]/div/div[2]/div[4]/a/div[1]/div
${NEWMODELBUTTON}  //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a/div/i
${SETUPCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button/div
${DATASETCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DESCRIPTION}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea
${COLUMNCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button/div
${MODELMENU}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${CONTINUESCRATCH}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button/div
${DELETE}  //*[@id="app"]/div[3]/div/div/div[2]/a/div[1]/div
${SUREDELETE}  //*[@id="app"]/div[3]/div/div/div[3]/button/div
${ATTRIBUTSTRINGTEAMKATTUGGLA}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/span
${USERACCOUNT}  //*[@id="app"]/div[6]/div[1]/nav/div/div[4]/div/button/div/div/span
${ACCOUNTLIST}  //*[@id="app"]/div[5]/div
${LOGOUT}  //*[@id="app"]/div[5]/div/div[3]/div/a/div[1]/div
${WINDOW}  window-size=1920,1080
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${ADDLABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${NEWLABELNAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDONELABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${NAMEONFIRSTLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${ADDSEKUNDLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${CHOOSESINGLE}  //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${INPUTTEXTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUTTEXTLABEL2}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDEDSECONDLABELDONE}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div


${BETABUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div/input
${CONTINUEBUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button/div
${MODELSNUMBER}  //*[@id="app"]/div[7]/div[1]/main/div/div/nav/div/div[1]
${CREATEDMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[1]
${EXEMPLECOLUMN}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div
${SUMMITBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]/div
${CATEGORYTABLE}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]
*** Test Cases ***

User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    Select A Workspace
    Create A Model

User can enter any unpreset data point and get it categorized
    [Documentation]  Once model is trained; any unpreset data point can be categorized
    [Tags]  Data point Categorization
    Enter an unpreset data point

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User
