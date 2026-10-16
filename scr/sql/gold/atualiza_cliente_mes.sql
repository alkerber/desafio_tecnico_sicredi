/*Em progresso*/

truncate table dev.gold.fato_clientes_mes;

insert into dev.gold.fato_clientes_mes 

(
    anomes     
    ,id_cliente
    ,renda
    ,vlr_limite
    ,qtd_cartoes_ativos
    ,qtd_transacoes_mes
    ,vlr_transacoes_mes
)

with transacoes_sem_estorno(
    select cc.id_cliente,sum(t.valor) as vlr_transacoes_mes
    from dev.silver.transacoes_validas t
    inner join dev.silver.cartoes ca on ca.id_cartao = t.id_cartao
    inner join dev.silver.contas cc on cc.id_conta = ca.id_conta
    left join dev.silver.estornos e
        on e.id_transacao = t.id_transacao
    where 
        e.id_transacao is null 
        and CAST(date_format(t.data_transacao, 'yyyyMM') AS INT) = CAST(date_format(current_date(), 'yyyyMM') AS INT)
    group by cc.id_cliente
)

select 
    CAST(date_format(current_date(), 'yyyyMM') AS INT) as anomes     
    ,c.id_cliente
    ,c.renda
    --,vlr_limite
    --,qtd_cartoes_ativos
    --,qtd_transacoes_mes
    ,t.vlr_transacoes_mes
from dev.silver.clientes c
left join transacoes_sem_estorno t
    on t.id_cliente = c.id_cliente
where c.__END_AT is null