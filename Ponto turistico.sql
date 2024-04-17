create database if not exists turismo;
use turismo;
 create table capitao(
	CPF bigint(11) primary key not null,
	Nome varchar(50) not null,
	Endereco varchar(50) not null,
	Numero int(3) not null,
	Celular bigint(9)
);
 insert capitao values (1234567891, "Jack", "Rua Robalo",
100, 998976554),
(9876543219, "Ian", "Rua Robalo", 55, 988772200),
(7418529631, "Paula", "Rua Marinha", 89, 977885512),
(1472583697, "Miguel", "Rua do Mar", 250, 999226655),
(3692581473, "Adriano", "Rua das Ondas", 1200, 994495885);
SELECT * FROM capitao;

 create table escuna(
	Numero int(5) primary key not null,
	Nome varchar(50) not null,
	capitao_CPF bigint(11) not null,
	foreign key (capitao_CPF) references capitao(CPF)
);
 insert escuna values (12345, "Black Flag", 1234567891),
(12346, "Caveira", 9876543219),
(12347, "Brazuka", 1472583697),
(12348, "Rosa Brilhante 1", 7418529631),
(12349, "Tubarão Ocean", 3692581473),
(12350, "Rosa Brilhante 2", 7418529631);
select * from escuna;

create table destino(
	Id int(2) primary key auto_increment,
	Nome varchar(50) not null
);

insert destino values (0, "Ilha Dourada"),
(0, "Ilha D'areia fina"),
(0, "Ilha Encantada"),
(0, "Ilhinha"),
(0, "Ilha dos Ventos"),
(0, "Ilha Torta"),
(0, "Ilha dos Sonhos"),
(0, "Ilha do Sono");
select * from destino;

 create table passeio(
 Id int(3) primary key auto_increment,
	Data date not null,
	Hr_saida time not null,
	Hr_chegada time not null,
	escuna_Numero int(5) not null,
	destino_Id int(2) not null,
	foreign key (escuna_Numero) references escuna(Numero),
	foreign key (destino_Id) references destino(Id)
 );
 
insert passeio values (0, "2018/01/02", "08:00","14:00",
12345, 1),
(0, "2018/01/02", "07:00", "17:00", 12346, 8),
(0, "2018/01/02", "08:00", "14:00", 12350, 3),
(0, "2018/01/03", "06:00", "12:00", 12347, 2),
(0, "2018/01/03", "07:00", "13:00", 12348, 4),
(0, "2018/01/03", "08:00", "14:00", 12349, 6),
(0, "2018/01/03", "09:00", "15:00", 12345, 5),
(0, "2018/01/04", "07:00", "16:00", 12347, 1),
(0, "2018/01/04", "07:00", "17:00", 12345, 3),
(0, "2018/01/04", "09:00", "13:00", 12349, 7),
(0, "2018/01/05", "10:00", "18:00", 12350, 8),
(0, "2018/01/05", "09:00", "13:00", 12347, 7);
select * from passeio;

select escuna.nome as 'Escuna',destino.nome as 'Ilha',Hr_saida as 'Saida',Hr_chegada as 'Chegada'
from passeio INNER JOIN escuna,destino
WHERE passeio.escuna_Numero =  escuna.numero AND passeio.destino_id = destino.id
ORDER BY passeio.data;
CREATE VIEW v_consulta AS
select escuna.nome as 'Escuna',destino.nome as 'Ilha',Hr_saida as 'Saida',Hr_chegada as 'Chegada'
from passeio INNER JOIN escuna,destino
WHERE passeio.escuna_Numero =  escuna.numero AND passeio.destino_id = destino.id
ORDER BY passeio.data;
show tables;

create table Enfermeiro(
	coren int primary key,
    Nome varchar(50) not null
);
create table Paciente(
	Num int primary key,
    Nome varchar(50) not null
);
create table Remedio(
	Cod int primary key,
    Nome varchar(50) not null
);
create table Medicacao(
	id int primary key auto_increment,
    Data date not null,
    Hora time not null,
    PacienteNum int not null,
    RemedioCod int not null,
    Enfermeirocoren int not null,
    foreign key(PacienteNum) references Paciente(Num),
    foreign key(RemedioCod) references Remedio(Cod),
    foreign key(Enfermeirocoren) references Enfermeiro(coren)
);
insert Enfermeiro values(11111,'Enfermeiro1'),(22222,'Enfermeiro2'),(33333,'Enfermeiro3');
select * from Enfermeiro;
insert Paciente values(1000,'Paciente A'),(1001,'Paciente B'),(1002,'Paciente C'),
(1003,'Paciente D'),(1004,'Paciente E'),(1005,'Paciente F'),(1006,'Paciente H'),
(1008,'Paciente I');
select * from Paciente;
insert Remedio values(100,'Controle de Pressão'),(101,'Problema no estomago'),(102,'Soro'),
(103,'Calmante'),(104,'Analgésico'),(105,'Rins');
select * from Remedio;
insert Medicacao values(0,current_date,'05:00:00',1003,104,11111),
(0,current_date(),'08:00:00',1001,100,11111),(0,current_date(),'08:20:00',1007,102,11111),
(0,current_date(),'08:30:00',1007,105,11111),(0,current_date(),'09:00:00',1004,104,22222),
(0,current_date(),'09:30:00',1005,105,33333),(0,current_date(),'10:20:00',1001,103,11111),
(0,current_date(),'12:00:00',1008,102,22222),(0,current_date(),'12:20:00',1002,105,22222),
(0,current_date(),'13:30:00',1001,100,111110),(0,current_date(),'15:00:00',1003,104,22222),
(0,current_date(),'16:00:00',1001,103,11111),(0,current_date(),'20:30:00',1008,100,22222),
(0,current_date(),'21:00:00',1002,105,11111),(0,current_date(),'21:10:00',1006,102,11111),
(0,current_date(),'23:00:00',1003,104,33333);
select * from medicacao;
use turismo;

SELECT Medicacao.Id AS "Registro", Medicacao.Data,
Medicacao.Hora, Paciente.Nome AS
"Paciente", Remedio.Nome AS "Medicacao", Enfermeiro.Nome
"Enfermeiro"
 FROM Medicacao INNER JOIN Paciente
 ON Medicacao.PacienteNum = Paciente.Num
 INNER JOIN Remedio
 ON Medicacao.RemedioCod = Remedio.Cod
 INNER JOIN Enfermeiro
 ON Medicacao.EnfermeiroCoreen = Enfermeiro.Coren
 ORDER BY Medicacao.Id ASC;
 
 CREATE TABLE Vendas(
	Numero INT PRIMARY KEY AUTO_INCREMENT,
	DestinoId INT NOT NULL,
	Embarque DATE NOT NULL,
	Qtd INT NOT NULL,
FOREIGN KEY(DestinoId) REFERENCES destino(Id)
);
INSERT destino VALUES (0, "Ilha Dourada", 100.00),
(0, "Ilha D'areia fina", 120.00),
(0, "Ilha Encantada", 80.00),
(0, "Ilha dos Ventos", 90.00),
(0, "Pequena Ilha do Mar", 100.00),
(0, "Ilha Torta", 150.00),
(0, "Ilha dos Sonhos", 120.00),
(0, "Ilha do Sono", 180.00);
 
