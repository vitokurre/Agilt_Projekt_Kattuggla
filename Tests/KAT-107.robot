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
    Wait Until Page Contains  Welcome to Labelf!

Navigate on Side
    Sleep  3s
    Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${DATASETMENU}
    Click Element  ${DATASETMENU}
    Wait Until Page Contains Element  ${MYDATASET}
    ${SAVEDTEXTMYDATASET}  Get Text  ${MYDATASET}
    Log  ${SAVEDTEXTMYDATASET}
    Should Be Equal  My Datasets (1)  ${SAVEDTEXTMYDATASET}
     Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${MYMODELS}
    ${SAVEDTEXTMYMODELS}  Get Text  ${MYMODELS}
    Log  ${SAVEDTEXTMYMODELS}
    Should Be Equal  My Models (1)  ${SAVEDTEXTMYMODELS}
    Wait Until Page Contains Element  ${INTEGRATIONMENU}
    Click Element  ${INTEGRATIONMENU}


*** Variables ***

${MODELSMENU}  //*[@id="models-button-navbar"]/div/span[1]
${DATASETMENU}  //*[@id="app"]/div[7]/div[1]/nav/div/a[2]/div/span[1]
${MYMODELS}  //*[@id="app"]/div[7]/div[1]/main/div/div/nav/div/div[1]
${SAVEDTEXTMYMODELS}
${SAVEDTEXTMYDATASET}
${INTEGRATIONMENU}  //*[@id="app"]/div[7]/div[1]/nav/div/a[3]/div/span[1]
${MYDATASET}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav[1]/div/div[1]

*** Test Cases ***
User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  Open browser
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

User Can Navigate On Site
    [Documentation]  Once user is logged in; user can navigate around on the page
    [Tags]  Account
    Navigate on Side

#User Can Log out
#    [Documentation]  Once user is logged in; being able to log out
#    [Tags]  Account
#    Log Out User