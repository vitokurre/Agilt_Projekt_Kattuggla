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

*** Test Cases ***

User can Log in
    [Documentation]  Once logged in; continues working on "My workspace"
    [Tags]  StartUp
    Go To Web Page
    Log in User Dawid

User Can Create Dataset with Different Languages
    [Documentation]  Once Language File is apploaded; being able to create Dataset with that file
    [Tags]  Dataset
    Create Dataset With Mixed Languages

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User
