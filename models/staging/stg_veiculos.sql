WITH source AS (
    SELECT
        *
    FROM {{ source('raw', 'cadastro_veiculos')}}
)

SELECT
	cod_veiculo
	,placa
	,marca
	,tipo_veiculo
	,bau
	,ano_fabricacao
FROM source