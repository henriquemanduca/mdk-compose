# Repositório de Docker Composes

Este repositório contém uma coleção de configurações Docker Compose, cada uma projetada para implantar um serviço específico. O objetivo é fornecer ambientes isolados e facilmente configuráveis para diferentes aplicações e ferramentas.

## Serviços Disponíveis

### Planka

*   **Descrição**: Planka é uma plataforma de gerenciamento de projetos de código aberto, inspirada no Trello. Ele oferece quadros Kanban para organizar tarefas, colaborar em projetos e acompanhar o progresso.
*   **Tecnologias**: Node.js, PostgreSQL (como backend de banco de dados).
*   **Porta Exposta**: `3000` (mapeada para a porta `1337` do contêiner).
*   **Dependências**: Requer um serviço PostgreSQL para armazenamento de dados.

### PostgreSQL

*   **Descrição**: Um poderoso sistema de gerenciamento de banco de dados relacional de código aberto. É conhecido por sua robustez, confiabilidade e desempenho.
*   **Tecnologias**: PostgreSQL.
*   **Porta Exposta**: `5432`.
*   **Variáveis de Ambiente**: `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB` (definidas via arquivo `.env.sample`).

### Redis

*   **Descrição**: Um armazenamento de estrutura de dados em memória de código aberto, usado como banco de dados, cache e intermediário de mensagens. Oferece alta performance e flexibilidade.
*   **Tecnologias**: Redis.
*   **Porta Exposta**: `6379`.
*   **Variáveis de Ambiente**: `REDIS_PASSWORD` (definida via arquivo `.env.sample`).

### RedisInsight

*   **Descrição**: RedisInsight é uma ferramenta gráfica de código aberto para visualizar, analisar e otimizar dados Redis. Ele fornece uma interface de usuário intuitiva para interagir com suas instâncias Redis.
*   **Tecnologias**: RedisInsight.
*   **Porta Exposta**: `5540`.
*   **Dependências**: Requer um serviço Redis em execução para se conectar.
