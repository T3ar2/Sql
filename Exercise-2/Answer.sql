
Create database Exercise;

use Exercise;

create table clientes(
	clientid int primary key,
    nome varchar(100),
    email varchar(100),
    telefone varchar(15)
);

create table contratos(
	contratoid int primary key,
    data_contrato date,
    valor_total decimal(10,2),
    clientid int,
    estatus varchar (20),
    foreign key (clientid) references clientes(clientid)
);

create table serviços(
	ServicoID int primary key,
    NomeServico varchar(100),
    preco decimal(10,2),
    categoria varchar(50)
);

create table itenscontrato(
	itemid int primary key,
    contratoid int,
    servicoid int,
    quantidade int,
    foreign key (contratoID) references contratos(contratoid),
    foreign key (servicoid) references serviços(ServicoID)
);



# Inserção de dados
insert into clientes(clientid, nome, email, telefone) 
				values (1, 'João Silva', 'joao.silva@email.com','11987654321');
insert into clientes(clientid, nome, email, telefone) 
				values (2, 'Maria Oliveira', 'maria.oliveira@email.com','21987654321');
insert into clientes(clientid, nome, email, telefone) 
				values (3, 'Pedro Costa', 'pedro.costa@email.com','41987654321');
                
                
insert into contratos(contratoid, data_contrato, valor_total, clientid, estatus)
			values(101, '2024-09-01', 1500.50, 1, 'Cloncluído');
insert into contratos(contratoid, data_contrato, valor_total, clientid, estatus)
			values(102, '2024-09-02', 2750.75, 2, 'Em andamento');
insert into contratos(contratoid, data_contrato, valor_total, clientid, estatus)
			values(103, '2024-09-03', 500.00, 1, 'Cloncluído');
insert into contratos(contratoid, data_contrato, valor_total, clientid, estatus)
			values(104, '2024-09-04', 3500.10, 3, 'Em andamento');
            
            
insert into serviços(ServicoID, NomeServico, preco, categoria)
			values(201, 'Desenvolcimento Web', 5000.00, 'TI');
insert into serviços(ServicoID, NomeServico, preco, categoria)
			values(202, 'Suporte Técnico', 1000.00, 'TI');
insert into serviços(ServicoID, NomeServico, preco, categoria)
			values(203, 'Consultoria Estratégica', 3000.00, 'Consultoria');
insert into serviços(ServicoID, NomeServico, preco, categoria)
			values(204, 'Treinamento Pessoal', 1500.00, 'Consultoria');



insert into itenscontrato(itemid, contratoid, servicoid, quantidade)
			values(1, 101, 201, 1);
insert into itenscontrato(itemid, contratoid, servicoid, quantidade)
			values(2, 101, 202, 2);
insert into itenscontrato(itemid, contratoid, servicoid, quantidade)
			values(3, 102, 204, 1);
insert into itenscontrato(itemid, contratoid, servicoid, quantidade)
			values(4, 103, 203, 1);
insert into itenscontrato(itemid, contratoid, servicoid, quantidade)
			values(5, 104, 201, 1);
insert into itenscontrato(itemid, contratoid, servicoid, quantidade)
			values(6, 104, 202, 3);


# 1. Liste todos os nomes dos clientes e o valor total de seus contratos utilizando INNER JOIN.
select nome, valor_total from clientes inner join contratos on clientes.clientid = contratos.clientid; 

# 2. Liste os detalhes dos contratos (ID, Data, ValorTotal) juntamente com os nomes dos serviços que fazem parte dos contratos utilizando INNER JOIN
select contratos.contratoid, data_contrato, valor_total, NomeServico from contratos inner join itenscontrato on contratos.contratoid = itenscontrato.contratoid inner join serviços on itenscontrato.servicoid = serviços.servicoid;

# 3. Liste todos os serviços que pertencem aE categoria 'TI' e que foram contratados pelos clientes.
select * from clientes inner join contratos on clientes.clientid = contratos.clientid inner join itenscontrato on contratos.contratoid = itenscontrato.contratoid 
inner join serviços on itenscontrato.servicoid = serviços.servicoID where categoria = ('TI');

# 4. Encontre todos os clientes que fizeram contratos com status 'Concluído' utilizando INNER JOIN
select * from clientes inner join contratos on clientes.clientid = contratos.clientid inner join itenscontrato on contratos.contratoid = itenscontrato.contratoid 
inner join serviços on itenscontrato.servicoid = serviços.servicoID where estatus = ('Cloncluído');

# 5. Liste o nome dos serviços e a quantidade total de cada serviço contratado em todos os contratos
select  NomeServico, quantidade, contratoid from serviços inner join itenscontrato on  serviços.servicoID = itenscontrato.servicoid;
