*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Choose Model To Add Label
    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
    #Click On Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
    #Wait Until Page Contains  It does not look like you have trained the model




*** Variables ***

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

This is Kat 50 task text
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model


User logs out
    [Documentation]  Once user is finished with her work; being able to log out
    [Tags]  LogsOut
    Log Out User





