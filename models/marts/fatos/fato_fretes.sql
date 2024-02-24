WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_fretes' )}}
),

dim_veiculos AS (
    SELECT
        *
    FROM {{ ref('dim_veiculos') }}
),

dim_clientes AS (
    SELECT
        *
    FROM {{ ref('dim_clientes') }}
),

dim_ocorrencias AS (
    SELECT 
        *
    FROM {{ ref('dim_ocorrencias') }}
),

intermediate AS (
    SELECT
        data_pedido
        ,data_prevista
        ,data_entrega
        ,TRIM(SPLIT_PART(cliente, '/', 1))::INT AS cod_cliente
        ,id_veiculo
        ,nota_fiscal
        ,peso_kg
        ,peso_cubo
        ,vlr_mercadoria
        ,vlr_liquido_frete
        ,devolucao
        ,CASE 
            WHEN TRIM(UPPER(status)) = 'NO PRAZO' THEN 1
            ELSE 0
        END AS ontime
    FROM source
),

final AS (
    SELECT
        v.sk_veiculo
        ,c.sk_cliente
        ,o.sk_ocorrencia
        ,f.data_pedido
        ,f.data_prevista
        ,f.data_entrega
        ,f.nota_fiscal
        ,f.peso_kg
        ,f.peso_cubo
        ,f.vlr_mercadoria
        ,f.vlr_liquido_frete
        ,f.ontime
    FROM intermediate f 
    INNER JOIN dim_veiculos v 
        ON f.id_veiculo = v.cod_veiculo
    INNER JOIN dim_clientes c 
        ON f.cod_cliente = c.cod_cliente
    INNER JOIN dim_ocorrencias o 
        ON f.devolucao = o.motivo
)

SELECT
*
FROM final