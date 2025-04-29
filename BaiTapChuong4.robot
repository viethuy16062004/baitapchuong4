*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}       Admin
${PASSWORD}       admin123
${INVALID_USER}   saiuser
${INVALID_PASS}   saipass

*** Test Cases ***
Login Thành Công
    [Documentation]  Kiểm tra đăng nhập thành công 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains Element     xpath=//h6[contains(text(),"Dashboard")]    10s
    Page Should Contain Element     xpath=//h6[contains(text(),"Dashboard")]
    Log To Console    Đăng nhập thành công
    Close Browser

Login Thất Bại
    [Documentation]  Kiểm tra đăng nhập thất bại 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${INVALID_USER}    
    Input Text    name=password    ${INVALID_PASS}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains Element    xpath=//p[contains(@class, "oxd-alert-content-text")]    10s
    Page Should Contain    Invalid credentials
    Log To Console    Đăng nhập thất bại 
    Close Browser
