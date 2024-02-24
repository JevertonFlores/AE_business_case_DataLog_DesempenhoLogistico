WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_fretes' )}}
),

intermediate AS (
    SELECT DISTINCT
        cliente
        ,SPLIT_PART(cliente, '/', 1) AS cod_cliente
        ,SPLIT_PART(cliente, '/', 2) AS cidade
        ,SPLIT_PART(cliente, '/', 3) AS uf
    FROM source
),

final AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY cod_cliente) AS sk_cliente
        ,TRIM(cod_cliente)::INT AS cod_cliente
        ,TRIM(INITCAP(cidade)) AS cidade
        ,TRIM(UPPER(uf)) AS uf
    FROM intermediate
)

SELECT
    *
FROM final