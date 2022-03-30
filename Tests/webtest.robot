*** Settings ***
Documentation  Testing the browser "INFOTIV CAR RENTAL" and it's services focused on Date&Time
...  and being able to see the car selection list.
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary
Library  DateTime
Test Setup    Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}  headlesschrome
${URL}

*** Test Cases ***


