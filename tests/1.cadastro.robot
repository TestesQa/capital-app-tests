***Settings***
Documentation    Testes referentes aos cenários de cadastro

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

***Variables***
${PASSWORD_TEXT}    Sua senha deve conter no mínimo 8 caracteres, letras maiúsculas, minúsculas, números e símbolos.

**Test Cases**
Deve tentar realizar o cadastro com CPF inválido
    # aguardo tratativa de msg da animação
    [Tags]                              invalido
    Go To Signup Form
    Fill user CPF For Create Account    15249189899
    Validate CPF Error Message

Deve tentar realizar cadastro com CPF já cadastrado
    # aguardo tratativa de msg da animação
    [Tags]                              cadastrado
    Go To Signup Form
    Fill user CPF For Create Account    44820379070
    CPF Already Cadastrated

Deve realizar o cadastro com sucesso
    [Tags]    sucesso

    ${CPF}       FakerLibrary.cpf
    ${NAME}      FakerLibrary.name
    ${EMAIL}     FakerLibrary.email
    &{person}    Create Dictionary     cpf=${CPF}    nome=${NAME}    email=${EMAIL}    password=Teste123!

    Go To Signup Form
    Fill user CPF For Create Account    ${person.cpf}
    Validate Page Title                 Criando sua conta

    Fill Name And Email    ${person.nome}    ${person.email}

    Validate Page Title         Criando sua senha
    Wait Until Page Contains    ${PASSWORD_TEXT}
    Create Password             ${person.password}

    Validate Page Title     Verifique seu número
    Cellphone Validation    41992036944
    Validate Code           123456
    Sleep                   1
    Go To Login Form
    Fill User CPF           ${person.cpf}
    Fill User Password      ${person.password}
    Sleep                   2
    Validate Page Title     Estamos quase lá!       
    Click Text              Continuar
    Sleep                   1
    Accept User Terms

    Validate Page Title  Documento
    Select Document  RG
    Document Tutorial
    # usar camera do device
    Take Picture 1


Deve tentar realizar cadastro com email incorreto
    [Tags]    email

    ${CPF}       FakerLibrary.cpf
    ${NAME}      FakerLibrary.name
    &{person}    Create Dictionary    cpf=${CPF}    nome=${NAME}    email=email#invalido.com

    Go To Signup Form
    Fill user CPF For Create Account    ${person.cpf}
    Validate Page Title                 Criando sua conta

    Fill Name And Email              ${person.nome}                      ${person.email}
    Wait Until Element Is Visible    Insira o seu e-mail corretamente    5

# senha fraca

Deve realizar a tentativa com numero de celular incompleto
    [Tags]       celular
    #desenvolver
    ${CPF}       FakerLibrary.cpf
    ${NAME}      FakerLibrary.name
    ${EMAIL}     FakerLibrary.email
    &{person}    Create Dictionary     cpf=${CPF}    nome=${NAME}    email=${EMAIL}

    Go To Signup Form
    Fill user CPF For Create Account    ${person.cpf}
    Validate Page Title                 Criando sua conta

    Fill Name And Email    ${person.nome}    ${person.email}

    Validate Page Title         Criando sua senha
    Wait Until Page Contains    ${PASSWORD_TEXT}
    Create Password             Teste123!

    Validate Page Title     Verifique seu número
    Cellphone Validation    419920369

Deve validar cpf em aprovação
    # TEST OK - PASSING
    [Tags]     aprovacao
    &{user}    Create Dictionary                    cpf=45501733005                senha=Teste123!    status=Dados em análise
    ...        botao=Voltar para página de login    home_text=Acessar sua conta

    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       2
    Validate Page Title         Dados em análise
    Wait Until Page Contains    ${user.botao}
    Click Text                  ${user.botao}
    Wait Until Page Contains    ${user.home_text}