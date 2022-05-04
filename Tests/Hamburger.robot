*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Show All Workspaces
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains Element  ${MAINMENULIST}
    Scroll Element Into View  ${TEAMKATTUGGLA}
    Wait Until Page Contains Element  ${TEAMKATTUGGLA}
    Wait Until Page Contains Element  ${KATTUGGLA}
    Wait Until Page Contains Element  ${MYFIRSTWORKSPACE}
    Wait Until Page Contains Element  ${CREATEWORKSPACE}
    Click Element  ${MAINMENU}

*** Variables ***
${TEAMKATTUGGLA}  //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]/div
${KATTUGGLA}  //*[@id="app"]/div[3]/div/div[2]/div[4]/a/div[1]/div
${MYFIRSTWORKSPACE}  //*[@id="app"]/div[3]/div/div[2]/div[3]/a/div[1]/div
${CREATEWORKSPACE}  //*[@id="app"]/div[3]/div/div[2]/div[2]/a/div[1]/div

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

Acces too all workspaces
    [Documentation]  User has access to multiple workspaces
    [Tags]  Main Menu
    Show All Workspaces

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User