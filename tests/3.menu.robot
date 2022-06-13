***Settings***
Documentation    Testes referentes aos cenários do menu do app

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

**Test Cases**
#Deve realizar o login e acessar as configurações de notificação
#tela/feat ainda não implementada 

Deve realizar o login e acessar as configurações de Dados Pessoais
    [Tags]                      pessoais
    &{user}                     Create Dictionary    cpf=07151685092    senha=Test123!    nome=Lucas Teste
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    Go To Menu                  ${user.nome}
    Go To Personal Data   
    Validate Personal Data Page  

Deve realizar a atualizacao dos dados pessoais  
    [Tags]                      atualizar-pessoais
    &{user}                     Create Dictionary    cpf=07151685092    senha=Test123!    nome=Lucas Teste  motherName=Pepe The Frog    
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    Go To Menu                  ${user.nome}
    Go To Personal Data   
    Validate Personal Data Page
    Change Mothers Name         ${user.motherName}


Deve realizar o login e acessar as configurações de Dados (Endereço)
    [Tags]                      endereco
    &{user}                     Create Dictionary    cpf=07151685092    senha=Test123!    nome=Lucas Teste
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    Go To Menu                  ${user.nome}
    Go To Address Data
    Validate Address Data Page

#ajuda

Deve realizar o login e acessar as configurações de Sobre
    [Tags]                      sobre
    &{user}                     Create Dictionary    cpf=07151685092    senha=Test123!    nome=Lucas Teste
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    Go To Menu                  ${user.nome}
    Go To About Page

Deve realizar o login e acessar as configurações de Termos de uso
    [Tags]                      termos
    &{user}                     Create Dictionary    cpf=07151685092    senha=Test123!    nome=Lucas Teste
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    Go To Menu                  ${user.nome}
    Go To Terms

Deve validar o histórico da conta (Extrato)
    [Tags]                      extrato
    &{user}                     Create Dictionary    cpf=07151685092    senha=Test123!    nome=Lucas Teste
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    View Account History
    Sleep                       2
    Return To Account Home Page

