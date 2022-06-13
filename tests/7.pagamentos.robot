***Settings***
Documentation    Testes referentes aos cenários de pagamentos PIX 

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

**Test Cases**
Menu pagamento - Ao acessar menu de pagamentos deve visualizar as opções

Ler código de barras, deve abrir a camera pelo app

Deve conseguir realizar o pagamento da fatura do cartão de crédito

Deve conseguir pagar com PIX