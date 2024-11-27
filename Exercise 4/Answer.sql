create database vetbd;
use vetbd;

create table cidades(
	Cidade_id int primary key,
    nomeCidade varchar(100)
);

create table especialidades(
	Especialidade_id int primary key,
    NomeEspecialidade varchar(100)
);

create table tutores(
	Tutor_id int primary key,
    NomeTutor varchar(100),
    Cidade_id int,
    foreign key (Cidade_id) references cidades (Cidade_id)
); 

create table animais(
	Animal_id int primary key,
    NomeAnimal varchar(100),
    Tutor_id int,
    foreign key (Tutor_id) references tutores(Tutor_id)
);

create table Medicos_Veterinarios(
	Medico_id int primary key,
    NomeMedico varchar(100),
    Cidade_id int,
    foreign key (Cidade_id) references cidades (Cidade_id)
);

create table Medicos_Especialidades(
	Medico_id int,
    Especialidade_id  int,
    Peco_Consulta double,
    foreign key (Medico_id) references medicos_veterinarios (Medico_id),
    foreign key (Especialidade_id)references  especialidades (Especialidade_id),
    primary key (Medico_id,Especialidade_id)
);



create table Atendimentos(
	Atendimento_id int primary key,
    Animal_id int,
	Medico_id int,
    Especialidade_id int,
    DataAtendimento date,
    foreign key (Animal_id) references animais (Animal_id),
    foreign key (Medico_id, Especialidade_id) references medicos_especialidades (Medico_id,Especialidade_id)
    
);



Insert into especialidades (Especialidade_id, NomeEspecialidade) values 
(1, 'Cardiologia Veterinária'), 
(2, 'Dermatologia Veterinária'), 
(3, 'Oncologia Veterinária'),
(4, 'Ortopedia Veterinária'),
(5, 'Neurologia Veterinária'),
(6,'Oftalmologia Veterinária'),
(7, 'Odontologia Veterinária');

select * from especialidades;


insert into cidades values (1, 'Curitiba'), (2, 'São Paulo'), (3, 'Paranaguá');

select * from cidades;

insert into tutores values (1, 'Ethan Clark', 3), (2, 'Zoe Mitchell', 2), (3, 'Liam Reed', 1);

select * from tutores;

insert into animais values (1, 'Mouse', 2),
 (2, 'Gecko', 3),
 (3, 'Penguin', 1),
 (4, 'Owl', 2),
(5, 'Koala', 3),
(6, 'Dog', 1),
(7, 'Cat', 2),
(8, 'Bird', 3),
(9, 'Hamster', 1);

select * from animais;
insert into medicos_veterinarios values
 (1, 'Dr. Emily Harris', 2),
 (2, 'Dr. Jack Peterson', 3),
 (3, 'Dr. Sarah Turner', 1);

select * from medicos_veterinarios;

insert into medicos_especialidades values
(1,1, 150.00),
(2,3, 400.00 ),
(2,4, 300.00),
(3,5, 400.00),
(3,7, 300.00);

select * from medicos_especialidades;

insert into medicos_veterinarios values (4, 'Dr. Leonardo Pereira', 1);
insert into medicos_especialidades values
(4,2, 150.00), (4,6, 400.00 );

insert into atendimentos values
(1, 1, 6 , 4 ,'2024-11-11'),
(2, 5, 6 , 4 ,'2024-11-12'),
(3, 6, 2 , 4 ,'2024-11-13'),
(4, 7, 5 , 3 ,'2024-11-14'),
(5, 8, 5 , 3 ,'2024-11-15'),
(6, 9, 1 , 1 ,'2024-11-16'),
(7, 4, 4 , 2 ,'2024-11-17');
