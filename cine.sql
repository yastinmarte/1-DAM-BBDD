DROP DATABASE IF exists CINE;
CREATE DATABASE CINE;
USE CINE;

CREATE TABLE GENERO (
IDENTIFICADOR int auto_increment primary key,
NOMBRE varchar(25)
);

CREATE TABLE PELICULA (
IDENTIFICADOR_PELICULA int auto_increment primary key,
TITULO varchar(300),
DURACION int,
IDENTIFICADOR_GENERO int,
foreign key(IDENTIFICADOR_GENERO) references GENERO(IDENTIFICADOR)
);
ALTER TABLE PELICULA
ADD COLUMN DIRECTOR VARCHAR(100);

INSERT INTO GENERO (NOMBRE) VALUES ('Acción');

INSERT INTO GENERO (NOMBRE) VALUES ('Comedia');

INSERT INTO GENERO (NOMBRE) VALUES ('Terror');

INSERT INTO GENERO (NOMBRE) VALUES ('Drama');

INSERT INTO GENERO (NOMBRE) VALUES ('Ciencia ficción');

INSERT INTO PELICULA
(IDENTIFICADOR_PELICULA, TITULO, DURACION, IDENTIFICADOR_GENERO, DIRECTOR)
VALUES
(1, 'Gladiator', 155, 1, 'Ridley Scott'),
(2, 'John Wick', 101, 1, 'Chad Stahelski'),
(3, 'Mad Max: Fury Road', 120, 1, 'George Miller'),
(4, 'Die Hard', 132, 1, 'John McTiernan'),
(5, 'The Dark Knight', 152, 1, 'Christopher Nolan'),

(6, 'Superbad', 113, 2, 'Greg Mottola'),
(7, 'The Hangover', 100, 2, 'Todd Phillips'),
(8, 'Dumb and Dumber', 107, 2, 'Peter Farrelly'),
(9, 'Groundhog Day', 101, 2, 'Harold Ramis'),
(10, 'Mrs. Doubtfire', 125, 2, 'Chris Columbus'),

(11, 'The Conjuring', 112, 3, 'James Wan'),
(12, 'It', 135, 3, 'Andy Muschietti'),
(13, 'Scream', 111, 3, 'Wes Craven'),
(14, 'Halloween', 91, 3, 'John Carpenter'),
(15, 'The Exorcist', 132, 3, 'William Friedkin'),

(16, 'Titanic', 195, 4, 'James Cameron'),
(17, 'Forrest Gump', 142, 4, 'Robert Zemeckis'),
(18, 'The Shawshank Redemption', 142, 4, 'Frank Darabont'),
(19, 'The Green Mile', 189, 4, 'Frank Darabont'),
(20, 'Good Will Hunting', 126, 4, 'Gus Van Sant'),

(21, 'Interstellar', 169, 5, 'Christopher Nolan'),
(22, 'The Matrix', 136, 5, 'Lana Wachowski'),
(23, 'Alien', 117, 5, 'Ridley Scott'),
(24, 'Blade Runner', 117, 5, 'Ridley Scott'),
(25, 'Back to the Future', 116, 5, 'Robert Zemeckis'),
(26, 'Avatar', 162, 5, 'James Cameron'),
(27, 'Jurassic Park', 127, 5, 'Steven Spielberg'),
(28, 'Star Wars', 121, 5, 'George Lucas'),
(29, 'The Terminator', 107, 5, 'James Cameron'),
(30, 'E.T. the Extra-Terrestrial', 115, 5, 'Steven Spielberg');

ALTER table PELICULA
ADD column AÑO_ESTRENO int;

ALTER TABLE PELICULA
RENAME COLUMN AÑO_ESTRENO TO ESTRENO;

select NOMBRE FROM GENERO;

SELECT TITULO FROM PELICULA;

SELECT * FROM PELICULA WHERE DIRECTOR = 'Steven Spielberg';

SELECT * FROM PELICULA WHERE DURACION>120;

SELECT 
    PELICULA.TITULO,
    PELICULA.DURACION,
    PELICULA.DIRECTOR,
    PELICULA.ESTRENO,
    GENERO.NOMBRE AS GENERO
FROM PELICULA
INNER JOIN GENERO
ON PELICULA.IDENTIFICADOR_GENERO = GENERO.IDENTIFICADOR;

SELECT 
    PELICULA.TITULO,
    PELICULA.DURACION,
    PELICULA.DIRECTOR,
    PELICULA.ESTRENO,
    GENERO.NOMBRE AS GENERO
FROM PELICULA
INNER JOIN GENERO
ON PELICULA.IDENTIFICADOR_GENERO = GENERO.IDENTIFICADOR
WHERE GENERO.NOMBRE = 'Acción';

SELECT 
    PELICULA.TITULO,
    PELICULA.DIRECTOR,
    GENERO.NOMBRE AS GENERO
FROM PELICULA
INNER JOIN GENERO
ON PELICULA.IDENTIFICADOR_GENERO = GENERO.IDENTIFICADOR
ORDER BY PELICULA.TITULO ASC;

SELECT 
    PELICULA.TITULO,
    PELICULA.DURACION,
    GENERO.NOMBRE AS GENERO
FROM PELICULA
INNER JOIN GENERO
ON PELICULA.IDENTIFICADOR_GENERO = GENERO.IDENTIFICADOR
WHERE PELICULA.DURACION > 120;