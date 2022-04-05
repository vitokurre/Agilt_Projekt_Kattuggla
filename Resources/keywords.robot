*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Set Window Size  1920  1080
    Maximize Browser Window

Go To Web Page
    Go to  ${URL}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]

Log in User
    Input Text  ${MAIL}   checdd@gmail.com
    Input Text  ${PASSWORD}  kufowo92
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!

Select Team Kattugla As Workspace
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains Element  ${MAINMENULIST}
    Click Element  ${MAINMENUTEAMKATTUGGLA}
    Wait Until Page Contains Element  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
    Click Element  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i

Create A Model
    Wait Until Page Contains Element  //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a/div
    Wait Until Page Contains Element  //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a/div/i
    Click Element  //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a/div/i
    Wait Until Page Contains  Create your own model from scratch.
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button/div
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
    Wait Until Page Contains  Please click on the column containing the text
    Wait Until Page Contains Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button/div
    Sleep  1s
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button/div
    Wait Until Page Contains  Setup

End Web Test
    Close Browser