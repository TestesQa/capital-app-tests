***Settings***
Documentation    KW da feature de acesso conta

***Variables***
${ENTER_ACCOUNT}    Entrar na conta

***Keywords***
Enter Account
    Click Text    ${ENTER_ACCOUNT}

Validate Enter Account
    Wait Until Page Contains    Acessar sua conta

#reforar apos implementação id/acessibility id + criar arry
Fill User CPF
    [Arguments]      ${USER_CPF}                      
    Input Text       accessibility_id=cpf    ${USER_CPF}    
    Enter Account

Fill User Password
    [Arguments]                 ${USER_PASSWORD} 
    Wait Until Page Contains    Informe sua senha
    Input Text                  accessibility_id=password    ${USER_PASSWORD}    
    Enter Account

Change Password
    Wait Until Page Contains    Informe sua senha
    Click Text                  Esqueci minha senha

New Password
    [Arguments]                 ${NEW_PASSWORD} 
    Wait Until Page Contains    Redefina sua senha
    Input Text                  id elemento           ${NEW_PASSWORD}
    # confirmar nova senha
    Input Text                  id elemento           ${NEW_PASSWORD}
    Click Text                  Salvar                