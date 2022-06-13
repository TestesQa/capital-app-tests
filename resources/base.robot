***Settings***
Documentation    Arquivo base KW, libraries e imports

Library     AppiumLibrary
Library     FakerLibrary              locale=pt_BR
Library     libs/drag_drop.py
Resource    helpers.robot
Resource    actions/requests.robot
Resource    actions/login.robot
Resource    actions/pix.robot
Resource    actions/menu.robot
Resource    actions/transfer.robot

***Variables***
${REMOTE_URL}                   http://localhost:4723/wd/hub
${ANDROID_AUTOMATION_NAME}      UiAutomator2
${ANDROID_PLATFORM_NAME}        Android
${DEVICE_NAME}                  Emulator
${ANDROID_APP}                  ${EXECDIR}/app/CapitalConsig-fba6101a78f34a3e8c31f66eb8d680bb-signed.apk

***Keywords***
Open Session
    Set Appium Timeout    10
    Open Application      ${REMOTE_URL}
    ...                   automationName=${ANDROID_AUTOMATION_NAME}     platformName=${ANDROID_PLATFORM_NAME}
    ...                   deviceName=${DEVICE_NAME}             app=${ANDROID_APP}
    Get Started

Close Session
    Capture Page Screenshot
    Close Application

Validate Page Title
    [Arguments]                 ${PAGE-TITLE}
    Sleep                       2
    Wait Until Page Contains    ${PAGE-TITLE}