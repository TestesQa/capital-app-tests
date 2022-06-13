***Settings***
Documentation    Testes referentes aos cenários de pagamentos PIX 

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

**Test Cases**
Menu PIX - Ao acessar menu PIX usuário deve conseguir ver opções de ações
    # TEST OK - PASSING
    [Tags]                      menu
    #deve ser "minhas chaves", "limite" e "pagar com pix"
    Go To Login Form
    Fill User CPF               09342237428
    Fill User Password          eujogo10
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Validate PIX Menu
    Sleep                2

#feature não implementada - backlog QA Automation
# Menu PIX - Deve conseguir alterar o limite diário de pagamentos PIX
#    [Tags]    limite

# #feature não implementada - backlog QA Automation
# Chaves PIX - Cadastrar CPF como chave PIX
#    [Tags]    cadastrocpf

Chaves PIX - Cadastrar Telefone como chave PIX
    # TEST OK - PASSING
    [Tags]                      cadastro1
    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    telefone=41999991234
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Validate PIX Menu
    Include Cellphone As PIX Key    ${user.telefone}
    Validate PIX Key                ${user.telefone}


Chaves PIX - Cadastrar Email como chave PIX
    # TEST OK - PASSING
    [Tags]                      cadastro2
    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    email=teste@teste.com
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Validate PIX Menu
    Include Email As PIX Key    ${user.email}
    Validate PIX Key            ${user.email}

Chaves PIX - Cadastrar chave aleatória PIX
    # TEST OK - PASSING
    
    [Tags]                      cadastro3
    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    email=teste@teste.com
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Validate PIX Menu
    Include An Random PIX Key

#feature não implementada - backlog QA Automation
# Chaves PIX - Excluir CPF como chave PIX
#    [Tags]    exclusaocpf

# Chaves PIX - Excluir Telefone como chave PIX
#     [Tags]    exclusao1

# Chaves PIX - Excluir Email como chave PIX
#     [Tags]    exclusao2

# Chaves PIX - Excluir chave aleatória PIX
#     [Tags]    exclusao3

#feature não implementada - backlog QA Automation
# Deve realizar pagamento PIX usando chave CPF
#    [Tags]    pagamento1

Deve realizar pagamento PIX usando chave Telefone
    # TEST OK - PASSING
    [Tags]    pagamento2

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value=5000    key=11988881245
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Pay With PIX
    Digit PIX Value                           ${user.value}
    Digit PIX Key                             ${user.key}
    Click Text                                Continuar
    Confirm PIX Transfer
    Sleep                                     2
    Validate PIX Transfer
    Go Back To Homepage
    User Should Be Redirected To Home Page


# Caso sistema não identifique se a chave é CPF ou Telefone usuário deve finalizar op
#     [Tags]    excecao

Deve realizar pagamento PIX usando chave email
    # TEST OK - PASSING
    [Tags]    pagamento3

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value=5000    key=emaildeteste@outlook.com
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Pay With PIX
    Digit PIX Value                           ${user.value}
    Digit PIX Key                             ${user.key}
    Click Text                                Continuar
    Confirm PIX Transfer
    Sleep                                     2
    Validate PIX Transfer
    Go Back To Homepage
    User Should Be Redirected To Home Page

# Deve realizar pagamento PIX usando chave aleatória
#     [Tags]    pagamento4


Deve realizar o pagamento e visualizar o comprovante no APP
    # TEST OK - PASSING
    [Tags]    comprovante
    
    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value=5000    key=11988881245
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Pay With PIX
    Digit PIX Value                           ${user.value}
    Digit PIX Key                             ${user.key}
    Click Text                                Continuar
    Confirm PIX Transfer
    Sleep                                     2
    Validate PIX Transfer
    Verify PIX Transfer Document
    Close PIX Transfer Document
    Go Back To Homepage
    User Should Be Redirected To Home Page

Deve Conseguir Fazer O Downaload Do Comprovante
    # TEST
    [Tags]      download

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value=8990    key=11988881245
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Pay With PIX
    Digit PIX Value                           ${user.value}
    Digit PIX Key                             ${user.key}
    Click Text                                Continuar
    Confirm PIX Transfer
    Sleep                                     2
    Validate PIX Transfer
    Verify PIX Transfer Document
    Download PIX Transfer Document

Deve Conseguir Compartilhar O Comprovante
    # TEST OK - PASSING
    [Tags]      share

    &{user}                     Create Dictionary    cpf=09342237428    senha=eujogo10    value=8990    key=11988881245
    Go To Login Form
    Fill User CPF               ${user.cpf}
    Fill User Password          ${user.senha}
    Sleep                       5
    Wait Until Page Contains    Capital Consig
    Page Should Contain Text    Saldo

    Go To PIX Menu
    Pay With PIX
    Digit PIX Value                           ${user.value}
    Digit PIX Key                             ${user.key}
    Click Text                                Continuar
    Confirm PIX Transfer
    Sleep                                     2
    Validate PIX Transfer
    Verify PIX Transfer Document
    Share PIX Transfer Document
    Validate Share Document

# #feature não implementada - backlog QA Automation
# Deve salvar contato usando um pagamento PIX
#    [Tags]    contato

# #feature não implementada - backlog QA Automation
# Deve conseguir visualizar os contatos usando chave PIX
#    [Tags]    contatos