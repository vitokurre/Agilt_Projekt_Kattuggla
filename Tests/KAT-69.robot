*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Log in User Dawid
    Input Text  ${MAIL}   checdd@gmail.com
    Input Text  ${PASSWORD}  kufowo92
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!

Create Dataset With Mixed Languages
    Sleep  1s
    Click Element  ${NEWMODEL}
    Wait Until Page Contains Element  ${CONTINUETOCREATEMODEL}
    Click Element   ${CONTINUETOCREATEMODEL}
    Wait Until Page Contains Element  ${MIXEDLANGUAGESMODELCONTINUE}
    Click Element  ${MIXEDLANGUAGESMODELCONTINUE}
    Wait Until Page Contains Element  ${TRAINDIRECTLYEXISTINGCOLUMN}
    Sleep  1s
    Click Element  ${TRAINDIRECTLYEXISTINGCOLUMN}
    Click Element  ${CONTINUETOCREATEDATASET}
    Wait Until Page Contains  Please click on the column containing the labels
    Sleep  1s
    Click Element  ${FEEDBACK}
    Click Element  ${CONTINUETOCREATEDATASET2}
    Wait Until Page Contains  Setup
    Input Text  ${DESCRIPTION}  Mixed Language Dataset
    Click Element  ${CREATETEXTAREA}
    Sleep  2s

Train Created Dataset With Mixed Languages
    Wait Until Page Contains Element  ${OVERFIEW}
    Click Element  ${OVERFIEW}
    Sleep  2s
    Wait Until Page Contains  I'm currently processing your data, come back later!
    Click Element  ${SHUTDOWNTRAININFORMATION}
    Wait Until Page Contains  This is an overview of the projected distribution of labels (user labeled+predicted by the model) across your datasets.
    Sleep  1200 s
    #Wait Until Page Contains Element  ${MODELSBUTTON}
    #Click Element  ${MODELSBUTTON}
    #Sleep  1s
    Wait Until Page Contains Element  ${STARTTRAINING} 
    Click Element  ${STARTTRAINING}
    Sleep  1s
    Wait Until Page Contains Element  ${LANGUAGEFILTER}
    Click Element  ${LANGUAGEFILTER}
    Sleep  1s
    Wait Until Page Contains Element  ${SWEDISHLANGUAGE}
    Wait Until Page Contains Element  ${DANISHLANGUAGE}
    Wait Until Page Contains Element  ${GERMANLANGUAGE}
    Wait Until Page Contains Element  ${ENGLISHLANGUAGE}
    Sleep  1s
    Scroll Element Into View  ${NORWEGIANLANGUAGE}
    Sleep  1s
    Wait Until Page Contains Element  ${UNKNOWNLANGUAGE}
    Wait Until Page Contains Element  ${FINNISHLANGUAGE}
    Sleep  1s
    Wait Until Page Contains Element  ${CLOSEBUTTON}
    Click Element  ${CLOSEBUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${MODELSBUTTON}
    Click Element  ${MODELSBUTTON}

*** Variables ***

${NEWMODEL}  //*[@id="new-model-button"]/div
${CONTINUETOCREATEMODEL}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button/div
${MIXEDLANGUAGESMODELCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${TRAINDIRECTLYEXISTINGCOLUMN}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div/div[1]
${CONTINUETOCREATEDATASET}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button/div
${FEEDBACK}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[2]/i
${CONTINUETOCREATEDATASET2}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button/div
${DESCRIPTION}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea
${CREATETEXTAREA}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button/div
${OVERFIEW}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div
${LANGUAGEFILTER}  //*[@id="app"]/div[5]/div/div[1]/div[2]/div/div/div/nav/div/button[1]/div
${SWEDISHLANGUAGE}  //*[@id="app"]/div[14]/div/div[1]/div/div[2]/i
${SHUTDOWNTRAININFORMATION}  //*[@id="app"]/div[3]/div/div/button/div/i
${MODELSBUTTON}  //*[@id="models-button-navbar"]/div/span[1]
${DANISHLANGUAGE}  //*[@id="app"]/div[14]/div/div[2]/div/div[2]/i
${GERMANLANGUAGE}  //*[@id="app"]/div[14]/div/div[3]/div/div[2]/i
${ENGLISHLANGUAGE}  //*[@id="app"]/div[14]/div/div[4]/div/div[2]/i
${NORWEGIANLANGUAGE}   //*[@id="app"]/div[14]/div/div[7]/div/div[2]/i
${UNKNOWNLANGUAGE}  //*[@id="app"]/div[14]/div/div[6]/div/div[2]/i
${FINNISHLANGUAGE}  //*[@id="app"]/div[14]/div/div[5]/div/div[2]/i
${CLOSEBUTTON}  //*[@id="close-button"]/div/i

*** Test Cases ***

User can Log in
    [Documentation]  Once logged in; continues working on "My workspace"
    [Tags]  StartUp
    Go To Web Page
    Log in User Dawid

#User Can Create Dataset with Different Languages
    #[Documentation]  Once Language File is apploaded; being able to create Dataset with that file
    #[Tags]  Dataset
    #Create Dataset With Mixed Languages

User Can Train Dataset With Mixed Languages
    [Documentation]  Once Dataset is created; being able to train it
    [Tags]  Tarining Dataset
    Train Created Dataset With Mixed Languages

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    #Delete Model
    Log Out User
