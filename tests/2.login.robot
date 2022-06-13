***Settings***
Documentation    Testes referentes aos cenários de login do app

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

**Test Cases**
Deve realizar o login com sucesso
    [Tags]     sucesso
    # TEST OK - PASSING
    &{user}    Create Dictionary    cpf=65098872073    senha=Teste123!

    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo


Deve realizar o login logout com sucesso
    # TEST OK - PASSING
    [Tags]                      logout
    &{user}                     Create Dictionary    cpf=65098872073    senha=Teste123!    nome=Teste do pepe
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo
    Go To Menu                  ${user.nome}
    Logout Account
    Validate Enter Account

Validar Fluxo interrompido se CPF não for informado
    [Tags]                 vazio
    # TEST OK - PASSING
    &{user}                Create Dictionary    cpf=${EMPTY}
    Go To Login Form
    Validate Page Title    Informe seu CPF
    Fill User CPF          ${user.cpf}
    Click Text             Entrar na conta
    Validate Page Title    Informe seu CPF

Deve tentar realizar login com CPF invalido
    # TEST OK - n le mensagem - Rever mensagem
    [Tags]                        invalido
    Go To Login Form
    Fill User CPF                 15249189899
    Wait Until Page Contains      Informe seu CPF
    Wait Until Page Contains      Entrar na conta    


Deve tentar realizar o login com senha invalida
    [Tags]                      senha
    # TEST OK - n le mensagem - Rever mensagem
    Go To Login Form
    Fill User CPF               44820379070
    Fill User Password          pwd12345
    Wait Until Page Contains      Informe sua senha
    Wait Until Page Contains      Entrar na conta

Deve recuperar senha
#solicitado id campo de inserir cod
    [Tags]                      recuperar
    Go To Login Form
    Fill User CPF               45501733005
    Change Password
    Wait Until Page Contains    Esqueceu sua senha?
    Click Text                  Continuar
    Wait Until Page Contains    Código de recuperação
    #Input Text                   id elemento             codigo setado
    #New Password                Teste123!