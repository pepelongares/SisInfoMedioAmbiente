create table grupo
(
  id     tinyint(3) auto_increment
    primary key,
  nombre varchar(50) not null
);

create table entrada
(
  id           smallint(4) auto_increment
    primary key,
  nombreImagen varchar(20)            not null,
  titulo       varchar(50)            not null,
  fecha        date                   null,
  noticia      text                   not null,
  reto         text                   not null,
  consejo      text                   not null,
  estado       tinyint(1) default '0' null,
  idGrupo      tinyint(3)             not null,
  constraint FK_grupo_id_entrada
  foreign key (idGrupo) references grupo (id)
);

create table cuestionario
(
  tipo        tinyint(1)  not null,
  pregunta    varchar(50) not null,
  numFallos   tinyint(3)  not null,
  numAciertos tinyint(3)  not null,
  posCorrecta tinyint(1)  not null,
  idEntrada   smallint(4) not null,
  primary key (idEntrada, tipo),
  constraint FK_entrada_id_cuestionario
  foreign key (idEntrada) references entrada (id)
);

create table respuesta
(
  posicion         tinyint(1)  not null,
  cuerpo           varchar(50) not null,
  tipoCuestionario tinyint(1)  not null,
  idEntrada        smallint(4) not null,
  primary key (idEntrada, tipoCuestionario, posicion),
  constraint FK_cuestionario_tipo_respuesta
  foreign key (idEntrada, tipoCuestionario) references cuestionario (idEntrada, tipo)
);

create table usuario
(
  correo     varchar(50) not null,
  password   varchar(20) not null,
  rol        tinyint(1)  not null,
  nombre     varchar(20) not null,
  nacimiento smallint(4) not null,
  puntuacion smallint(4) not null,
  idGrupo    tinyint(3)  not null,
  primary key (correo),
  constraint FK_grupo_id_usuario
  foreign key (idGrupo) references grupo (id)
);

create table contestar
(
  idEntrada   smallint(4) not null,
  tipo        tinyint(1)  not null,
  correo      varchar(50) not null,
  posPregunta tinyint(1)  not null,
  primary key (idEntrada, tipo, correo, posPregunta),
  constraint FK_tipo_cuestionario_contestar
  foreign key (idEntrada, tipo) references cuestionario (idEntrada, tipo),
  constraint FK_usuario_contestar
  foreign key (correo) references usuario (correo)
);

INSERT INTO Grupo (nombre) VALUES ('NoCarteles');
INSERT INTO Usuario (correo,password,rol,nombre,nacimiento,puntuacion,idGrupo) VALUES ('admin@admin.es','admin',0,'administrador',1970,0,1)