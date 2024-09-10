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

