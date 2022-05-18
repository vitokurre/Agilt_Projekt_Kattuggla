*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Library  ../Scripts/remove_string.py
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***
Log in User_88
    Input Text  ${MAIL}   zheng.lin@iths.se
    Input Text  ${PASSWORD}  lz1234567
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    #Wait Until Page Contains  Welcome to Labelf!

Add a new exemple text on exsiting lable And Show items and lables items are increased
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${OVERVIEWBUTTON_1}
    Click Element  ${OVERVIEWBUTTON_1}
    #Sleep  5s
    Wait Until Page Contains Element   //*[@id="app"]/div[3]/div/div/button/div/i
    Sleep  5s
    Click Element   //*[@id="app"]/div[3]/div/div/button/div/i
    #//*[@id="app"]/div[2]/div/div/button/div/i
    #Sleep  5s
    Wait Until Page Contains    Model is online
    Sleep  10s

    Wait Until Page Contains    Total items
    Sleep  10s
    #//*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
    ${total items_before}  Get Text   //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
    ${actual_total items_before}  convert into number  ${total items_before}
    Log  ${actual_total items_before}

    Wait Until Page Contains    Labeled items:
    #//*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]
    ${labeled items_before}   Get Text   //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]
    ${actual_labled items_before}   convert into number label  ${labeled items_before}
    Log  ${actual_labled items_before}

    Wait Until Page Contains Element  ${SETTINGS}
    Click Element  ${SETTINGS}
    Sleep   5s
    Wait Until Page Contains    Edit labels
    Click Element   ${LABLENAME_ACCOUNT}
    Wait Until Page Contains    Label settings
    Input Text   ${ADD_EXEMPLES}    I forgot my account's password
    Wait Until Page Contains Element   ${UPDATELABLE_BUTTON}
    Click Element   ${UPDATELABLE_BUTTON}
    Click Element   ${LABLESETTINGS_XBUTTON}
    Sleep  2s

    Wait Until Page Contains Element    ${OVERVIEWBUTTON_2}
    Sleep  2s
    Click Element   ${OVERVIEWBUTTON_2}
    Sleep   2s
    Wait Until Page Contains Element    //*[@id="app"]/div[3]/div/div/button/div/i
    #Sleep   10s
    Click Element  //*[@id="app"]/div[3]/div/div/button/div/i
    Sleep  10s
    #//*[@id="app"]/div[2]/div/div/button


    #Wait Until Page Contains    Model is online
    #Sleep  5s
    Wait Until Page Contains    Total items
    Sleep  2s
    Wait Until Page Contains Element    //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
    #//*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
    #Sleep  10s
    ${total items_after}  Get Text     //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
    ${actual_total items_after}  convert into number items  ${total items_after}
    #Log  ${actual_total items_after}
    ${sum_total items}=  Evaluate　　  ${actual_total items_before}+1
    Should Be Equal As Numbers  ${actual_total items_after}    ${sum_total items}
    #Should Be True  ${actual_total items_after} > ${actual_total items_before}

    #Wait Until Page Contains    Labeled items:
    #Sleep  10s
    #//*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]
    Wait Until Page Contains Element    //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]  timeout=20s
    ${labeled items_after}   Get Text    //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]
    ${actual_labled items_after}   convert into number labels  ${labeled items_after}
    #Log ${actual_labled items_after}
    ${sum_labeled items}=  Evaluate　　  ${actual_labled items_before}+1
    Should Be Equal As Numbers  ${actual_labled items_after}   ${sum_labeled items}
    #Should Be True  ${actual_labled items_after} > ${actual_labled items_before}
    Sleep  2s
    #Click Element   ${MODELSBUTTON}
    #//*[@id="models-button-navbar"]/div/i
    #Wait Until Page Contains  My Models


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
${SETTINGS}             //*[@id="app"]/div[9]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
#//*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
${OVERVIEWBUTTON_1}     //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div/i
${LABLENAME_ACCOUNT}    //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[2]/div[2]/div/div[1]/a/div[2]/i
${ADD_EXEMPLES}         //*[@id="app"]/div[3]/div/div[1]/form/div[1]/div/div/div[3]/div/div[2]/div/div[1]/div/div/div[1]/div/input
${UPDATELABLE_BUTTON}   //*[@id="app"]/div[3]/div/div[1]/form/div[2]/button[2]/div/i
${LABLESETTINGS_XBUTTON}    //*[@id="app"]/div[3]/div/div[1]/nav/div/a/div/i
${OVERVIEWBUTTON_2}      //*[@id="app"]/div[4]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div/i
${MODELSBUTTON}         //*[@id="models-button-navbar"]/div/i

#//*[@id="models-button-navbar"]/div/span[1]

*** Test Cases ***

User is logged in; have changed workspace.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User_88
    #Select Team Kattuggla As Workspace

#User Can Enter An Unpreset Data Point
    #[Documentation]  Once logged in and change workspce; unpreset data point can be categorized
    #[Tags]  Data Point
    #Train a new model
    #Enter an unpreset data point

User Can Add A New Exemple Text On Exsiting Lable And Items And Lables Items Are Increased
    [Documentation]  Once a model is trained; being able to add a new exemple text on exsiting label and show items and labeled items increased
    [Tags]    Model items and labeled items
    Add a new exemple text on exsiting lable And Show items and lables items are increased


#User Can Log out
    #[Documentation]  Once user is logged in; being able to log out
    #[Tags]  Account
    #Delete Model
    #Log Out User