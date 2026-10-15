create or replace table dev.silver.transacoes(
    id_transacao     bigint        comment 'Identificador único da transação'
    ,id_cartao       bigint        comment 'FK cartoes'
    ,data_transacao  timestamp     comment 'Data e hora da transação'
    ,valor           decimal(19,2) comment 'Valor da transação'
    ,mcc             string        comment 'Merchant Category Code. Indica a categoria comercial do estabelecimento'
    ,estabelecimento string        comment 'Nome do estabelecimento'
    ,canal           string        comment 'Canal da transação: POS, ECOMMERCE,CONTACTLESS, ATM, WALLET...'
    ,pais            string        comment 'País da transação'
    ,moeda           string        comment 'Moeda da transação. Ex: BRL, USD, EUR'
);
comment on table dev.silver.transacoes is 'Informações de transações nos cartões'