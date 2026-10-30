SET NOCOUNT ON;
GO

IF OBJECT_ID('Playlist_Cancion', 'U') IS NOT NULL DROP TABLE Playlist_Cancion;
IF OBJECT_ID('Cancion_Artista', 'U') IS NOT NULL DROP TABLE Cancion_Artista;
IF OBJECT_ID('Playlists', 'U') IS NOT NULL DROP TABLE Playlists;
IF OBJECT_ID('Canciones', 'U') IS NOT NULL DROP TABLE Canciones;
IF OBJECT_ID('Albumes', 'U') IS NOT NULL DROP TABLE Albumes;
IF OBJECT_ID('Generos', 'U') IS NOT NULL DROP TABLE Generos;
IF OBJECT_ID('Artistas', 'U') IS NOT NULL DROP TABLE Artistas;
IF OBJECT_ID('Usuarios', 'U') IS NOT NULL DROP TABLE Usuarios;
GO


CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL,
    pais VARCHAR(60) NOT NULL,
    activo BIT NOT NULL
);
GO

CREATE TABLE Artistas (
    id_artista INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(60) NOT NULL,
    biografia VARCHAR(300) NULL,
    fecha_debut DATE NULL
);
GO

CREATE TABLE Generos (
    id_genero INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre_genero VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NULL
);
GO

CREATE TABLE Albumes (
    id_album INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    titulo_album VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    id_artista INT NOT NULL,
    CONSTRAINT FK_Albumes_Artistas FOREIGN KEY (id_artista)
        REFERENCES Artistas(id_artista)
);
GO

CREATE TABLE Canciones (
    id_cancion INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    titulo_cancion VARCHAR(100) NOT NULL,
    duracion_segundos INT NOT NULL,
    reproducciones INT NOT NULL,
    numero_pista INT NOT NULL,
    id_album INT NOT NULL,
    id_genero INT NOT NULL,
    CONSTRAINT CK_Canciones_Duracion CHECK (duracion_segundos > 0),
    CONSTRAINT CK_Canciones_Reproducciones CHECK (reproducciones >= 0),
    CONSTRAINT CK_Canciones_NumeroPista CHECK (numero_pista > 0),
    CONSTRAINT FK_Canciones_Albumes FOREIGN KEY (id_album)
        REFERENCES Albumes(id_album),
    CONSTRAINT FK_Canciones_Generos FOREIGN KEY (id_genero)
        REFERENCES Generos(id_genero)
);
GO

CREATE TABLE Playlists (
    id_playlist INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre_playlist VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NULL,
    es_publica BIT NOT NULL,
    fecha_creacion DATE NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT FK_Playlists_Usuarios FOREIGN KEY (id_usuario)
        REFERENCES Usuarios(id_usuario)
);
GO

CREATE TABLE Playlist_Cancion (
    id_playlist INT NOT NULL,
    id_cancion INT NOT NULL,
    orden_cancion INT NOT NULL,
    fecha_agregada DATE NOT NULL,
    CONSTRAINT PK_Playlist_Cancion PRIMARY KEY (id_playlist, id_cancion),
    CONSTRAINT CK_Playlist_Cancion_Orden CHECK (orden_cancion > 0),
    CONSTRAINT FK_Playlist_Cancion_Playlists FOREIGN KEY (id_playlist)
        REFERENCES Playlists(id_playlist),
    CONSTRAINT FK_Playlist_Cancion_Canciones FOREIGN KEY (id_cancion)
        REFERENCES Canciones(id_cancion)
);
GO

CREATE TABLE Cancion_Artista (
    id_cancion INT NOT NULL,
    id_artista INT NOT NULL,
    CONSTRAINT PK_Cancion_Artista PRIMARY KEY (id_cancion, id_artista),
    CONSTRAINT FK_Cancion_Artista_Canciones FOREIGN KEY (id_cancion)
        REFERENCES Canciones(id_cancion),
    CONSTRAINT FK_Cancion_Artista_Artistas FOREIGN KEY (id_artista)
        REFERENCES Artistas(id_artista)
);
GO


