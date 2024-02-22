WITH source AS (
    SELECT
        *
    FROM {{ source('raw', 'fretes')}}
)

SELECT
	data_pedido
	,data_prevista
	,data_entrega
    --,SPLIT_PART(cliente, '/', 1) AS id_cliente
	,cliente
	,id_veiculo
	,nota_fiscal
	,peso_kg
	,peso_cubo
	,vlr_mercadoria
	,vlr_liquido_frete
	,devolucao
	,status
FROM source