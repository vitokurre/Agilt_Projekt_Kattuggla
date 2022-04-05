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
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!

Select Team Kattugla As Workspace
    Click Element  ${COOKIEDOWN}
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains Element  ${MAINMENULIST}
    Click Element  ${MAINMENUTEAMKATTUGGLA}
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    #${ATTRIBUTSTRINGTEAMKATTUGGLA}= Get Element Attribute  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/span Team Kattuggla här vill vi verfiera namnet Team Kattuggla

Create A Model
    Sleep  1s
    Wait Until Page Contains Element  ${NEWMODELBUTTON}
    Click Element  ${NEWMODELBUTTON}
    Wait Until Page Contains  Create your own model from scratch.
    Wait Until Page Contains Element  ${SETUPCONTINUE}
    Click Element  ${SETUPCONTINUE}
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  ${DATASETCONTINUE}
    Wait Until Page Contains  Please click on the column containing the text
    Wait Until Page Contains Element  ${COLUMNCONTINUE}
    Sleep  1s
    Click Element  ${COLUMNCONTINUE}
    Wait Until Page Contains  Name your model
    Sleep  1s
    Click Element  ${CONTINUESCRATCH}
    Wait Until Page Contains  Please click on the column containing the text
    Sleep  1s


Delete Model
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODELMENU}
    Click Element  ${MODELMENU}
    Wait Until Page Contains Element  ${DELETE}
    Click Element  ${DELETE}
    Wait Until Page Contains Element  ${SUREDELETE}
    Click Element  ${SUREDELETE}
    Sleep  1s

End Web Test
    Close Browser