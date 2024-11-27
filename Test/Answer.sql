create database OdontoB;
use OdontoB;

create table Cidades(
 cidadeid int primary key,
 nomecidade varchar(100),
 Uf varchar(2)
);
create table especialidades(
	especialidadeid int primary key,
    nomeespecialidade varchar(100)
);
create table pacientes(
	pacienteid int primary key,
    nomepaciente varchar(100),
    cidadeid int,
    foreign key (cidadeid) references cidades (cidadeid) 
);
create table Dentistas(
	Dentistaid int primary key,
    nomedentista varchar(100),
    cidadeid int,
    foreign key (cidadeid) references cidades(cidadeid)
);

create table Dentistas_Especialidades(
 dentistaid int,
 especialidadesid int,
 foreign key (dentistaid) references dentistas(dentistaid),
 foreign key (especialidadesid)references especialidades(especialidadeid),
 primary key (dentistaid, especialidadesid)
);

create table Atendimentos(
	atendimentoid int primary key,
    Pacienteid int,
    dentistaid int,
    especialidade int,
    dataatendimento date,
    horaatendimento time,
    foreign key (pacienteid)references pacientes(pacienteid),
    foreign key (dentistaid, especialidade) references dentistas_especialidades (dentistaid, especialidadesid)
);

/*Cidades: Inclua pelo menos 3 cidades diferentes*/
insert into cidades (cidadeid, nomecidade, Uf) values 
(1 , 'São Paulo', 'SP'),
(2, 'Rio de Janeiro', 'RJ'),
(3, 'Bahia', 'BA');

/*Especialidades: Inclua pelo menos 5 especialidades odontológicas (ex.: Ortodontia, Endodontia e Implantodontia)*/
insert into especialidades (especialidadeid, nomeespecialidade) values 
(1 , 'Ortodontia'),
(2, 'Endodontia'),
(3, 'Periodontia'),
(4, 'Protesista Dentário'),
(5, 'Odontopediatria');

/*Pacientes: Inclua pelo menos 3 pacientes, associados a diferentes cidades.*/
insert into pacientes (pacienteid, nomepaciente, cidadeid) values 
(1 , 'Ana Souza', 3),
(2, 'Carlos Pereira', 2),
(3, 'Mariana Silva', 1);

/*Dentistas: Inclua pelo menos 3 dentistas, associados a diferentes cidades.*/
insert into dentistas (Dentistaid, nomedentista, cidadeid) values 
(1 , 'Dr. João Martins', 2),
(2, 'Dra. Beatriz Almeida', 3),
(3, 'Dr. Rafael Costa', 1);

/*Dentistas_Especialidades: Relacione cada dentista a pelo menos 2 especialidades*/
insert into dentistas_especialidades (dentistaid, especialidadesid) values
(1,2),
(2,4),
(3,1),
(1,3),
(2,5),
(3,4);

/*Atendimentos: Registre pelo menos 5 atendimentos, incluindo informações sobre o paciente, o dentista e a especialidade.*/
insert into atendimentos (atendimentoid, Pacienteid, dentistaid, especialidade, dataatendimento, horaatendimento) values
(1,1,1,3,'2023-01-15', '08:15'),
(2,2,3,1,'2024-02-28', '14:30'),
(3,3,3,4,'2022-07-10', '19:45'),
(4,1,2,5,'2021-11-03', '03:00'), 
(5,2,2,4,'2020-08-22', '22:10');




/*1. Atualize o nome de um paciente.*/
update pacientes set nomepaciente = 'Cleitin da Silva' where (pacienteid = 1);


/*2. Atualize o nome de uma especialidade.*/
update especialidades set nomeespecialidade = 'Cirurgia Buco-Maxilo-Facial' where (especialidadeid = 3);


/*3. Atualize a cidade de um dentista*/
update dentistas set cidadeid = '2' where (dentistaid = 3);


/*4. Altere a data de um atendimento.*/
update atendimentos set dataatendimento = '2024-11-21' where (atendimentoid = 3);


