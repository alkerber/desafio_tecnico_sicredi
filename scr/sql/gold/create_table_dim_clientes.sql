create or replace table dev.gold.dim_clientes (
    id_cliente            bigint        comment 'Identificador do cliente'
    ,documento            string        comment 'Código alfanumérico do documento do cliente, CPF ou CNPJ'
    ,nome                 string        comment 'Nome do cliente'
    ,cidade               string        comment 'Cidade'
    ,estado               string        comment 'Estado'
    ,renda                decimal(19,2) comment 'Renda mensal do associado'
    ,segmento             string        comment 'Segmento do associado: PF, PJ ou AGRO'
);
comment on table dev.gold.clientes is 'Informações de clientes'