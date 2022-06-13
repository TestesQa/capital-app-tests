***Settings***
Documentation    Testes referentes aos cenários de transferência 

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

**Test Cases**
Botão "Continuar" não deve funcionar se valor for zero
    [Tags]                      limitemin
    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value= 0000
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To Transferências
    Fill Transfer Value                                         ${user.value}
    Validate Button Is Not Working If Transfer Value Is Zero

Botão "Continuar" não deve funcionar se valor maior que saldo
    [Tags]    limitemax

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value= 1000000000000
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To Transferências
    Fill Transfer Value                   ${user.value}
    Sleep                                 2
    Validate Transfer Max Value
    
#Deve realizar a transferencia e não salvar contato

# Deve realizar a transferência para novo contato

Deve realizar a transferência para um contato salvo
    [Tags]    contato

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value= 4990
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To Transferências
    Fill Transfer Value                   ${user.value}
    Sleep                                 2
    Validate Transfer Page
    Select Contact For Transfer Values
    Confirm Transfer And Finish It        
    Validate Transfer Success           
    Go Back To Homepage

Deve realizar a transferência e visualizar o comprovante no app
    [Tags]    view

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value= 4990
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To Transferências
    Fill Transfer Value                   ${user.value}
    Sleep                                 2
    Validate Transfer Page
    Select Contact For Transfer Values
    Confirm Transfer And Finish It 
    Validate Transfer Success
    Verify TED Transfer Document
    Close TED Transfer Document 
    Go Back To Homepage
    
Deve realizar a transferência e Compartilhar o comprovante
    [Tags]    share

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value= 4990
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To Transferências
    Fill Transfer Value                   ${user.value}
    Sleep                                 2
    Validate Transfer Page
    Select Contact For Transfer Values
    Confirm Transfer And Finish It 
    Validate Transfer Success
    Verify TED Transfer Document
    Share TED Transfer Document

Deve realizar a transferência e salvar o comprovante
    [Tags]    download

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value= 4990
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To Transferências
    Fill Transfer Value                   ${user.value}
    Sleep                                 2
    Validate Transfer Page
    Select Contact For Transfer Values
    Confirm Transfer And Finish It 
    Validate Transfer Success
    Verify TED Transfer Document
    Download TED Transfer Document
