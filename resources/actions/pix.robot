***Settings***
Documentation    KW da feature de fluxos e pagamentos PIX 

***Variables***
${PIX_TEXT}     Digite o valor da sua transferência via PIX
${PIX_TEXT2}    Favor informar a chave para qual deseja efetuar o pagamento do valor informado


***Keywords***
Go To PIX Menu
    Click Text    Pix

Validate PIX Menu
    Wait Until Page Contains    PIX    

    Wait Until Page Contains    Minhas chaves
    #Wait Until Page Contains    Limite PIX
    Wait Until Page Contains    Pagar com PIX

Include Cellphone As PIX Key
    [Arguments]                 ${USER_CELLPHONE}
    Click Text                  Minhas chaves
    Wait Until Page Contains    Minhas chaves
    Click Text                  Criar nova chave
    Sleep                       2
    Wait Until Page Contains    Registrar chaves
    Click Text                  Celular
    Sleep                       2
    Wait Until Page Contains    Registrar celular
    Input Text                  accessibility_id=renderText.input.id    ${USER_CELLPHONE}
    Click Text                  Registrar chave
    Sleep                       2

Include Email As PIX Key
    [Arguments]                 ${USER_EMAIL}
    Click Text                  Minhas chaves
    Wait Until Page Contains    Minhas chaves
    Click Text                  Criar nova chave
    Sleep                       2
    Wait Until Page Contains    Registrar chaves
    Click Text                  E-mail
    Sleep                       2
    Wait Until Page Contains    Registrar e-mail
    Input Text                  accessibility_id=renderText.input.id    ${USER_EMAIL}
    Click Text                  Registrar chave
    Sleep                       2


Include An Random PIX Key
    Click Text                  Minhas chaves
    Wait Until Page Contains    Minhas chaves
    Click Text                  Criar nova chave
    Sleep                       2
    Wait Until Page Contains    Registrar chaves
    Click Text                  Chave aleatória
    Sleep                       2
    Wait Until Page Contains    Registrar chave aleatória
    Click Element               accessibility_id=registerKeyButton
    Sleep                       5


Validate PIX Key
    [Arguments]                 ${USER_KEY}
    Wait Until Page Contains    Minhas chaves
    Wait Until Page Contains    ${USER_KEY}

Pay With PIX
    Wait Until Page Contains    Pagar com PIX
    Click Text                  Pagar com PIX

Digit PIX Value
    [Arguments]                 ${VALUE}
    Wait Until Page Contains    Pagar via PIX
    Click Text                  Digite a chave PIX

    Wait Until Page Contains    ${PIX_TEXT}
    Wait Until Page Contains    Saldo disponível:
    Input Text                  class=android.widget.EditText    ${VALUE}
    Click Text                  Continuar

Digit PIX Key
    [Arguments]    ${PIX_KEY}

    Wait Until Page Contains    Digite a chave PIX
    Wait Until Page Contains    ${PIX_TEXT2}
    Input Text                  accessibility_id=keyPixInput    ${PIX_KEY}

Confirm PIX Transfer
    Wait Until Page Contains    Você confirma os dados da chave informada?
    Wait Until Page Contains    Titular
    Wait Until Page Contains    Banco
    Wait Until Page Contains    Agência
    Wait Until Page Contains    Conta
    Wait Until Page Contains    Data de transferência
    Click Text                  Pagar

Validate PIX Transfer
    Wait Until Page Contains    Transferência realizada com sucesso

Verify PIX Transfer Document
    Click Element    accessibility_id=receiptButton
    Sleep            3

    #allow download
    Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_button
    Click Element                    id=com.android.permissioncontroller:id/permission_allow_button
    Sleep                            3
    Wait Until Page Contains         Comprovante de transferência
    Wait Until Page Contains         Data de pagamento
    #Wait Until Page Contains         ID de transação
    #Wait Until Page Contains         Código de autenticação

Download PIX Transfer Document
    Click Element    accessibility_id=downloadButton

Share PIX Transfer Document
    Click Element                accessibility_id=shareButton
    Sleep                        3                                           
    Element Should Be Visible    id=android:id/content_preview_image_area

Validate Share Document
    Wait Until Element Is Visible    id=android:id/content_preview_image_area
    Click Text                       Messages
    Wait Until Element Is Visible    id=android:id/alertTitle
    #Wait Until Page Contains       Select conversation
    Click Text                       New message

Close PIX Transfer Document
    Click Element    accessibility_id=exitButton

User Should Be Redirected To Home Page
    Wait Until Page Contains    Capital Consig
    Wait Until Page Contains    Saldo
