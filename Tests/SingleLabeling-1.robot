*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Choose Model To Add Label
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    Wait Until Page Contains  It does not look like you have trained the model
    Wait Until Page Contains Element  ${STARTTRAINING}
    Click Element  ${STARTTRAINING}
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element  ${ADDLABEL}
    Click Element  ${ADDLABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element  ${NEWLABELNAME}
    Input Text  ${NEWLABELNAME}  Katt
    Wait Until Page Contains Element  ${ADDONELABEL}
    Click Element  ${ADDONELABEL}
    Wait Until Page Contains Element  ${NAMEONFIRSTLABEL}
    Element Text Should Be  ${NAMEONFIRSTLABEL}  KATT
    Wait Until Page Contains Element  ${ADDSEKUNDLABEL}
    Click Element  ${ADDSEKUNDLABEL}
    Wait Until Page Contains Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
    Input Text  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input  Uggla
    Wait Until Page Contains Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
    #detta element är addlabel efter Uggla
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
    Wait Until Page Contains  Choose model type
    Wait Until Page Contains Element  ${CHOOSESINGLE}
    Click Element  ${CHOOSESINGLE}
    Wait Until Page Contains  Lets start by giving Labelf 20 samples




    #Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    #Wait Until Page Contains Element  ${ADDLABEL}
    #Click Element  ${ADDLABEL}
    #Wait Until Page Contains  ${NEWLABELNAME}
    #Input Text  ${NEWLABELNAME}  uggla
    #Wait Until Page Contains Element  ${ADDONELABEL}



*** Variables ***
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${ADDLABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${NEWLABELNAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDONELABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${NAMEONFIRSTLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${ADDSEKUNDLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${CHOOSESINGLE}  //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
#${}
#${}



*** Test Cases ***



#User Can Log In And Rent A Car
#    [Documentation]  Once accessing the website; rent a car and confirm booking
#    [Tags]  VG_test
#    Given User Is Logged In
#    When User Books Car
#    And User Pays With Creditcard
#    Then Car Has Been Booked


User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    Select Team Kattuggla As Workspace
    Create A Model

User can create single labeleing
    [Documentation]  Once created model; being able to chose single labeling when training
    [Tags]  Training
    Choose Model To Add Label

#This is Kat 50 task text
#    [Documentation]  Once a model is created; being able to delete a model
#    [Tags]  Model
#    Delete Model


#User logs out
#    [Documentation]  Once user is finished with her work; being able to log out
#    [Tags]  LogsOut
#    Log Out User





