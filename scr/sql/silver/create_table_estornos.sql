create or replace table dev.silver.estornos (
    id_estorno    bigint    comment 'Identificador único do estorno. PK'
    ,id_transacao bigint    comment 'FK da tabela de transacoes'
    ,data_estorno timestamp comment 'Data e hora em que ocorreu o estorno'
    ,motivo       string    comment 'Motivo do estorno'
);
comment on table dev.silver.estornos is 'Informações de estornos'

