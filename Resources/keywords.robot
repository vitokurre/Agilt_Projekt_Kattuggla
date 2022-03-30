*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}

Go To Web Page
    Maximize Browser Window
    Go To  ${URL}
    Wait Until Page Contains  Want to talk to us?

End Web Test
    Close Browser