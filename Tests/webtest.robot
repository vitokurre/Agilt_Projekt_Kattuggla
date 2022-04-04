*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}  https://stag.labelf.ai/login

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page


User Can Log In
    Log in User

User Can Change Workspace
    Select Team Kattugla As Workspace

User Can Create Model
    Create A Model


#User Can Delete Model


#User Can Log out








