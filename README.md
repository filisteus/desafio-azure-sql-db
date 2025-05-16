# Desafio: Criação de Instância Gerenciada de Banco de Dados SQL no Azure com Terraform

## Objetivo do Desafio

Este projeto faz parte do desafio do curso **XP Inc. - Cloud com Inteligência Artificial** na plataforma DIO. O objetivo é praticar o processo de criação e configuração de uma instância gerenciada de banco de dados SQL no Microsoft Azure utilizando Terraform, aplicando os conceitos aprendidos nas aulas.

Além disso, o projeto visa desenvolver a habilidade de documentar processos técnicos de forma clara e estruturada, além de utilizar o GitHub como ferramenta para compartilhamento de conhecimento.

---

## Estrutura do Projeto

├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── pevaristo_client-id.txt
├── pevaristo_client-secret.txt
├── pevaristo_subscription-id.txt
├── pevaristo_tenant-id.txt
└── images/
└── (capturas de tela opcionais)

text

- **main.tf**: Contém a definição principal dos recursos Terraform para criar a infraestrutura no Azure.
- **variables.tf**: Arquivo opcional para definir variáveis reutilizáveis no Terraform.
- **outputs.tf**: Arquivo opcional para definir saídas do Terraform após a criação dos recursos.
- **pevaristo_client-id.txt, pevaristo_client-secret.txt, pevaristo_subscription-id.txt, pevaristo_tenant-id.txt**: Arquivos que armazenam as credenciais da conta Azure usadas para autenticação no provider Terraform. **Esses arquivos não devem ser compartilhados publicamente.**
- **images/**: Pasta opcional para armazenar capturas de tela relevantes do processo.

---

## Como Utilizar

1. Certifique-se de que os arquivos de credenciais (`pevaristo_client-id.txt`, etc.) estejam presentes na raiz do projeto.
2. Verifique e ajuste, se necessário, os valores das variáveis no arquivo `variables.tf`.
3. Inicialize o Terraform:

terraform init

text

4. Visualize o plano de execução para verificar as alterações que serão aplicadas:

terraform plan

text

5. Aplique a infraestrutura no Azure:

terraform apply

text

6. Após a conclusão, você pode verificar os recursos criados no portal do Azure.

---

## Considerações Importantes

- **Segurança:** Nunca compartilhe os arquivos de credenciais publicamente. Utilize `.gitignore` para garantir que esses arquivos não sejam enviados ao GitHub.
- **Senhas:** Utilize senhas fortes para o administrador da instância SQL.
- **Rede:** A subnet utilizada deve ser delegada para a instância gerenciada de SQL no Azure.
- **Documentação:** Utilize este repositório para registrar dúvidas, aprendizados e melhorias futuras.

---

## Referências

- [Documentação oficial do Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Criar Instância Gerenciada de SQL do Azure](https://learn.microsoft.com/pt-br/azure/azure-sql/managed-instance/overview)
- [GitHub Markdown Guide](https://guides.github.com/features/mastering-markdown/)

---

## Autor

Projeto desenvolvido por Paulo Evaristo Ferreira da Silva como parte do desafio do curso XP Inc. - Cloud com Inteligência Artificial na DIO.
