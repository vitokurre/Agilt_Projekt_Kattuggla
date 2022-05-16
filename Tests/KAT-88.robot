*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
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

Add a new exemple text on exsiting lable
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${OVERVIEWBUTTON_1}
    Click Element  ${OVERVIEWBUTTON_1}
    Sleep  2s
    #Wait Until Page Contains Element    //*[@id="app"]/div[2]/div/div/button
    #//*[@id="app"]/div[2]/div/div/button
    #Sleep  5s
    #Click Button   //*[@id="app"]/div[2]/div/div/button
    #//*[@id="app"]/div[2]/div/div/button
    #Sleep  5s
    Wait Until Page Contains    Model is online
    Sleep  2s

    Wait Until Page Contains    Model ID
    ${model ID_before}     Get Text  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[1]

    Wait Until Page Contains    Total items
    ${total items_before}  Get Element Attribute   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]/span  style
    Log  ${total items_before}

    #[text()='Total items:']
    #${total items_before}  Get Value   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]/span
                                       #//*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]/text()
    #${total items_before}   Get Value     //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]

    Wait Until Page Contains    Labeled items
    ${labeled items_before}   Get Element Attribute   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]/span  total_labeled
    #//*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]/text()
    #${labled items_before}   Get Text  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]


    Wait Until Page Contains Element  ${SETTINGS}
    Click Element  ${SETTINGS}
    Wait Until Page Contains    Edit labels
    Click Element   ${LABLENAME_ACCOUNT}
    Wait Until Page Contains    Label settings
    Input Text   ${ADD_EXEMPLES}    I forgot my account's password
    Click Element   ${UPDATELABLE_BUTTON}
    Click Element   ${LABLESETTINGS_XBUTTON}


Show items and lables items are increased
    Wait Until Page Contains Element    ${OVERVIEWBUTTON_2}
    Click Element   ${OVERVIEWBUTTON_2}
    Wait Until Page Contains Element    //*[@id="app"]/div[2]/div/div/button
    Sleep   2s
    #Click Element   //*[@id="app"]/div[2]/div/div/button
    Wait Until Page Contains    Model is online

    Wait Until Page Contains    Model ID
    Sleep  10s
    Wait Until Page Contains Element    //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[1]
    Sleep   2s
    ${model ID_after}  Get Text     //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[1]

    Shoule Be Equal    ${model ID_before}  ${model ID_after}

    Wait Until Page Contains    Total items
    ${total items_after}  Get Element Attribute     //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]  item_count
    #//*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]/text()
    ${sum_total items}=  Evaluate　　  eval(‘${items_value_before}+1’)
    Shoule Be Equal As strings  ${total items_after}    ${sum_total items}

    Wait Until Page Contains    Labeled items
    ${labeled items_after}   Get Element Attribute     //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]  text()
    #//*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]/text()
    ${sum_labeled items}=  Evaluate　　  eval(‘${labeled items_value_before}+1’)
    Should Be Equal As strings  ${labeled items_after}   ${sum_labeled items}



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
${SETTINGS}             //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
${OVERVIEWBUTTON_1}     //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div/i
${LABLENAME_ACCOUNT}    //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[2]/div[2]/div/div[1]/a/div[2]/i
${ADD_EXEMPLES}         //*[@id="app"]/div[3]/div/div[1]/form/div[1]/div/div/div[3]/div/div[2]/div/div[1]/div/div/div[1]/div/input
${UPDATELABLE_BUTTON}   //*[@id="app"]/div[3]/div/div[1]/form/div[2]/button[2]/div/i
${LABLESETTINGS_XBUTTON}    //*[@id="app"]/div[3]/div/div[1]/nav/div/a/div/i
${OVERVIEWBUTTON_2}      //*[@id="app"]/div[4]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div/i



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
    Add a new exemple text on exsiting lable
    #Show items and lables items are increased


#User Can Log out
    #[Documentation]  Once user is logged in; being able to log out
    #[Tags]  Account
    #Delete Model
    #Log Out User