create database Universidade;
use Universidade;

create table Campus(
 reg_id int primary key,
 Nome varchar(100), 
 cidade_id int,
 foreign key (cidade_id) references Cidades (cidade_id)
);

create table Cidades(
	cidade_id int primary key ,
    Municipio varchar(100),
    Uf_id int,
    foreign key (Uf_id) references Ufs(Uf_id)
);

create table Ufs(
	Uf_id int primary key,
    Uf varchar (2)
);


create table Cursos(
	curso_id int primary key,
    nome varchar(100),
    carga_horária int 
    );

create table relacao_cur_cam(
	campus_id int,
    curso_id int,
    foreign key (campus_id) references campus (reg_id),
    foreign key (curso_id) references Cursos (curso_id),
    primary key (campus_id, curso_id)
);

create table professores(
	professor_id int primary key,
    nome varchar(100)
);

create table disciplinas(
	disciplina_id int primary key,
    nome varchar(100),
    cargahoraria int
);

create table relacao_dis_prof(
	disciplina_id int,
    professor_id int,
    foreign key (disciplina_id) references disciplinas (disciplina_id),
    foreign key (professor_id) references professores (professor_id),
    primary key (disciplina_id, professor_id)
);

Create table estudantes(
	estudante_id int primary key,
    nome varchar(100),
    email varchar(255)
);


create table relacao_dis_prof_est(
	estudante_id int,
    disciplina_id int,
    professor_id int,
	foreign key (disciplina_id, professor_id) references relacao_dis_prof (disciplina_id, professor_id),
	foreign key (estudante_id) references estudantes (estudante_id)
);
