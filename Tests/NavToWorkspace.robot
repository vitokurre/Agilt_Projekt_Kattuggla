*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***
User Can Swich Workspace
    User Can Swich Workspace

*** Variables ***

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

User Can Swich Workspace
    [Documentation]  Once accessing the website; user can switch workspace
    [Tags]  Account
    User Can Swich Workspace

User Can Create Model
    [Documentation]  Once workspace is changed; being able to create model
    [Tags]  Model
    Create A Model

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User