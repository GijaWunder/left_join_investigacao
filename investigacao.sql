create database investigacao;
use investigacao;

create table suspeito(id_suspeito int primary key,
nome varchar(100) not null,
cargo varchar(40) not null);

create table evidencia(id_evidencia int,
id_suspeito int,
descricao varchar(50),
primary key (id_suspeito, id_evidencia),
foreign key (id_suspeito) references suspeito(id_suspeito) on delete cascade on update cascade);


create table expediente(id_suspeito int,
dataExpediente date,
horario_entrada time,
horario_saida time,
primary key (id_suspeito),
foreign key (id_suspeito) references suspeito(id_suspeito) on delete cascade on update cascade);


create table cameraSeguranca (id_camera int,
id_suspeito int,
dataGravacao date not null,
observacao varchar(100),
primary key (id_suspeito, id_camera),
foreign key (id_suspeito) references suspeito(id_suspeito) on delete cascade on update cascade);


create table cartaoAcesso (id_registro int,
id_suspeito int,
dataAcesso date not null,
horario_acesso time not null,
primary key (id_suspeito, id_registro),
foreign key (id_suspeito) references suspeito(id_suspeito) on delete cascade on update cascade);


create table impressaoDigital (id_impressao int,
local_encontrado varchar(100) not null,
id_suspeito int,
primary key (id_suspeito, id_impressao),
foreign key (id_suspeito) references suspeito(id_suspeito) on delete cascade on update cascade);

insert into suspeito (id_suspeito, nome, cargo) values
(1, 'Arthur Mendes', 'Diretor do museu'),
(2, 'Beatriz Almeida', 'Segurança'),
(3, 'Carlos Oliveira', 'Segurança'),
(4, 'Daniela Ferreira', 'Faxineiro'),
(5, 'Eduardo Martins', 'Faxineiro'),
(6, 'Fernanda Costa', 'Guia turística'),
(7, 'Gabriel Souza', 'Faxineiro'),
(8, 'Helena Rodrigues', 'Guia turística'),
(9, 'Igor Carvalho', 'Monitor de segurança'),
(10, 'Juliana Santos', 'Recepcionista'),
(11, 'Leonardo Ribeiro', 'Estagiário'),
(12, 'Mariana Lopes', 'Estagiária'),
(13, 'Nicolas Barros', 'Segurança'),
(14, 'Olivia Fernandes', 'Secretária'),
(15, 'Pedro Albuquerque', 'Recepcionista'),
(16, 'Lucas Ferreira', 'Estagiário'),
(17, 'Camila Mendes', 'Monitor de segurança'),
(18, 'Rafael Nascimento', 'Técnico de informática'),
(19, 'Isabela Martins', 'Recepcionista'),
(20, 'Thiago Carvalho', 'Vendedor da loja do museu'),
(21, 'Amanda Ribeiro', 'Restauradora de obras de arte'),
(22, 'Felipe Costa', 'Faxineiro'),
(23, 'Sofia Albuquerque', 'Guia turística');

insert into expediente (id_suspeito, dataExpediente, horario_entrada, horario_saida) values
(1, '2026-10-15', '08:00:00', '16:00:00'),
(2, '2026-10-15', '14:00:00', '22:00:00'),
(3, '2026-10-15', '08:00:00', '16:00:00'),
(4, '2026-10-15', '10:00:00', '18:00:00'),
(5, '2026-10-15', '14:00:00', '22:00:00'),
(6, '2026-10-15', '08:00:00', '16:00:00'),
(7, '2026-10-15', '10:00:00', '18:00:00'),
(8, '2026-10-15', '08:00:00', '14:00:00'),
(9, '2026-10-15', '16:00:00', '23:00:00'),
(10, '2026-10-14', '14:00:00', '22:00:00'),
(11, '2026-10-13', '08:00:00', '16:00:00'),
(12, '2026-10-15', '10:00:00', '18:00:00'),
(13, null, null, null),
(14, '2026-10-15', '08:00:00', '16:00:00'),
(15, '2026-10-15', '09:00:00', '14:00:00'),
(16, '2026-10-15', '08:00:00', '14:00:00'),
(17, '2026-10-15', '09:00:00', '14:00:00'),
(18, '2026-10-15', '08:00:00', '16:00:00'),
(19, null, null, null),
(20, '2026-10-15', '11:00:00', '20:00:00'),
(21, '2026-10-15', '08:00:00', '16:00:00'),
(22, '2026-10-15', '07:00:00', '13:00:00'),
(23, '2026-10-15', '10:00:00', '22:00:00');

