create or replace table dev.silver.cartoes (
    sk_cartao             bigint        comment 'Id único da tabela, referente a um único id_cartao + data_inicio_vigencia'
    ,id_cartao            bigint        comment 'Identificador único do cartão'
    ,id_conta             bigint        comment 'FK tabela contas'
    ,tipo_cartao          string        comment 'Tipo do cartão: [D]ébito, [C]rédito'
    ,limite               decimal(19,2) comment 'Valor do limite total do cartão'
    ,status_cartao        string        comment 'Status atual do cartão: [A]tivo, [B]loqueado, [C]ancelado'
    ,data_inicio_vigencia timestamp     comment 'Data e hora de início da vigência'
    ,data_fim_vigencia    timestamp     comment 'Data e hora do fim da vigência. Null caso seja o registro vigente'
    ,vigente              boolean       comment 'Indica se o registro é o registro vigente'
);
comment on table dev.silver.cartoes is 'Informações de cartões'