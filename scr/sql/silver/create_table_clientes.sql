create or replace table dev.silver.clientes (
    id_cliente            bigint        comment 'Identificador do cliente'
    ,documento            string        comment 'Código alfanumérico do documento do cliente, CPF ou CNPJ'
    ,nome                 string        comment 'Nome do cliente'
    ,cidade               string        comment 'Cidade'
    ,estado               string        comment 'Estado'
    ,renda                decimal(19,2) comment 'Renda mensal do associado'
    ,segmento             string        comment 'Segmento do associado: PF, PJ ou AGRO'
    ,data_inicio_vigencia timestamp     comment 'Data e hora de início da vigência'
    ,data_fim_vigencia    timestamp     comment 'Data e hora do fim da vigência. Null caso seja o registro vigente'
    ,vigente              boolean       comment 'Indica se o registro é o registro vigente'
);
comment on table dev.silver.clientes is 'Informações de clientes'