/*5. Modifique a especialidade associada a um atendimento.*/
update atendimentos set especialidade = '2' where (atendimentoid = 1);



/*Questões com DELETE

1. Remova um atendimento de um paciente específico.*/
delete from atendimentos where (pacienteid = 2);


/*2. Delete um dentista e todas as suas associações de especialidades.*/
delete from atendimentos where (dentistaid = 3);
delete from dentistas_especialidades where (dentistaid = 3);
delete from dentistas where (dentistaid = 3);

/*1. Liste todos os pacientes de uma cidade específica, ordenados por nome.*/
select * from pacientes where (cidadeid = 2) order by nomepaciente;


/*2. Liste todos os dentistas de uma especialidade específica, ordenados por nome.(foi perguntado em sala de aula sobre que não dava para fazer sem inner join e o professor autorizou)*/
select * from dentistas inner join dentistas_especialidades on dentistas.dentistaid = dentistas_especialidades.dentistaid where (especialidadesid = 4) order by nomedentista;

/*3. Liste todos os atendimentos realizados em uma data específica, ordenados pela hora.*/
select * from atendimentos where (dataatendimento = '2023-01-15') order by (horaatendimento);

/*4. Encontre todas as especialidades disponíveis, ordenadas alfabeticamente.*/
select * from especialidades order by (nomeespecialidade);

/*5. Liste todos os pacientes cadastrados, ordenados por cidade.*/
select * from pacientes order by (cidadeid);

/*SELECT com JOIN

1. Liste os nomes dos pacientes e os atendimentos realizados, incluindo a data e o dentista responsável*/
select atendimentos.atendimentoid, nomepaciente, dataatendimento, nomedentista from atendimentos 
inner join pacientes on atendimentos.pacienteid = pacientes.pacienteid 
inner join dentistas_especialidades on atendimentos.dentistaid = dentistas_especialidades.dentistaid 
inner join dentistas on dentistas_especialidades.dentistaid = dentistas.dentistaid;

/*2. Liste os dentistas e suas especialidades, ordenados pelo nome do dentista.*/
select dentistas_especialidades.dentistaid, nomedentista, nomeespecialidade from dentistas_especialidades
inner join especialidades on dentistas_especialidades.especialidadesid = especialidades.especialidadeid 
inner join dentistas on dentistas_especialidades.dentistaid = dentistas.Dentistaid order by nomedentista;

/*3. Encontre os atendimentos de uma especialidade específica, incluindo nome do paciente e do dentista*/
select atendimentoid, nomepaciente, nomedentista, nomeespecialidade from atendimentos 
inner join pacientes on atendimentos.pacienteid = pacientes.pacienteid
inner join dentistas_especialidades on dentistas_especialidades.especialidadesid = atendimentos.especialidade 
inner join especialidades on dentistas_especialidades.especialidadesid = especialidades.especialidadeid 
inner join dentistas on dentistas_especialidades.dentistaid = dentistas.Dentistaid 
where nomeespecialidade = 'Endodontia';

/*4. Liste os pacientes de uma cidade específica e os dentistas que os atenderam.*/
select atendimentoid, nomepaciente, nomedentista, nomecidade from atendimentos inner join pacientes on pacientes.pacienteid = atendimentos.pacienteid 
 inner join dentistas_especialidades on dentistas_especialidades.especialidadesid = atendimentos.especialidade 
 inner join dentistas on dentistas_especialidades.dentistaid = dentistas.Dentistaid 
 inner join cidades on pacientes.cidadeid = cidades.cidadeid where (nomecidade = 'Bahia');
 
 /*5. Mostre as especialidades de todos os dentistas em uma cidade específica.*/
select nomedentista, nomeespecialidade, nomecidade from dentistas 
inner join dentistas_especialidades on dentistas.dentistaid = dentistas_especialidades.dentistaid
inner join especialidades on dentistas_especialidades.especialidadesid = especialidades.especialidadeid
inner join cidades on dentistas.cidadeid = cidades.cidadeid where nomecidade = 'Rio de Janeiro';

