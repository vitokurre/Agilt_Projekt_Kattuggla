*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***





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


This is Kat 50 task text
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model


User logs out
    [Documentation]  Once user is finished with her work; being able to log out
    [Tags]  LogsOut
    Log Out User





