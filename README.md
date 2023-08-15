# GitHub Profile Viewer - Flutter Project

O **GitHub Profile Viewer** é um aplicativo Flutter que permite aos usuários visualizar perfis do GitHub, incluindo informações do usuário, repositórios próprios e repositórios marcados como favoritos. Com este aplicativo, você pode facilmente pesquisar e explorar os detalhes do GitHub de qualquer usuário.

## Pré-requisitos

Certifique-se de ter o ambiente de desenvolvimento Flutter configurado em sua máquina. Se você ainda não configurou o ambiente Flutter, siga as instruções em [flutter.dev](https://flutter.dev/docs/get-started/install) para instalar o Flutter e suas dependências.

## Como Executar o Projeto

1. **Clone o repositório:**

   Abra seu terminal e navegue até o diretório onde você deseja clonar o repositório. Em seguida, execute o seguinte comando:

   ```bash
   git clone https://github.com/SEU_USUARIO/github-profile-viewer.git

2. **Acesse o diretório do projeto:**

   Entre no diretório do projeto usando o comando:
   ```bash
   cd github-profile-viewer

## Modificar o Nome de Usuário:

   Abra o arquivo lib/main.dart e localize a função searchUser() no código. Modifique a variável username para o nome de usuário do GitHub que você deseja visualizar:
   
   ```bash
   final username = 'NOME_DO_USUARIO';
   ```

   1. **Instale as Dependências:**
   Execute o seguinte comando para instalar as dependências do projeto:
   ```bash
   flutter pub get
   ```
2. **Inicie o Aplicativo:**

   Agora você pode iniciar o aplicativo Flutter executando o seguinte comando:
   ```bash
   flutter run
   ```
   O aplicativo será compilado e lançado em um emulador ou dispositivo conectado.
