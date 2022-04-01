*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}

Go To Web Page
    Maximize Browser Window
    Go To  ${URL}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]

End Web Test
    Close Browser