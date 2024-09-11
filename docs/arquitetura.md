# Arquitetura do Projeto (MVC)
Para a criação do Machinex foi utilizado a arquitetura MVC:
- **Model** : Pasta na qual fica os arquivos de armazenamento de dados do 
(Usuário, Equipamento, transações e pagamentos).
- **View** : Pasta no qual fica a interface da aplicação. Telas de Cadastro
de usuário, Cadastro de equipamentos, Listagem de equipamentos cadastrados, Transações efetuadas, anúncios criados e os pagamentos efetuados.
- **Control** : Pasta que realiza o processo de intermediação entre **Model** e **View**, sendo responsável pelo gerenciamento dos dados entre telas e banco de dados.
# fluxo dos Dados
- O usuário interage com as telas **(View)** , como por exemplo 'clicar no botão de salvar cadastro'.
- Durante a interação a classe Usercontroller **(control)** é acionada, e inicia o processo de armazenamento de todos os dados do usuário dentro das variáveis do usuarios **(model)**
- O usuarios **(model)** ela envia e recebe os dados do banco de dados Sqlite.
- O UserController **(controller)** retorna os dados para aela **(view)**
- O UserController **(controller)** retorna os dados para aela **(view)**

<!--Código para por imagens dentro da documentação -->
![Diagrama de caso de Uso](docs/Casodeuso.jpg)

# Banco de dados

'tabela Usuarios'
- **id_usuarios** : identificador unico para o usuário
- **Cpf_ou_cnpj** : identificação do usuário que pode ser pessoa fisica ou jurídica
- **nome_usuarios** : nome do usuário
- **Email** : email do usuario
- **Telefone** : telefone do usuário
- **Endereco** : endereco do usuario
- **Senha** : senha a ser definida pelo usuario
- **Tipo_usuario** : define se o usuário será pessoa física(PF) ou jurídica(PJ)
- **Sexo** : Sexo do usuário podendo ser masculino, feminino ou outro

'Tabela Equipamento'
- **id_equipamento** : identificador único do equipamento.
- **Nome_equipamento** : nome do equipamento cadastrado.
- **Descricao** : descrição detalhada do equipamento.
- **Status_equipamento** : status do equipamento, indicando se está disponível ou não.
- **Intencao** : define se o equipamento está disponível para venda, aluguel ou ambos.
- **Valor_venda** : valor de venda do equipamento (opcional).
- **Valor_aluguel** : valor de aluguel do equipamento (opcional).
- **UsuarioId** : identificador do usuário proprietário do equipamento, referenciado da tabela  Usuarios.

'Tabela Transacao'
- **id_transacao** : identificador único da transação
- **Tipo_transacao** : define o tipo de transação (venda ou aluguel)
- **Data_transacao** : data em que a transação foi realizada
- **Valor_total** : valor total da transação
- **Taxa_plataforma** : valor da taxa cobrada pela plataforma
- **UsuarioIdEquip** : identificador do usuário que realizou a transação, referenciado da tabela Usuarios
- **EquipamentoID** : identificador do equipamento transacionado, referenciado da tabela Equipamento

'Tabela Pagamento'
- **id_pagamento** : identificador único do pagamento.
- **Forma_pagamento** : forma de pagamento escolhida pelo usuário (cartão, boleto, etc.)
- **Valor_pagamento** : valor pago na transação
- **Status_pagamento** : status atual do pagamento (pendente, pago, etc.)
- **Data_pag** : data em que o pagamento foi efetuado
- **transacaoId** : identificador da transação associada ao pagamento, referenciado da tabela Transacao

'Tabela Avaliacao'
- **id_avaliacao** : identificador único da avaliação.
- **Nota** : nota dada pelo usuário na avaliação (1 a 5).
- **Data_ava** : data em que a avaliação foi feita.
- **Comentario** : comentário deixado pelo usuário junto à nota.
- **IdUsuarioAva** : identificador do usuário que fez a avaliação, referenciado da tabela Usuarios.

'Tabela Anuncio'
- **id_anuncio** : identificador único do anúncio.
- **Data_da_Criacao** : data de criação do anúncio.
- **Situacao** : situação atual do anúncio (ativo, inativo).
- **Tipo_anuncio** : tipo do anúncio (venda, aluguel ou ambos).
- **IdUsuarioAnu** : identificador do usuário que criou o anúncio, referenciado da tabela Usuarios.
- **IdEquip** : identificador do equipamento anunciado, referenciado da tabela Equipamento.