INSERT INTO Usuarios (nombre, correo, fecha_registro, pais, activo) VALUES
('Ana Torres', 'ana@mail.com', '2024-01-10', 'Costa Rica', 1),
('Luis Mora', 'luis@mail.com', '2024-02-14', 'Costa Rica', 1),
('Carlos Vega', 'carlos@mail.com', '2024-03-03', 'Mexico', 1),
('Maria Solis', 'maria@mail.com', '2024-04-21', 'Colombia', 1),
('Jose Rojas', 'jose@mail.com', '2024-05-18', 'Chile', 1),
('Daniela Ruiz', 'daniela@mail.com', '2024-06-02', 'Argentina', 1);
GO

INSERT INTO Artistas (nombre_artista, pais_origen, biografia, fecha_debut) VALUES
('Luis Fonsi', 'Puerto Rico', 'Cantante pop latino.', '1998-01-01'),
('Daddy Yankee', 'Puerto Rico', 'Pionero del reggaeton.', '1995-01-01'),
('Bad Bunny', 'Puerto Rico', 'Artista urbano y trap latino.', '2016-01-01'),
('J Balvin', 'Colombia', 'Cantante colombiano de musica urbana.', '2009-01-01'),
('Shakira', 'Colombia', 'Cantante y compositora colombiana.', '1991-01-01'),
('Karol G', 'Colombia', 'Cantante urbana colombiana.', '2013-01-01'),
('Maluma', 'Colombia', 'Cantante colombiano de pop urbano.', '2011-01-01'),
('Feid', 'Colombia', 'Cantante y compositor colombiano.', '2015-01-01'),
('Ozuna', 'Puerto Rico', 'Cantante de reggaeton y trap.', '2014-01-01'),
('Anuel AA', 'Puerto Rico', 'Cantante de trap y reggaeton.', '2016-01-01');
GO

INSERT INTO Generos (nombre_genero, descripcion) VALUES
('Reggaeton', 'Genero urbano latino muy popular.'),
('Pop', 'Musica pop latina y comercial.'),
('Trap', 'Trap latino.'),
('Rock', 'Rock en espanol.'),
('Electronica', 'Musica electronica bailable.');
GO

INSERT INTO Albumes (titulo_album, fecha_lanzamiento, id_artista) VALUES
('Vida', '2019-02-01', 1),
('Barrio Fino', '2004-07-13', 2),
('Oasis', '2019-06-28', 4),
('KG0516', '2021-03-26', 6),
('Colores', '2020-03-19', 4),
('YHLQMDLG', '2020-02-29', 3),
('Odisea', '2017-08-25', 9);
GO

INSERT INTO Canciones (titulo_cancion, duracion_segundos, reproducciones, numero_pista, id_album, id_genero) VALUES
('Despacito', 230, 1000000, 1, 1, 1),
('Monotonia', 215, 500000, 2, 1, 2),
('Gasolina', 192, 980000, 1, 2, 1),
('China', 210, 800000, 2, 2, 1),
('Hawai', 220, 780000, 1, 3, 2),
('Oasis Intro', 160, 300000, 2, 3, 2),
('Tusa', 200, 900000, 1, 4, 1),
('Bichota', 210, 850000, 2, 4, 1),
('Provenza', 220, 910000, 3, 4, 1),
('Mi Gente', 210, 920000, 1, 5, 1),
('Rojo', 205, 650000, 2, 5, 1),
('Callaita', 210, 880000, 1, 6, 3),
('Dakiti', 240, 950000, 2, 6, 3),
('Yonaguni', 225, 820000, 3, 6, 3),
('Criminal', 205, 760000, 1, 7, 1);
GO

INSERT INTO Playlists (nombre_playlist, descripcion, es_publica, fecha_creacion, id_usuario) VALUES
('Favoritas de Ana', 'Canciones favoritas de Ana', 1, '2025-01-10', 1),
('Gym Power', 'Musica para entrenar', 1, '2025-01-15', 2),
('Fiesta Latina', 'Playlist para fiestas', 1, '2025-01-18', 3),
('Relax Total', 'Musica tranquila', 0, '2025-01-20', 4),
('Viaje Largo', 'Canciones para carretera', 1, '2025-01-22', 5),
('Top Urbano', 'Lo mejor del urbano', 1, '2025-02-02', 1),
('Trap Mood', 'Trap latino', 1, '2025-02-05', 3),
('Pop Latino', 'Pop actual', 1, '2025-02-10', 6),
('Clasicos Urbanos', 'Exitos del genero urbano', 1, '2025-02-15', 2);
GO