insert into cameraSeguranca (id_camera, id_suspeito, dataGravacao, observacao) values
(2, 1, '2026-10-15', 'Entrou e demorou para sair da sala das joias.'),
(1, 20, '2026-10-15', 'Circulou pelo corredor perto da sala das joias.'),
(4, 4, '2026-10-15', 'Permaneceu próximo à entrada.'),
(5, 7, '2026-10-15', 'Foi gravado próximo à vitrine.'),
(6, 1, '2026-10-15', 'Saiu do museu carregando uma bolsa.'),
(7, 20, '2026-10-15', 'Passou pelo corredor de serviço.'),
(2, 17, '2026-10-15', 'Entrou na sala das joias.'),
(4, 15, '2026-10-15', 'Passou diversas vezes pela sala das joias.'),
(5, 12, '2026-10-15', 'Observou a vitrine por alguns minutos'),
(9, 7, '2026-10-15', 'Entrou na sala de joias.'),
(1, 6, '2026-10-15', 'Entrou no corredor da sala das joias'),
(10, 18, '2026-10-15', 'Desativou temporariamente uma câmera'),
(3, 18, '2026-10-15', 'Entrou na sala das joias para arrumar uma das câmeras'),
(3, 21, '2026-10-15', 'Entrou na sala de joias para restaurar algumas joias');

insert into cartaoAcesso (id_registro, id_suspeito, dataAcesso, horario_acesso) values
(1, 7, '2026-10-13', '08:30:00'),
(2, 4, '2026-09-20', '09:15:00'),
(3, 20, '2026-09-27', '10:00:00'),
(4, 18, '2025-12-05', '10:20:00'),
(6, 1, '2026-10-15', '11:00:00'),
(7, 6, '2026-10-15', '11:30:00'),
(8, 12, '2026-10-15', '11:50:00'),
(9, 17, '2026-10-15', '09:30:00'),
(10, 21, '2026-10-15', '10:50:00');

insert into impressaoDigital (id_impressao, local_encontrado, id_suspeito) values
(1, 'Vitrine onde as joias estavam expostas', 1),
(2, 'Apoio para as joias', 1),
(3, 'Fechaduras eletrônicas da vitrine de joias', 1),
(4, 'Gaveta da diretoria', 21),
(5, 'Vidro da vitrine', 6),
(6, 'Porta do corredor lateral', 6),
(7, 'Mesa de pesquisa', 12),
(8, 'Painel de monitoramento', 17),
(9, 'Maçaneta da sala de segurança', 17),
(10, 'Armário de restauração', 21);


-- 1: expediente (dia do roubo)
select s.id_suspeito, s.nome, e.dataExpediente
from suspeito as s
left join expediente as e
on s.id_suspeito = e.id_suspeito
and e.dataExpediente = '2026-10-15';

-- 2: horario do roubo
select s.id_suspeito, s.nome, e.dataExpediente, e.horario_entrada, e.horario_saida
from suspeito as s
left join expediente as e
on s.id_suspeito = e.id_suspeito
and e.horario_entrada BETWEEN '08:00:00' and '12:00:00';

-- 3: cameras de segurança
select s.id_suspeito, s.nome, c.id_camera, c.id_suspeito, c.dataGravacao, c.observacao
from suspeito as s
left join cameraSeguranca as c
on s.id_suspeito = c.id_suspeito
and c.id_camera between '1' and '5';

-- 4: acesso a sala de joias
select s.nome, c.dataAcesso, c.horario_acesso, c.id_registro
from suspeito as s
left join cartaoAcesso as c
on s.id_suspeito = c.id_suspeito;

-- 5: impressao digital
select s.nome, s.id_suspeito, i.local_encontrado
from suspeito as s
left join impressaoDigital as i
on s.id_suspeito = i.id_suspeito
order by i.id_suspeito;
