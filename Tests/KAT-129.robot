*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Log in User
    Input Text  ${MAIL}   marcus.davidsson@iths.se
    Input Text  ${PASSWORD}  vitoKurre2022
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  My first workspace

Navigate dataset
    Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${DATASETMENU}
    Click Element  ${DATASETMENU}
    Wait Until Page Contains Element  ${ADDADATASET+}
    Click Element  ${ADDADATASET+}
    Wait Until Page Contains  Upload a .csv or excel file from my own computer. Make sure its a valid file format.
    Wait Until Page Contains Element  ${SELECT-CSV}
    Click Element  ${SELECT-CSV}
    Wait Until Page Contains  Please add a dataset containing the texts you would like to add. Right now we are supporting csv(Comma Separated Values) files and Excel files.
    Wait Until Page Contains Element  ${DROPZONE}
    Click Element  ${DROPZONE}
    Choose file     ${UPLOADFILE}  C:\\Users\\Jakob\\PycharmProjects\\Agilt_Projekt_Kattuggla\\Resources\\Upload\\all_mixed_languages_no_se_en_de_fi_dk_-_Sheet1 (3) (1).csv
    Sleep  5 s

    Double Click Element  ${NAMEDATASET}
    Press Keys  ${NAMEDATASET}  CTRL+A+DELETE
    Input Text  ${NAMEDATASET}  Jakob

    Wait Until Page Contains Element  ${UPLOADBUTTON}
    Click Element  ${UPLOADBUTTON}
    Sleep  2s
    Wait Until Page Contains  My Datasets (1)
    Wait Until Page Contains Element  ${TREEDOTS}
    Click Element  ${TREEDOTS}
    Wait Until Page Contains Element  ${DELETEDATASET}
    Click Element  ${DELETEDATASET}
    Wait Until Page Contains Element  ${CONFIRMDELETE}
    Click Element  ${CONFIRMDELETE}
    Wait Until Page Contains  Welcome! Let's upload your first dataset!



Navigate to log out
    Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${USERACCOUNTMENU}
    Click Element  ${USERACCOUNTMENU}
    Wait Until Page Contains Element  ${LOGOUTBUTTON}
    Click Element  ${LOGOUTBUTTON}
    Wait Until Page Contains Element  ${DONTHAVEANACCOUNT?}
    ${SAVEDTEXTDONTHAVEANACCOUNT?}  Get Text  ${DONTHAVEANACCOUNT?}
    Log  ${SAVEDTEXTDONTHAVEANACCOUNT?}
    Should Be Equal  DON'T HAVE AN ACCOUNT? SIGN UP  ${SAVEDTEXTDONTHAVEANACCOUNT?}

*** Variables ***

${MODELSMENU}  //*[@id="models-button-navbar"]/div/span[1]
${DATASETMENU}  //*[@id="app"]/div[6]/div[1]/nav/div/a[2]
                #//*[@id="app"]/div[6]/div[1]/nav/div/a[2]/div/span[1]
               # //*[@id="app"]/div[7]/div[1]/nav/div/a[2]/div/span[1]   <--- gamla
${MYMODELS}  //*[@id="app"]/div[7]/div[1]/main/div/div/nav/div/div[1]
${SAVEDTEXTMYMODELS}
${SAVEDTEXTMYDATASET}
${INTEGRATIONMENU}  //*[@id="app"]/div[6]/div[1]/nav/div/a[3]/div/span[1]
${MYDATASET}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav[1]/div/div[1]
${SMALLARROWBUTTONINTEGRATION}  //*[@id="app"]/div[5]/div[1]/main/div/div/ul/li[1]/div[1]/nav/div/i
${HAMBURGERMENU}  //*[@id="hamburger-menu-button"]/div/i
${HAMBURGERMENUMODELS}  //*[@id="app"]/div[2]/div/div[1]/div[3]/a/div[1]/div
${MIXEDLANGUGETEXTELEMENT}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[1]/p[1]
${SAVEDTEXTMIXEDLANGUGETEXT}
${USERACCOUNTMENU}  //*[@id="app"]/div[7]/div[1]/nav/div/div[4]/div/button/div/div/span
${LOGOUTBUTTON}  //*[@id="logout-button"]/div[1]/div
${DONTHAVEANACCOUNT?}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]/div
${SAVEDTEXTDONTHAVEANACCOUNT?}
${ADDADATASET+}  //*[@id="app"]/div[5]/div[1]/main/div/div/div[1]/nav/div[1]/a/div/i
${SELECT-CSV}  //*[@id="app"]/div[1]/div/div/div[2]/div/div/div[1]/div/div[2]/button/div
${DROPZONE}  //*[@id="dropzone"]
${DRAGNDROP}  //*[@id="fileUpload"]
${ADDANAMEFIELD}  //*[@id="app"]/div[1]/div/div/form/div/form/div[1]/div/div/div[1]/div/div/div[1]
${NAMEDATASET}  //*[@id="app"]/div[1]/div/div/form/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${UPLOADBUTTON}  //*[@id="app"]/div[1]/div/div/form/div/div[2]/button
${TREEDOTS}  //*[@id="app"]/div[6]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button
${DELETEDATASET}  //*[@id="delete-button"]
${CONFIRMDELETE}  //*[@id="app"]/div[2]/div/div/div[3]/button
${UPLOADFILE}  //*[@id="fileUpload"]


*** Test Cases ***
User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  Regression
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Regression
    Log in User

User Can Navigate On Site Dataset
    [Documentation]  Once user is logged in; user can navigate around on the page, datasetmenu
    [Tags]  Regression
    Navigate dataset


#User Can Log out
   # [Documentation]  Once user is logged in and done with Labelf; being able to log out
    #[Tags]  Regression
    #Navigate to log out