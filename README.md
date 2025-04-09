# Processo Seletivo Simplificado SEPLAG-MT (PSS 02/2025)

**Numero da Inscricao: 7770**
**Nome: Sarylson Marques**
**Email: sarylsonmarques@gmail.com**
**Analista de Sistema Sênior**

### Visão Geral
Este projeto foi desenvolvido como parte do Processo Seletivo Simplificado (PSS 02/2025/SEPLAG-MT). Ele consiste na implementação de uma API REST para gerenciamento de dados de servidores, unidades e lotações, conforme especificado no diagrama de banco de dados fornecido.

A solução utiliza tecnologias modernas para garantir desempenho, escalabilidade e segurança, sendo completamente containerizada para facilitar a implantação e configuração do ambiente.

---

## Tecnologias Utilizadas
- **Genexus 18 U12**
- **Java JDK 17**
- **PostgreSQL (via Docker)**
- **MinIO para armazenamento de objetos**
- **Docker Compose para orquestração**
- **JWT para autenticação segura**
- **API RESTful com suporte a paginação**
- **Endpoints do Postman para analisar e testar APIs**
---

## Arquitetura da API
A API está estruturada em pastas separadas para cada CRUD:
- **Servidor Efetivo**
- **Servidor Temporário**
- **Unidade**
- **Lotação**

## Estrutura do Projeto

O projeto inclui os seguintes arquivos e diretórios principais:

- **Código Fonte**: Armazenado na Knowledge Base (KB) do Genexus.
- **Arquivo WAR**: `SeplagMT.war`
- **Configuração Docker**: `docker-compose.yaml`
- **Scripts SQL (init-db)**: `init.sql` (criação e carga de dados iniciais)
- **Configurações de API**:
  - `api.auth.yaml`
  - `api.servidorefetivo.yaml`
  - `api.servidortemporario.yaml`
  - `api.lotacao.yaml`
  - `api.unidade.yaml`
  - `api.lotacao.yaml`
  - `api.fotopessoa.yaml`
---

## Configuração do Ambiente

Para rodar a aplicação, siga os passos abaixo:

1. Clone o repositório:
   ```sh
   git clone https://github.com/s-marques/seletivo-seplag-mt-genexus.git
   cd seletivo-seplag-mt-genexus
   ```

2. Inicie os containers com Docker Compose:
   ```sh
   docker-compose up -d
   ```

3. O ambiente estará disponível nos seguintes endpoints:
   - **PostgreSQL**: `localhost:5432` (usuário: `postgres`, senha: `123456`)
   - **MinIO Console**: `localhost:9001` (usuário: `minioadmin`, senha: `minioadmin`)
   - **Endpoints para o Postman**: `/Endpoints_Postman`

---

## Estrutura do Banco de Dados

O banco de dados inclui as seguintes tabelas:

- **servidor_efetivo**: Dados de servidores efetivos
- **servidor_temporario**: Dados de servidores temporários
- **unidade**: Unidades organizacionais
- **lotacao**: Relação entre servidores e unidades
- **foto_pessoa**: Metadados e referência a imagens armazenadas no MinIO

---

## Endpoints Principais

### Autenticação
- `POST /login` - Gera um token JWT válido por 5 minutos.
```json
   {
    "login": "admin",
    "Senha": "admin"
   }
```
### CRUDs
- `GET|POST|PUT /servidor` - Operações para servidores.
- `GET|POST|PUT /unidade` - Gerenciamento de unidades.
- `GET|POST|PUT /lotacao` - Gestão de lotações.

### Funcionalidades Especiais
- `GET /servidor/efetivo/unidade/{id}` - Lista servidores de uma unidade.
- `GET /servidor/efetivo/endereco_funcional/{id}` - Lista endereço funcional da unidade onde o servidor efetivo é lotado.

### Teste prático Upload de Fotos
- **Metodo POST Upload a binary for apifotopessoa**

   ```[fotopessoa.yaml POST]``` 
  [ http://localhost:8080/SeplagMT/api/fotos/gxobject](http://localhost:8080/SeplagMT/api/fotos/gxobject)

   POST Upload a binary for apifotopessoa
   ```json
   {
      "object_id": "gxupload:e6adf2383c5f44d792735c3972da1de8"
   }
   ```

- **Metodo POST para fazer upload da foto**
Exemplo: gxupload:e6adf2383c5f44d792735c3972da1de8
   ```json
   {
      "PessoaId": 1,
      "object_id":"gxupload:e6adf2383c5f44d792735c3972da1de8"
   }
   ```
- **Metodo GET para consultar foto da pessoa**
```[apifotopessoa.yaml GET]``` 
   http://localhost:8080/SeplagMT/api/fotos/lista/{PessoaID}

   Será gerado o link para download da imagem armazenada no MinIO.
   - Exemplo:
   ```json
   "FotoLista": [
        {
            "FotoUrl": "http://localhost:9000/bucketfotos/4d05cfefaa8bef6a37202a599a1d9078.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20250409T180747Z&X-Amz-SignedHeaders=host&X-Amz-Credential=Q9puyJNIPII7ZEecmla3%2F20250409%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Expires=300&X-Amz-Signature=e303e3f96c9366394918c012188690fd691df5343f1d73b0a521704b64ea7e3b"
        }
   ] 
```
---

## Como Executar

1. Faça o deploy do WAR no Tomcat ou utilize o servidor embutido do Genexus.
2. Inicie os containers:
   ```sh
   docker-compose up -d
   ```
3. Acesse a API via `http://localhost:8080/SeplagMT/`

---

## Considerações Finais

O projeto foi estruturado para atender aos requisitos estabelecidos pelo PSS 02/2025/SEPLAG-MT. Com autenticação segura via JWT, operações CRUD completas e suporte a paginação, ele está pronto para ser expandido e adaptado conforme necessário.

Além disso, a arquitetura baseada em containers permite fácil configuração e escalabilidade da aplicação.