INSERT INTO Playlist_Cancion (id_playlist, id_cancion, orden_cancion, fecha_agregada) VALUES
(1, 1, 1, '2025-01-10'),
(1, 7, 2, '2025-01-10'),
(1, 13, 3, '2025-01-10'),
(2, 3, 1, '2025-01-15'),
(2, 8, 2, '2025-01-15'),
(2, 9, 3, '2025-01-15'),
(3, 4, 1, '2025-01-18'),
(3, 10, 2, '2025-01-18'),
(3, 15, 3, '2025-01-18'),
(4, 2, 1, '2025-01-20'),
(4, 5, 2, '2025-01-20'),
(4, 6, 3, '2025-01-20'),
(5, 1, 1, '2025-01-22'),
(5, 5, 2, '2025-01-22'),
(5, 14, 3, '2025-01-22'),
(6, 7, 1, '2025-02-02'),
(6, 10, 2, '2025-02-02'),
(6, 13, 3, '2025-02-02'),
(7, 12, 1, '2025-02-05'),
(7, 13, 2, '2025-02-05'),
(7, 14, 3, '2025-02-05'),
(8, 2, 1, '2025-02-10'),
(8, 5, 2, '2025-02-10'),
(8, 11, 3, '2025-02-10'),
(9, 1, 1, '2025-02-15'),
(9, 3, 2, '2025-02-15'),
(9, 10, 3, '2025-02-15');
GO

INSERT INTO Cancion_Artista (id_cancion, id_artista) VALUES
(1, 1), (1, 2),
(2, 1), (2, 5),
(3, 2),
(4, 2), (4, 3), (4, 4), (4, 6), (4, 7), (4, 9), (4, 10),
(5, 7),
(6, 4),
(7, 6), (7, 7),
(8, 6),
(9, 6),
(10, 4), (10, 7),
(11, 4),
(12, 3), (12, 9), (12, 2),
(13, 3), (13, 4),
(14, 3),
(15, 9), (15, 10);
GO

SELECT COUNT(*) AS cantidad_usuarios
FROM Usuarios;
GO

SELECT A.nombre_artista, B.titulo_album, B.fecha_lanzamiento
FROM Artistas A
INNER JOIN Albumes B ON B.id_artista = A.id_artista
WHERE A.nombre_artista = 'J Balvin'
ORDER BY B.fecha_lanzamiento;
GO

SELECT A.nombre_artista, B.titulo_album, C.numero_pista, C.titulo_cancion
FROM Canciones C
INNER JOIN Albumes B ON C.id_album = B.id_album
INNER JOIN Artistas A ON B.id_artista = A.id_artista
WHERE A.nombre_artista = 'J Balvin'
  AND B.titulo_album = 'Oasis'
ORDER BY C.numero_pista;
GO

SELECT A.nombre_artista, C.titulo_cancion, B.titulo_album
FROM Canciones C
INNER JOIN Cancion_Artista CA ON C.id_cancion = CA.id_cancion
INNER JOIN Artistas A ON CA.id_artista = A.id_artista
INNER JOIN Albumes B ON C.id_album = B.id_album
WHERE A.nombre_artista = 'Bad Bunny'
ORDER BY C.titulo_cancion;
GO

SELECT G.nombre_genero, COUNT(C.id_cancion) AS cantidad_canciones
FROM Generos G
LEFT JOIN Canciones C ON G.id_genero = C.id_genero
GROUP BY G.nombre_genero
ORDER BY cantidad_canciones DESC, G.nombre_genero ASC;
GO

SELECT U.nombre, P.nombre_playlist, P.descripcion, P.fecha_creacion
FROM Usuarios U
INNER JOIN Playlists P ON U.id_usuario = P.id_usuario
WHERE U.nombre = 'Ana Torres'
ORDER BY P.fecha_creacion;
GO

SELECT TOP (5) titulo_cancion, reproducciones
FROM Canciones
ORDER BY reproducciones DESC, titulo_cancion ASC;
GO

SELECT TOP (5) titulo_cancion, duracion_segundos
FROM Canciones
ORDER BY duracion_segundos DESC, titulo_cancion ASC;
GO

SELECT TOP (3) U.nombre, COUNT(P.id_playlist) AS total_playlists
FROM Usuarios U
LEFT JOIN Playlists P ON U.id_usuario = P.id_usuario
GROUP BY U.nombre
ORDER BY total_playlists DESC, U.nombre ASC;
GO
