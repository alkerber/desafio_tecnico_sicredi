%sql
create or replace table dev.silver.contas(
    sk_conta              bigint    comment 'Id único da tabela, referente a um único id_conta + data_inicio_vigencia'
    ,id_conta             bigint    comment 'Id único da conta'
    ,id_cliente           bigint    comment 'FK do cliente'
    ,tipo_conta           string    comment 'Tipo da conta: [C]orrente,[S]alário,[P]oupança'
    ,status_conta         string    comment 'Status da conta: [A]tiva, [E]ncerrada, [B]loqueada'
    ,data_abertura        timestamp comment 'Data e hora da abertura da conta'
    ,data_inicio_vigencia timestamp comment 'Data e hora de início da vigência'
    ,data_fim_vigencia    timestamp comment 'Data e hora do fim da vigência. Null caso seja o registro vigente'
    ,vigente              boolean   comment 'Indica se o registro é o registro vigente'
);
comment on table dev.silver.contas is 'Informações de contas'