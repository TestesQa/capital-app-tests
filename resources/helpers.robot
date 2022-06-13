***Settings***
Documentation    KW helpers, para facilitar processo de desenvolvimento da automação

***Variables***
${START}             Realizando sonhos
${CREATE_ACCOUNT}    Criar conta
${LOGIN_ACCOUNT}     Acessar sua conta

***Keywords***
Get Started
    Wait Until Page Contains    ${START}

Go To Signup Form
    Click Text                  ${CREATE_ACCOUNT}
    Wait Until Page Contains    Bem-vindo(a)

Go To Login Form
    Click Text                  ${LOGIN_ACCOUNT}
    Wait Until Page Contains    Informe seu CPF

Go Back To Homepage
    Click Element    accessibility_id=backDashboardButton
    #//android.view.ViewGroup[@content-desc="backDashboardButton"]

