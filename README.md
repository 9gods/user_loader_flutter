Claro! Aqui está o README completo formatado em Markdown para o seu projeto Flutter:
# User Loader Flutter

Um aplicativo Flutter que permite ao usuário inserir um ID (entre 1 e 12) e buscar os dados de um usuário utilizando a API pública [ReqRes](https://reqres.in). O projeto segue conceitos de Domain-Driven Design (DDD), utiliza widgets personalizados e ícones da biblioteca [Lucide Icons](https://pub.dev/packages/lucide_icons) para criar uma experiência visual moderna e agradável.

---

## Funcionalidades

- **Busca de Usuário por ID**
  - O usuário digita um ID entre 1 e 12 e busca informações da API ReqRes.
  - Exibe o nome completo, e-mail e avatar do usuário encontrado.

- **Validação de Entradas e Erros**
  - Verifica se o ID informado é válido antes de fazer a requisição.
  - Mostra um diálogo de erro personalizado caso a entrada seja inválida ou o usuário não exista.

- **Interface Customizada**
  - Widgets personalizados (`CustomCard` e `ErrorDialog`) reutilizáveis.
  - Interface visual seguindo cores definidas em `AppColors`.
  - Uso dos ícones da biblioteca Lucide Icons.

- **Arquitetura baseada em DDD**
  - Estrutura clara de pastas e separação por domínio.
  - Serviços e entidades isoladas para melhorar a manutenção e os testes.

---

## Tech Stack

- [Flutter](https://flutter.dev/) - Framework multiplataforma.
- [Dart](https://dart.dev/) - Linguagem de programação.
- [Lucide Icons](https://pub.dev/packages/lucide_icons) - Lucide icons para Flutter.
- [HTTP](https://pub.dev/packages/http) - Pacote para reqs HTTP.
- [ReqRes API](https://reqres.in) - API usada no projeto.

---

## Estrutura do Projeto

```plaintext
lib/
├── domain/
│   ├── entities/
│   │   └── user.dart                 # Entidade representando o usuário
│   └── services/
│       └── fetch_user_service.dart   # Serviço responsável pela busca do usuário
├── screens/
│   └── user_search_screen.dart       # Tela principal de busca de usuário
├── widgets/
│   ├── app_colors.dart               # Cores utilizadas na aplicação
│   ├── custom_card.dart              # Widget personalizado para cards
│   └── error_dialog.dart             # Widget personalizado para diálogos de erro
└── main.dart                         # Arquivo principal (entry point)
```

---

## Começando

Siga os passos abaixo para executar o projeto localmente.

### Instalação

**1. Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/user_loader_flutter.git
cd user_loader_flutter
```

**2. Instale as dependências:**

```bash
flutter pub get
```

**3. Execute o aplicativo:**

```bash
flutter run
```

---

## Uso do App

- Abra o app no dispositivo ou emulador.
- Digite um ID válido (de 1 a 12) na caixa de texto.
- Pressione o botão **"Buscar"**.
- Aguarde o carregamento das informações do usuário.

**Casos de erro:**

- Caso o ID informado não seja válido, será exibido um diálogo personalizado de erro.
- Caso o usuário não exista, o mesmo diálogo também será exibido com uma mensagem apropriada.

---

## Personalização

Você pode personalizar facilmente o app editando os seguintes arquivos:

- **Cores e Estilos:**  
  - Modifique o arquivo [`lib/widgets/app_colors.dart`](lib/widgets/app_colors.dart).

- **Componentes Personalizados:**  
  - Ajuste os widgets em [`lib/widgets`](lib/widgets) para mudar estilos e layouts.

---

## Arquitetura (DDD)

Este projeto segue os princípios do Domain-Driven Design (DDD):

- **Domínio (`domain/`)**:  
  - Responsável pelas entidades centrais (ex.: usuário) e pela lógica de negócio.

- **Serviços (`services/`)**:  
  - Serviços que implementam ações específicas e isoladas, como busca e tratamento de usuários pela API.

- **Camada de Apresentação (`screens/`, `widgets/`)**:  
  - Responsável pela interface e pela experiência do usuário, usando serviços definidos na camada de domínio.

---
