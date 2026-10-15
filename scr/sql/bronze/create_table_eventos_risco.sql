create or replace table dev.bronze.eventos_risco(
    id_evento           string comment 'Identificador único do evento de risco'
    ,id_transacao       string comment 'FK da tabela de transacoes'
    ,tipo_evento        string comment ''
    ,severidade         string comment ''
    ,data_evento        string comment 'Data e horário do evento de risco'
    ,arquivo_origem     string comment 'Arquivo origem importado'
    ,data_ingestao      date   comment 'Data da carga do arquivo'
    ,timestamp_ingestao timestamp comment 'Timestamp da carga do arquivo'
    ,batch_id           string comment 'Identificador único do batch'  
    ,hash_linha         string comment 'hash sha 256 da linha carregada'
);
comment on table dev.bronze.eventos_risco is 'Informações de eventos de risco'
