create or replace table dev.silver.eventos_risco(
    id_evento     bigint    comment 'Identificador único do evento de risco'
    ,id_transacao bigint    comment 'FK da tabela de transacoes'
    ,tipo_evento  string    comment 'Tipo do evento de risco'
    ,severidade   string    comment 'Severidade do evento de risco'
    ,data_evento  timestamp comment 'Data e horário do evento de risco'
);
comment on table dev.silver.eventos_risco is 'Informações de eventos de risco'