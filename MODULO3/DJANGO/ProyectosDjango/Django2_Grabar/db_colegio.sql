DROP TABLE IF EXISTS Alumno;

CREATE TABLE Alumno  (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre     TEXT  NOT NULL,
    direccion  TEXT  NOT NULL,
    estatura   REAL  NOT NULL
);

INSERT INTO Alumno (nombre, direccion, estatura) VALUES
('Carlos Pérez', 'Calle Mayor 12', 1.75),
('María López', 'Avenida Sol 45', 1.62),
('Juan Gómez', 'Calle Luna 8', 1.80),
('Lucía Fernández', 'Plaza España 3', 1.68);

