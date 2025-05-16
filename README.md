Criação de Instância Gerenciada de Banco de Dados SQL no Azure com Terraform
Descrição
Este projeto tem como objetivo criar uma instância gerenciada de banco de dados SQL no Microsoft Azure utilizando Terraform, aplicando os conceitos aprendidos no curso XP Inc. - Cloud com Inteligência Artificial.

Objetivos
Configurar o provider AzureRM com credenciais seguras.

Criar um resource group para organizar os recursos.

Provisionar uma instância gerenciada de banco de dados SQL.

Documentar todo o processo para facilitar estudos e futuras implementações.

Pré-requisitos
Conta no Azure com permissões adequadas (pevaristo@msn.com).

Terraform instalado na máquina local ou VM.

Arquivos de credenciais (pevaristo_client-id.txt, etc.) configurados corretamente.

Como usar
Clone este repositório.

Configure os arquivos de credenciais na raiz do projeto.

Execute os comandos Terraform:

bash
terraform init
terraform plan
terraform apply
Verifique no portal Azure a instância criada.

Considerações finais
Este projeto serve como base para a criação e gerenciamento de recursos de banco de dados no Azure utilizando infraestrutura como código, promovendo automação e reprodutibilidade.

Referências
Documentação oficial do Terraform AzureRM

Criar Instância Gerenciada de SQL do Azure
