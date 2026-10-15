create or replace table dev.bronze.estornos (
    id_estorno          string comment 'Identificador único do estorno'
    ,id_transacao       string comment 'FK da tabela de transacoes'
    ,data_estorno       string comment 'Data do estorno'
    ,motivo             string comment 'Motivo do estorno'
    ,arquivo_origem     string comment 'Arquivo origem importado'
    ,data_ingestao      date   comment 'Data da carga do arquivo'
    ,timestamp_ingestao timestamp comment 'Timestamp da carga do arquivo'
    ,batch_id           string comment 'Identificador único do batch'  
    ,hash_linha         string comment 'hash sha 256 da linha carregada'
);
comment on table dev.bronze.estornos is 'Informações de estornos'