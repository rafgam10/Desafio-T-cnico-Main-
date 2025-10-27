# Catálogo de Filmes - Rails

## Descrição
Aplicação Rails para cadastro, visualização e comentários de filmes, com autenticação de usuários via Devise.

## Funcionalidades implementadas
- Área pública:
  - Listagem de filmes ordenados do mais novo para o mais antigo.
  - Paginação de até 6 filmes por página.
  - Visualização de detalhes do filme.
  - Comentários anônimos e de usuários autenticados.
- Área autenticada:
  - Cadastro, edição e exclusão de filmes (restrito ao usuário criador).
  - Edição de perfil e alteração de senha.
  - Logout seguro.

## Rodando localmente

### Pré-requisitos
- Ruby 3.3.x
- Rails 7.x
- PostgreSQL ou SQLite
- Node.js + Yarn (para assets)

### Passos
```bash
git clone https://github.com/seu-usuario/catalogo_filmes.git
cd catalogo_filmes
bundle install
rails db:create db:migrate
rails server
