*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Log in User
    Input Text  ${MAIL}   checdd@gmail.com
    Input Text  ${PASSWORD}  kufowo92
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  My first workspace

Navigate dataset
    Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${DATASETMENU}
    Click Element  ${DATASETMENU}
    Click Element  //*[@id="app"]/div[5]/div[1]/main/div/div/div[1]/nav/div[1]/a
    Wait Until Page Contains Text  Upload a .csv or excel file from my own computer. Make sure its a valid file format.

    #Wait Until Page Contains Element  ${MYDATASET}
    #${SAVEDTEXTMYDATASET}  Get Text  ${MYDATASET}
    #Log  ${SAVEDTEXTMYDATASET}
    #Should Be Equal  My Datasets (1)  ${SAVEDTEXTMYDATASET}

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
${DATASETMENU}  //*[@id="app"]/div[7]/div[1]/nav/div/a[2]/div/span[1]
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


User Can Log out
    [Documentation]  Once user is logged in and done with Labelf; being able to log out
    [Tags]  Regression
    Navigate to log out