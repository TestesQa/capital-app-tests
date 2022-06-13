***Settings***
Documentation    KW da feature de operações no MENU

***Variables***


***Keywords***
Go To Menu
    [Arguments]                 ${USER_NAME}
    Click Element               accessibility_id=menuButton
    Wait Until Page Contains    ${USER_NAME}


Go To Personal Data
    Click Element               accessibility_id=DadosButton
    Wait Until Page Contains    Dados Pessoais

Validate Personal Data Page
    Wait Until Page Contains    Favor informar seus dados pessoais para atualizar.
    Element Should Be Visible   accessibility_id=identification
    Element Should Be Visible   xpath=//android.widget.EditText[@content-desc="org"]
    Element Should Be Visible   accessibility_id=date
    Element Should Be Visible   accessibility_id=birth
    Element Should Be Visible   accessibility_id=motherName


Go To Address Data
    Click Element               accessibility_id=EndereçoButton   
    Wait Until Page Contains    Endereço

Validate Address Data Page
    Wait Until Page Contains    Coloque os seus dados de endereço.
    Element Should Be Visible   accessibility_id=cep
    Element Should Be Visible   accessibility_id=street
    Element Should Be Visible   accessibility_id=number
    #Element Should Be Visible   id=checkboxTitle
    Element Should Be Visible   accessibility_id=complement
    Element Should Be Visible   accessibility_id=district
    Element Should Be Visible   accessibility_id=city

Change Mothers Name
    [Arguments]                 ${MOTHER_NAME} 
    Element Text Should Be      accessibility_id=motherName         ${MOTHER_NAME}
    Clear Text                  accessibility_id=motherName
    Input Text                  accessibility_id=motherName         ${MOTHER_NAME} 
    Click Text                  Salvar
    Sleep                       3
    Element Text Should Be      accessibility_id=motherName         ${MOTHER_NAME}

Go To Help Page
    Click Element               accessibility_id=AjudaButton
    Wait Until Page Contains    Precisa de ajuda?

Validate Suport Button
    Wait Until Page Contains    Falar com nosso suporte

Go To About Page
    Click Element               accessibility_id=SobreButton
    Sleep                       2
    #Wait Until Page Contains    Sobre a carteira digital Capital Consig

Go To Terms
    Click Element               accessibility_id=Termo de UsoButton
    Wait Until Page Contains    Termos de uso e política de privacidade

Logout Account
    Wait Until Page Contains    Sair da conta
    Click Text                  Sair da conta

View Account History
    Click Element               xpath=//android.view.ViewGroup[@content-desc="arrowButton"]/android.view.ViewGroup
    Wait Until Page Contains    Histórico

Return To Account Home Page
    Click Element               xpath=//android.view.ViewGroup[@content-desc="arrowButton"]/android.view.ViewGroup
    Wait Until Page Contains    Capital Consig
    Wait Until Page Contains    Saldo