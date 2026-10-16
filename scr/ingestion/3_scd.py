from pyspark import pipelines as dp
from pyspark.sql import functions as F

# Lakeflow AUTO CDC

dp.create_streaming_table(
    name="dev.silver.clientes",
    comment="Histórico SCD Tipo 2 de clientes"
)
dp.create_auto_cdc_flow(
    target="dev.silver.clientes",
    source="dev.silver.clientes_validos",
    keys=["id_cliente"],
    sequence_by=F.col("data_atualizacao"),
    apply_as_deletes=F.expr("operacao = 'D'"),
    except_column_list=["operacao", "timestamp_ingestao"],
    stored_as_scd_type=2
)

dp.create_streaming_table(
    name="dev.silver.contas",
    comment="Histórico SCD Tipo 2 de contas"
)
dp.create_auto_cdc_flow(
    target="dev.silver.contas",
    source="dev.silver.contas_validas",
    keys=["id_conta"],
    sequence_by=F.col("data_atualizacao"),
    apply_as_deletes=F.expr("operacao = 'D'"),
    except_column_list=["operacao", "timestamp_ingestao"],
    stored_as_scd_type=2
)

dp.create_streaming_table(
    name="dev.silver.cartoes",
    comment="Histórico SCD Tipo 2 de cartoes"
)
dp.create_auto_cdc_flow(
    target="dev.silver.cartoes",
    source="dev.silver.cartoes_validos",
    keys=["id_cartao"],
    sequence_by=F.col("data_atualizacao"),
    apply_as_deletes=F.expr("operacao = 'D'"),
    except_column_list=["operacao", "timestamp_ingestao"],
    stored_as_scd_type=2
)
