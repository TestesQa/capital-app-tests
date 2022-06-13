***Settings***
Documentation    KW da feature de criar conta

***Variables***
${WELCOME}    Bem-vindo(a)

***Keywords***
Fill user CPF For Create Account
     [Arguments]                 ${user_CPF}
     Wait Until Page Contains    ${WELCOME}
     Click Element               accessibility_id=cpf
#    Sleep                       2
     Input Text                  accessibility_id=cpf    ${user_CPF}
     Click Text                  Continuar


Fill Name And Email
    [Arguments]    ${USER_NAME}              ${USER_EMAIL}    
    Input Text     accessibility_id=name     ${USER_NAME}
    Input Text     accessibility_id=email    ${USER_EMAIL}
    Click Text     Continuar

Create Password
    [Arguments]    ${USER_PWD}
    Input Text     accessibility_id=password           ${USER_PWD}
    Input Text     accessibility_id=confirmPassword    ${USER_PWD}
    Click Text     Próximo

Cellphone Validation
    [Arguments]    ${user_cellphone}
    Input Text     accessibility_id=phone    ${user_cellphone}
    Click Text     Continuar

Validate Code
    [Arguments]                 ${CODE}
    Wait Until Page Contains    Código de verificação
    Input Text                  class=android.widget.EditText    ${CODE}
    #autofill
    Sleep                       1
    Wait Until Page Contains    Dados enviados
    Click Text                  Concluir

CPF Already Cadastrated
    Wait Until Page Contains    CPF já cadastrado

Validate CPF Error Message
    Sleep                       1
    Wait Until Page Contains    Por favor, insira um CPF válido    

Accept User Terms
    Wait Until Page Contains    Termos de uso e política de privacidade
    Swipe                       150     1880    900    1880

Select Document
    [Arguments]    ${DOC}
    Click Text     ${DOC}
    Click Text     Próximo

Document Tutorial
    Wait Until Page Contains    Aqui vai algumas dicas para você capturar uma boa foto do seu documento.
    Click Text                  Entendido

Take Picture 1
    Wait Until Page Contains         Documento
    Click Text                       Tirar foto da frente

    Sleep                            2
    Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_button
    Click Element                    id=com.android.permissioncontroller:id/permission_allow_button
    Sleep                            1

