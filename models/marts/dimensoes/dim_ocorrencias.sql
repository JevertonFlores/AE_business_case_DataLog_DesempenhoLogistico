WITH source AS (
    SELECT
        *
    FROM {{ ref('stg_fretes' )}}
),

intermediate AS (
    SELECT DISTINCT
        devolucao AS motivo
        ,CASE
            WHEN UPPER(devolucao) = 'SEM DEVOLUÇÃO' THEN 'Não'
            ELSE 'Sim'
        END AS devolucao
    FROM source
),

final AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY motivo) AS sk_ocorrencia
        ,devolucao
        ,INITCAP(motivo) AS motivo
    FROM intermediate
)

SELECT
    *
FROM final