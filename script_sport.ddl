-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2018-05-16 21:22:18 CEST
--   sitio:      Oracle Database 12c
--   tipo:      Oracle Database 12c




CREATE TABLE Administrador
  (
    id       INTEGER NOT NULL ,
    Telefono VARCHAR2 (20 CHAR) NOT NULL
  ) ;
ALTER TABLE Administrador ADD CONSTRAINT Administrador_PK PRIMARY KEY ( id ) ;


CREATE TABLE Dueño
  (
    id     INTEGER NOT NULL ,
    Ciudad VARCHAR2 (30 CHAR) NOT NULL
  ) ;
ALTER TABLE Dueño ADD CONSTRAINT Dueño_PK PRIMARY KEY ( id ) ;


CREATE TABLE Equipo
  (
    id         INTEGER NOT NULL ,
    Puntuacion INTEGER ,
    Nombre     VARCHAR2 (25 CHAR) NOT NULL
  ) ;
ALTER TABLE Equipo ADD CONSTRAINT Equipo_PK PRIMARY KEY ( id ) ;


CREATE TABLE Jornada
  (
    id               INTEGER NOT NULL ,
    fecha            VARCHAR2 (15 CHAR) NOT NULL ,
    Puntos_local     INTEGER NOT NULL ,
    Puntos_visitante INTEGER NOT NULL ,
    Numero_partido   INTEGER
  ) ;
ALTER TABLE Jornada ADD CONSTRAINT Jornada_PK PRIMARY KEY ( id ) ;


CREATE TABLE Jugador
  (
    id        INTEGER NOT NULL ,
    Nombre    VARCHAR2 (25 CHAR) NOT NULL ,
    Nick_name VARCHAR2 (25 CHAR) ,
    Sueldo    INTEGER NOT NULL ,
    Puesto    VARCHAR2 (25 CHAR) NOT NULL ,
    Equipo_id INTEGER NOT NULL
  ) ;
ALTER TABLE Jugador ADD CONSTRAINT Jugador_PK PRIMARY KEY ( id ) ;


CREATE TABLE Persona
  (
    id       INTEGER NOT NULL ,
    Email    VARCHAR2 (40 CHAR) NOT NULL ,
    Pass     VARCHAR2 (30 CHAR) NOT NULL ,
    Nombre   VARCHAR2 (25) NOT NULL ,
    Apellido VARCHAR2 (25 CHAR)
  ) ;
ALTER TABLE Persona ADD CONSTRAINT Persona_PK PRIMARY KEY ( id ) ;


CREATE TABLE Usuario
  ( id INTEGER NOT NULL , Edad INTEGER NOT NULL
  ) ;
ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY ( id ) ;


CREATE TABLE interactua
  (
    Persona_id INTEGER NOT NULL ,
    Jornada_id INTEGER NOT NULL
  ) ;
ALTER TABLE interactua ADD CONSTRAINT interactua_PK PRIMARY KEY ( Persona_id, Jornada_id ) ;


CREATE TABLE juega
  (
    Equipo_id  INTEGER NOT NULL ,
    Jornada_id INTEGER NOT NULL
  ) ;
ALTER TABLE juega ADD CONSTRAINT juega_PK PRIMARY KEY ( Equipo_id, Jornada_id ) ;


ALTER TABLE Administrador ADD CONSTRAINT Administrador_Persona_FK FOREIGN KEY ( id ) REFERENCES Persona ( id ) ;

ALTER TABLE Dueño ADD CONSTRAINT Dueño_Persona_FK FOREIGN KEY ( id ) REFERENCES Persona ( id ) ;

ALTER TABLE interactua ADD CONSTRAINT FK_ASS_2 FOREIGN KEY ( Persona_id ) REFERENCES Persona ( id ) ;

ALTER TABLE interactua ADD CONSTRAINT FK_ASS_3 FOREIGN KEY ( Jornada_id ) REFERENCES Jornada ( id ) ;

ALTER TABLE juega ADD CONSTRAINT FK_ASS_4 FOREIGN KEY ( Equipo_id ) REFERENCES Equipo ( id ) ;

ALTER TABLE juega ADD CONSTRAINT FK_ASS_7 FOREIGN KEY ( Jornada_id ) REFERENCES Jornada ( id ) ;

ALTER TABLE Jugador ADD CONSTRAINT Jugador_Equipo_FK FOREIGN KEY ( Equipo_id ) REFERENCES Equipo ( id ) ;

ALTER TABLE Usuario ADD CONSTRAINT Usuario_Persona_FK FOREIGN KEY ( id ) REFERENCES Persona ( id ) ;



