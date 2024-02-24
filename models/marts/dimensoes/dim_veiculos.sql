WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_veiculos') }}
),

intermediate AS (
SELECT 
    cod_veiculo
    ,placa
    ,CASE 
        WHEN marca = 'VW' THEN 'Volkswagen'
        ELSE marca 
    END AS marca
    ,CASE 
        WHEN UPPER(tipo_veiculo) = 'CAM' THEN 'CARRETA'
        ELSE tipo_veiculo
    END AS tipo_veiculo
    ,bau
    ,ano_fabricacao
FROM source
),

final AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY cod_veiculo) AS sk_veiculo
        ,cod_veiculo
        ,TRIM(placa) AS placa
        ,TRIM(INITCAP(marca)) AS marca
        ,TRIM(INITCAP(tipo_veiculo)) AS tipo_veiculo
        ,TRIM(INITCAP(bau)) AS bau
        ,ano_fabricacao
    FROM intermediate
)

SELECT 
    *
FROM final