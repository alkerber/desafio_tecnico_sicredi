/*Metricas comportamentais mensais*/

create or replace table dev.gold.fato_clientes_mes (
    anomes              int           comment 'Ano e mês de referência'       
    ,id_cliente         bigint        comment 'Identificador do cliente'
    ,renda              decimal(19,2) comment 'Renda mensal do associado'
    ,vlr_limite         decimal(19,2) comment 'Limite mensal do associado'
    ,qtd_cartoes_ativos int           comment 'Total cartoes ativos no mes'
    ,qtd_transacoes_mes int           comment 'Quantidade de transações no anomes corrente'
    ,vlr_transacoes_mes decimal(19,2) comment 'Valor das transações do anomes corrente, diminuindo o valor dos estornos'
);
comment on table dev.silver.clientes is 'Informações de clientes'
