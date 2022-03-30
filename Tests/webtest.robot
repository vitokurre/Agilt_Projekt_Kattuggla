*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary
Test Setup    Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}  headlesschrome
${URL}  https://www.labelf.ai/

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page






