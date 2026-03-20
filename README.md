# 📊 Análise de Vendas — Produtos Gamer

Este projeto contém consultas SQL desenvolvidas a partir de uma base de dados fictícia de vendas de produtos do segmento gamer. O objetivo principal é extrair insights relevantes sobre o comportamento dos clientes e o desempenho das vendas.

---

## 🎯 Objetivo

Realizar análises que ajudem a entender:

* Quanto cada cliente gera de receita ao longo do tempo
* Quem são os clientes mais valiosos
* Frequência de compra na plataforma

Essas métricas são fundamentais para estratégias de retenção, marketing e crescimento de receita.

---

## 🗂️ Base de Dados

A base utilizada (`vendas_dio`) contém informações como:

* Nome do cliente
* Preço do produto
* Desconto aplicado
* Transações realizadas

---

## 📌 Análises Realizadas

### 💰 1. LTV (Lifetime Value)

O **LTV (Lifetime Value)** representa o valor total que um cliente gerou para a empresa ao longo do tempo.

#### 🔍 Query utilizada:

```sql
select
   Cliente_Nome,
   round(sum(Preco - (Preco*(Desconto/100))), 2) as LTV
from vendas_dio
group by Cliente_Nome
order by LTV desc;
```

#### 💡 O que foi feito:

* Calculado o valor real pago por produto considerando o desconto
* Somado o total gasto por cada cliente
* Arredondado o valor final para duas casas decimais
* Ordenado do maior para o menor LTV

#### 📈 Por que isso é importante?

* Identifica os clientes mais valiosos
* Ajuda a direcionar campanhas de fidelização
* Base para estratégias de retenção

---

### 🔢 2. LTV com TRUNCATE

Uma variação da análise anterior, utilizando **TRUNCATE** ao invés de **ROUND**.

#### 🔍 Query utilizada:

```sql
select 
     Cliente_Nome,
     truncate(sum(Preco -(Preco*(Desconto/1000))),2) as LTV
from vendas_dio
group by Cliente_Nome
order by LTV desc;
```

#### 💡 O que foi feito:

* Mesma lógica do LTV
* Utilização de `TRUNCATE` para cortar casas decimais sem arredondamento


#### 📈 Diferença prática:

* `ROUND` → arredonda o valor
* `TRUNCATE` → apenas corta as casas decimais

---

### 🛒 3. Frequência de Compra

Análise para identificar quais clientes mais compram na plataforma.

#### 🔍 Query utilizada:

```sql
select
    Cliente_nome,
    count(*) as Numero_Pedidos
from vendas_dio
group by Cliente_Nome
order by Numero_Pedidos;
```

#### 💡 O que foi feito:

* Contagem total de pedidos por cliente
* Agrupamento por cliente
* Ordenação pela quantidade de compras

#### 📈 Por que isso é importante?

* Identifica clientes mais engajados
* Ajuda a entender comportamento de compra
* Pode indicar clientes com alto potencial de LTV

---

## 🧠 Insights Possíveis

Com essas análises, é possível:

* Cruzar **frequência vs LTV**
* Identificar clientes que compram muito, mas gastam pouco (ou vice-versa)
* Criar estratégias como:

  * Programas de fidelidade
  * Descontos personalizados
  * Segmentação de clientes

---

## 🚀 Possíveis Evoluções

Este projeto pode ser expandido com:

* Ticket médio por cliente
* Análise de churn
* Receita por período (mensal, semanal)
* Ranking de produtos mais vendidos
* Análise por categoria



