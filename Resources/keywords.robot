*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}

Go To Web Page
    Maximize Browser Window
    Go To  ${URL}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]

Log in User
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input  checdd@gmail.com
    Input Text  //*[@id="password"]  kufowo92
    Click Element   //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]/div
    Wait Until Page Contains  Welcome to Labelf!

End Web Test
    Close Browser