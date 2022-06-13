***Settings***
Documentation    KW da feature de fluxos de transferências

***Variables***
${TRANSFER_TITLE}      Para quem você deseja fazer a transferência?
${TRANSFER_SUCCESS}    Transferência realizada com sucesso
${TRANSFER_NAME}       Titular
${TRANSFER_DATE}       Data de transferência
${PAYMENT_DATE}        Data de pagamento

${MAX_VALUE_ERROR}    Valor não disponível em conta

***Keywords***
Go To Transferências
    Swipe         1024          600    200    600
    Click Text    Transferir

Validate Button Is Not Working If Transfer Value Is Zero
    Wait Until Page Contains          Qual o valor que deseja transferir?
    Element Attribute Should Match    accessibility_id=nextButton            clickable    true
    Click Element                     accessibility_id=nextButton
    Wait Until Page Contains          Qual o valor que deseja transferir?

Fill Transfer Value
    [Arguments]                 ${VALUE}
    Wait Until Page Contains    Qual o valor que deseja transferir?
    Input Text                  accessibility_id=moneyInput            ${VALUE}
    Click Element               accessibility_id=nextButton

Validate Transfer Page
    Wait Until Page Contains    ${TRANSFER_TITLE}

Select Contact For Transfer Values
    #[Arguments]                 ${INDEX} aguardo de implementação do index no id
    Click Element    accessibility_id=accountButton

Go To New Account For Transfer
    Click Element    accessibility_id=otherAccountButton

Confirm Transfer And Finish It
    Wait Until Page Contains     Você confirma os dados de transferência?
    Element Should Be Visible    accessibility_id=amountText                                  
    Wait Until Page Contains     ${TRANSFER_NAME}
    Wait Until Page Contains     ${TRANSFER_DATE}
    Element Should Be Visible    accessibility_id=payButton
    Click Element                xpath=//android.view.ViewGroup[@content-desc="payButton"]


Validate Transfer Success
    Wait Until Page Contains     ${TRANSFER_SUCCESS} 
    Element Should Be Visible    accessibility_id=receiptButton
    Wait Until Page Contains     ${TRANSFER_NAME}
    Wait Until Page Contains     ${PAYMENT_DATE}

Validate Transfer Max Value
    Element Should Contain Text       accessibility_id=errorText     ${MAX_VALUE_ERROR}
    Element Attribute Should Match    accessibility_id=nextButton    clickable             true


Verify TED Transfer Document
    Element Should Be Visible        accessibility_id=receiptButton
    Click Element                    accessibility_id=receiptButton
    Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_button
    Click Element                    id=com.android.permissioncontroller:id/permission_allow_button
    Sleep                            3
    Wait Until Page Contains         Comprovante de transferência
    Wait Until Page Contains         Data de pagamento

Close TED Transfer Document
    Click Element               accessibility_id=exitButton
    Wait Until Page Contains    ${TRANSFER_SUCCESS}

Share TED Transfer Document
    Click Element                accessibility_id=shareButton
    Sleep                        3                                           
    Element Should Be Visible    id=android:id/resolver_list

Download TED Transfer Document
    Click Element               accessibility_id=downloadButton