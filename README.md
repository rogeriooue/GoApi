# GoApi

 Api em Go (Golang) + PostgreSQL + Docker.

## Descrição

Esta API fornece operações para gerenciar produtos em um banco de dados. As operações incluem listar todos os produtos, criar um novo produto e buscar um produto pelo ID.

---

## Endpoints

### 1. **Listar Produtos**

- Retorna uma lista de todos os produtos cadastrados no banco de dados.

- Método: `GET`.
- Rota: `/products`.
- Resposta de Sucesso:
  - Código HTTP: `200 OK`.
  - Corpo:

```json
    [
      {
        "id": 1,
        "name": "Produto A",
        "price": 100.50
      },
      {
        "id": 2,
        "name": "Produto B",
        "price": 200.00
      }
    ]
```

- Resposta de Erro:
  - Código HTTP: `500 Internal Server Error`
    - Mensagem: Ocorreu um erro ao buscar os produtos.

### 2. **Criar Produto**

- Cria um novo produto no banco de dados.

- Método: `POST`.
- Rota: `/products`.
- Corpo da Requisição:

```json
{
    "name": "Produto C",
    "price": 150.75
}
```

- Resposta de Sucesso:
  - Código HTTP: 201 Created.
  - Corpo:

```json
{
    "id": 3
}
```

- Resposta de Erro:
  - Código HTTP: 400 Bad Request.
    - Mensagem: Dados inválidos enviados na requisição.
  - Código HTTP: 500 Internal Server Error.
    - Mensagem: Ocorreu um erro ao criar o produto.

### 3. Buscar Produto por ID

- Retorna os detalhes de um produto específico com base no ID fornecido.

- Método: GET.
- Rota: /products/{id}.
- Parâmetros:
  - id (int): ID do produto a ser buscado.

- Resposta de Sucesso:
  - Código HTTP: 200 OK.
  - Corpo:

```json
{
  "id": 1,
  "name": "Produto A",
  "price": 100.50
}
```

- Resposta de Erro:
  - Código HTTP: 404 Not Found
    - Mensagem: Produto não encontrado.
  - Código HTTP: 500 Internal Server Error
    - Mensagem: Ocorreu um erro ao buscar o produto.

---

## Estrutura do Banco de Dados

### Tabela: product

| Coluna       | Tipo                | Descrição                     |
|--------------|---------------------|-------------------------------|
| id           | integer             | Identificador único do item. |
| name         | character varying   | Nome do item.                 |
| price        | numeric(10,2)       | Preço do item.                |

### Tratamento de Erros

- ***sql.ErrNoRows***: Retorna 404 Not Found quando o produto não é encontrado.
- ***Outros erros***: Retorna 500 Internal Server Error para erros inesperados.

---

## Dependências

- Banco de Dados: PostgreSQL.

### Bibliotecas

- database/sql: Para conexão e manipulação do banco de dados.
- github.com/lib/pq: Driver PostgreSQL para Go.
