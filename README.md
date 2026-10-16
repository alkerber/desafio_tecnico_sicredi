## Arquitetura Lakehouse Cooperativa NovaRota
Desafio Técnico Sicredi

---
#### 1) Instruções de Execução

- Criar um catálogo para o ambiente dev e outro para produção. 
- Criar os schemas das 3 camadas: bronze,silver,gold
- Criar os respectivos diretórios nos Volumes
- /scr/ingestion: Contém os pipelines a executar. Criar um job para encadeamento e execução.

---

#### 2) Arquitetura


A solução utiliza a arquitetura Lakehouse Medallion no Databricks, com Delta Lake para armazenamento e processamento dos dados.

- **Ingestão**: arquivos CSV armazenados em Unity Catalog Volumes, ingeridos incrementalmente com Auto Loader, através de pipelines.
- **Bronze**: armazenamento dos dados recebidos, com metadados de rastreabilidade e auditoria.
- **Silver**: tratamento, validação e aplicação de CDC para manutenção do histórico por meio de SCD Tipo 2, utilizando Lakeflow AUTO CDC.
- **Quarentena**: separação de registros inválidos para análise e correção.

- **Gold**: disponibilização de dados consolidados para análise de comportamento transacional, prevenção de perdas e suporte a modelos de Data Science. (em progresso)

-**Orquestração**: execução dos processos por meio de Pipeline, com dependências entre as etapas.
- **Governança**: organização e controle de acesso aos dados por meio do Unity Catalog.
- **Tecnologias**: Databricks Free Edition, Apache Spark, PySpark, Delta Lake, Unity Catalog, Auto Loader, Auto CDC e Lakeflow.

---

#### 3) Premissas

- Os dados de origem são disponibilizados em arquivos CSV contendo eventos CDC (Change Data Capture).
- Os eventos possuem chave de negócio, tipo de operação (INSERT, UPDATE ou DELETE) e sequência confiável para ordenação.
- Os arquivos são disponibilizados continuamente, e a ingestão deve processar novos arquivos de forma incremental.
- Alterações sucessivas de uma mesma entidade devem ser processadas respeitando a ordem dos eventos e preservando o histórico.
- Registros inválidos devem ser identificados e direcionados para quarentena.
- A camada Silver deve manter o histórico das alterações por meio de SCD Tipo 2.
- A implementação é destinada a uma avaliação técnica na Databricks Free Edition, respeitando as limitações dos recursos disponíveis.

---

#### 4) Limitações

- Por utilizar o Databricks na versão Free e pela limitação de tempo, tive que abrir mão de alguns recursos.
- Na versão Free não é possível criar mais de um workspace. Eu criaria workspaces separados para desenvolvimento e produção.
- Eu entenderia melhor também com a área de risco (ou mesmo consultando os arquivos origem sobre a estrutura e possíveis valores das colunas da tabela de eventos de risco)
- Devido a limitação de tempo, não foi possível implementar testes unitários automatizados, alertas, parametrizações para publicação em prd, controle de acesso, validações extras. Também não foi possível fazer as análises das tabelas da camada gold.

---

#### 5) Próximos passos

- Elaborar validações e tratamentos adicionais
- Adicionar logs
- Implementar a parametrização para publicar o código em PRD
- Criar testes unitários e alertas
- Adicionar particionamento
- Segregação de acessos
- Incluir ao menos uma análise de plano de execução ou comentário sobre estratégia de joins.
- Finalizar a camada gold.

---

#### 6) Decisões

- Optei por trabalhar com Auto Loader porque ele gerencia automaticamente a carga de arquivos, gravando os checkpoints para evitar que o mesmo arquivo seja reprocessado mais de uma vez. Também gerencia automaticamente as mudanças de schema.
- Para as tabelas silver optei pelo Auto CDC, que implementa automaticamente o gerenciamento dos checkpoints, garante a remoção de duplicados e trata registros recebidos fora de ordem. Utiliza a origem CDC para alimentar uma silver SCD tipo 2.
- Os cenários obrigatórios do item 9 já são tratados pelo Auto Loader e Auto CDC
- Foram criados dois catálogos separados para produção e desenvolvimento. Os schemas foram divididos com base nas camadas da arquitetura medalhão.

---

#### 7) Questões - Performance, Operação e governança (item 8 do desafio)

- Explicar estratégia de particionamento, clustering, OPTIMIZE, ZORDER ou Liquid Clustering quando
aplicável.
Particionamento: use para tabelas grandes com filtros frequentes por colunas de baixa cardinalidade, como data. Evite particionar por IDs.
Clustering: organiza fisicamente os dados para acelerar consultas que filtram ou fazem buscas por determinadas colunas.
OPTIMIZE: compacta arquivos pequenos e melhora a organização física da tabela Delta.
ZORDER: reorganiza dados por colunas específicas para melhorar a leitura seletiva. Útil em tabelas particionadas; não é a estratégia preferida para novas tabelas com Liquid Clustering.
Liquid Clustering: alternativa moderna que organiza dados dinamicamente pelas colunas definidas com CLUSTER BY, facilitando mudanças e evitando as limitações do particionamento tradicional.
Recomendação: comece com Liquid Clustering para tabelas Delta grandes e de consultas variadas. Use OPTIMIZE conforme necessário e escolha as colunas com base nos filtros reais das consultas.

- Explicar como evitar arquivos pequenos e como lidar com crescimento de volume.  
Evitar partições com alta cardinalidade e o excesso de partições. Utilizar Liquid Clustering ou particionamento da tabela por uma chave adequada definida, aplicando o optimize quando necessário.

- Explicar como monitoraria falhas, volumetria e qualidade de dados.
Utilizar Databricks Workflows, alertas e logs de execução.

- Explicar como organizaria catálogos, schemas e permissões em Unity Catalog.
Criaria catálogos separados para os ambientes de produção e de teste. Ajustar as permissões para que não seja possível escrever no ambiente de produção a partir do ambiente de desenvolvimento.


---


