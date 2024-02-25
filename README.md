# Business Case - Logística - Desempenho Logístico

### Objetivo:
Em busca de identificar oportunidades de melhorias em suas operações, a empresa DataLog decidiu pela contratação de uma consultoria para implementação de um processo de coleta e armazenamento de dados e a contrução de um Dashboard para acompanhamento de suas entregas. 

Além de poder identificar gaps em sua operação, o desenvolvimento e automação do relatório vai fazer com que o time de backoffice da empresa economize o tempo que era gasto na coleta, tratamento e preparação dos dados para geração dos relatórios manuais, com isso, o foco dos analistas será em realmente analisar os dados e encontrar possibilidades de melhorias do desempenho de entregas da companhia.

### Requisitos:
O Dashboard entregue deverá possuir uma única tela resumindo os indicadores que possibilitem obter as respostas para as perguntas listadas abaixo.

1. Qual a receita bruta total da empresa?
2. Qual a receita bruta por ano e mês?
3. Em relação ao ano anterior, a receita aumentou ou diminuiu?
4. Qual é a quantidade de entregas realizadas?
5. Em relação ao ano anterior, as entregas aumentaram ou diminuiram?
6. De todas as entregas realizadas, qual o % que foram entregues fora do prazo acordado?
7. De todas as entregas realizadas, quantas tiveram devolução e por quais motivos?
8. Qual a quantidade de entregas e o ticket médio por tipo de veículo?
9. Quais tipos de veículos geram mais atrasos e devoluções na operação?
10. Em clientes de quais Estados e Cidades estamos tendo mais casos de devolução?

### Informações adicionais:
● **Receita Bruta** = soma dos valores totais de frete.

● **Entregas atrasadas** = quantidade de entregas em que a data da entrega é maior do que a data prevista.

● **Ticket Médio** = receita bruta dividida pela quantidade total de entregas.

● **Devoluções** = entregas que geraram algum tipo de ocorrência.

### Base de Dados:
A empresa disponibilizou a base de dados de 2019, 2020 e 2021 com datas, quantidades de entregas e valores, além de uma tabela de cadastro da frota de veículos. As tabelas disponibilizadas foram:

**Cadastro de Veículos**: tabela com o cadastro da frota de veículos da empresa. Essa tabela contém informações do tipo do veículo, baú, marca, placa entre outras informações.

**Fretes**: tabela com a data do pedido, número da nota fiscal, data prevista de entrega, data de entrega, informações de clientes, ocorrências, volumes e valores.

### Solução proposta:
Para atender as necessidades de maneira eficaz e com um baixo custo tecnológico, serão utilizadas as seguintes ferramentas:
- dbt Core: para o processo de transformação e carga dos dados;
- PostgreSQL: para armazenamento dos dados tratados;
- Power BI: para criação do Dashboard e análise dos dados.

### Modelo de Dados:
![image](https://github.com/JevertonFlores/AE_business_case_DataLog_DesempenhoLogistico/assets/36814309/8508b122-bebd-49fa-ae3c-13c6a6955dea)

### Tratamento e modelagem dos dados com dbt Core:
<a href="https://github.com/JevertonFlores/AE_business_case_DataLog_DesempenhoLogistico/tree/main/models">- Models dbt Core;</a>

### Lineage:
![image](https://github.com/JevertonFlores/AE_business_case_DataLog_DesempenhoLogistico/assets/36814309/bc31220f-f264-45af-a9a9-4ef257e96904)

### Datamart armazenado no PostgreSQL:
![image](https://github.com/JevertonFlores/AE_business_case_DataLog_DesempenhoLogistico/assets/36814309/7495a466-a33b-4df8-a261-4949558c5d5d)

### Dashboard:
O dashboard pode ser acessado pelo link --> 
<a href="https://app.powerbi.com/view?r=eyJrIjoiOWZmNDU5MjAtZTQ2ZC00NDFiLWJhYWMtYmU5MDdhMjU4MWFmIiwidCI6ImRlYzg2NmVlLWFkZjAtNGIxZC1hMWJhLTdhODZjODY0OTRiZCJ9">- DataLog - Desempenho Logístico

### Tela do dashboard:

![image](https://github.com/JevertonFlores/AE_business_case_DataLog_DesempenhoLogistico/assets/36814309/220d6539-c362-4afe-9869-09940948b891)



