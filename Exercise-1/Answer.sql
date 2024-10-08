create database Atividade_1;
use Atividade_1;

create table produto(
	id_produto int primary key,
    nome_produto varchar(100),
    preco decimal(10,2)
);

create table pedido(
	id_pedido int primary key,
    id_cliente int,
    data_pedido date,
    valor_total decimal(10,2),
    foreign key (id_cliente) references cliente(id_cliente)
);

create table cliente(
	id_cliente int primary key,
    nome Varchar(100),
    email varchar(100)
);

create table itempedido(
	id_item_pedido int primary key,
    id_pedido int,
    id_produto int,
    quantidade int,
    foreign key (id_pedido) references pedido(id_pedido),
    foreign key (id_produto) references produto(id_produto)
);


insert into produto(id_produto, nome_produto, preco) values (1,'Notebook', 2500.00);
insert into produto(id_produto, nome_produto, preco) values (2,'Smartphone', 1500.00);
insert into produto(id_produto, nome_produto, preco) values (3,'Tablet', 1200.00);

insert into cliente(id_cliente, nome, email)  values (1,'Joâo Silva', 'joao@gmail.com');
insert into cliente(id_cliente, nome, email)  values (2,'Maria Oliveira','maria@gmail.com');
insert into cliente(id_cliente, nome, email)  values (3,'Pedro Souza', 'pedro@gmail.com');

insert into pedido(id_pedido, data_pedido, valor_total)  values (1, '2023-09-15' , '3000.00');
insert into pedido(id_pedido, data_pedido, valor_total)  values (2, '2023-09-16' , '1500.00');
insert into pedido(id_pedido, data_pedido, valor_total)  values (3, '2023-09-17', '1200.00');

#1. Liste todos os clientes que reálizárám pedidos.
select nome from cliente;

#2. Exibá o nome do cliente e o válor totál dos seus pedidos
select nome, valor_total from cliente inner join pedido on cliente.id_cliente = pedido.id_pedido; 

#3. Liste os produtos comprádos no pedido de ID 1
select * from produto inner join itempedido on itempedido.id_pedido = produto.id_produto where id_pedido in ('1');

#4. Exibá os pedidos com o nome do cliente e á dátá do pedido
select nome, data_pedido, valor_total from cliente inner join pedido on cliente.id_cliente = pedido.id_pedido;

#5. Liste os itens do pedido, mostrándo o nome do produto, quántidáde e válor totál por item.
select nome_produto, valor_total, quantidade, id_item_pedido from produto inner join itempedido  on itempedido.id_item_pedido = produto.id_produto inner join pedido on produto.id_produto = pedido.id_pedido;

#6.Encontre o válor totál gásto por cádá cliente
select nome, valor_total from cliente inner join pedido on cliente.id_cliente = pedido.id_pedido;

#7. Mostre todos os pedidos reálizádos no me3s de setembro de 2023.
select id_pedido, data_pedido, valor_total from pedido where data_pedido  >= 2023-09-01 and data_pedido >= 2023-09-30;

#8. Liste os clientes que comprárám máis de um produto em um unico pedido
select * from cliente inner join itempedido on cliente.id_cliente = itempedido.id_pedido where quantidade > 2;

#9. Exibá os pedidos que contem o produto 'Smártphone'
select * from itempedido inner join produto on  itempedido.id_item_pedido = produto.id_produto where nome_produto in  ('Smartphone');

#10.Mostre o nome do cliente e o nome do produto párá cádá item de pedido.
select nome, nome_produto, id_item_pedido from itempedido inner join cliente on itempedido.id_pedido = cliente.id_cliente inner join produto on cliente.id_cliente = produto.id_produto;

#11.Liste os produtos que áindá não forám comprádos por nenhum cliente
select * from produto inner join itempedido on produto.id_produto = itempedido.id_produto where quantidade =0;

#12. Mostre o totál de itens comprádos em cádá pedido.
select  id_item_pedido, valor_total, quantidade from itempedido inner join produto on itempedido.id_item_pedido = produto.id_produto inner join pedido on itempedido.id_item_pedido = pedido.id_pedido;

#13. Exibá o cliente que fez o pedido máis cáro.
select * from pedido inner join cliente on pedido.id_pedido = cliente.id_cliente where Valor_total >= 2000;

#14. Liste os clientes que fizerám máis de um pedido
select * from itempedido inner join cliente on itempedido.id_pedido = cliente.id_cliente where id_pedido = 2;

#15. Encontre o pedido com á máior quántidáde de itens
select * from itempedido where quantidade > 1;

#16. Mostre os pedidos e o válor totál gásto por cádá um, ordenádos pelo válor gásto
select nome, valor_total from itempedido inner join cliente on cliente.id_cliente = itempedido.id_item_pedido inner join pedido on pedido.id_pedido = itempedido.id_item_pedido order by valor_total;

#17. Liste os produtos e o número de vezes que forám vendidos
select nome_produto, quantidade from produto inner join itempedido  on itempedido.id_item_pedido = produto.id_produto;

#18. Exibá os clientes que comprárám produtos com preço superior á 2000 reáis
select nome, valor_total from cliente inner join pedido on cliente.id_cliente = pedido.id_pedido where valor_total >= 2000;

#19. Mostre o nome do cliente que reálizou o pedido máis recente
select * from cliente inner join pedido on cliente.id_cliente = pedido.id_pedido where data_pedido in ('2023-09-17');

#20. Liste todos os produtos e seus respectivos preços, juntámente com o nome dos clientes que os comprárám
select nome_produto, preco, nome from produto inner join cliente on produto.id_produto = cliente.id_cliente;
