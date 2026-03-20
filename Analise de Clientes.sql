-- LTV — Lifetime Value

/*O LTV representa quanto dinheiro cada cliente gerou para a empresa ao longo do tempo.*/

select
   Cliente_Nome,
   round(sum(Preco - (Preco*(Desconto/100))), 2) as LTV
from vendas_dio
group by Cliente_Nome
order by LTV desc;   

-- Truncando ao invés de arredondar

select 
     Cliente_Nome,
     truncate(sum(Preco -(Preco*(Desconto/1000))),2) as LTV
from vendas_dio
group by Cliente_Nome
order by LTV desc;     
     

-- Frequência de compra, clientes com o maior numero de compras na plataforma

select
    Cliente_nome,
    count(*) as Numero_Pedidos
from vendas_dio
group by Cliente_Nome
order by Numero_Pedidos;  














