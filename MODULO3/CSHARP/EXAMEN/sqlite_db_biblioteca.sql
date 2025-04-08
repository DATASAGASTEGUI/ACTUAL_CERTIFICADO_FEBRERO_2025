-- Crear tabla solo si no existe
CREATE TABLE IF NOT EXISTS Libro (
    id_libro INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    precio REAL NOT NULL,
    stock INTEGER DEFAULT 0,
    fecha_publicacion DATE NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT 1,
    genero TEXT NOT NULL
);

-- Eliminar registros (si existen)
DELETE FROM Libro;

-- Reiniciar el autoincremento
DELETE FROM sqlite_sequence WHERE name = 'Libro';

-- Insertar 50 registros
INSERT INTO Libro (titulo, precio, stock, fecha_publicacion, disponible, genero)
VALUES
('Cien Años de Soledad', 18.50, 25, '2025-09-01', 1, 'Novela'),
('El Principito', 9.99, 100, '2025-09-02', 1, 'Infantil'),
('Don Quijote de la Mancha', 22.00, 15, '2025-09-03', 1, 'Clásico'),
('1984', 15.00, 40, '2025-09-04', 1, 'Ciencia Ficción'),
('Crónica de una Muerte Anunciada', 12.00, 30, '2025-09-05', 1, 'Novela'),

('La Odisea', 20.00, 10, '2025-09-06', 1, 'Clásico'),
('La Sombra del Viento', 17.50, 18, '2025-09-07', 1, 'Misterio'),
('It', 25.00, 8, '2025-09-08', 1, 'Terror'),
('El Señor de los Anillos', 35.00, 12, '2025-09-09', 1, 'Fantasía'),
('Harry Potter y la Piedra Filosofal', 19.90, 50, '2025-09-01', 1, 'Fantasía'),

('La Metamorfosis', 10.00, 20, '2025-09-02', 1, 'Clásico'),
('Los Juegos del Hambre', 16.00, 35, '2025-09-03', 1, 'Juvenil'),
('Orgullo y Prejuicio', 14.50, 22, '2025-09-04', 1, 'Romántica'),
('El Hobbit', 18.00, 27, '2025-09-05', 1, 'Fantasía'),
('Drácula', 21.00, 9, '2025-09-06', 1, 'Terror'),

('Fahrenheit 451', 15.00, 17, '2025-09-07', 1, 'Ciencia Ficción'),
('El Alquimista', 12.50, 40, '2025-09-08', 1, 'Filosofía'),
('Los Miserables', 28.00, 6, '2025-09-09', 1, 'Clásico'),
('Juego de Tronos', 30.00, 14, '2025-09-01', 1, 'Fantasía'),
('La Divina Comedia', 24.00, 5, '2025-09-02', 1, 'Clásico'),

('El Código Da Vinci', 18.99, 25, '2025-09-03', 1, 'Misterio'),
('Sherlock Holmes: Estudio en Escarlata', 13.00, 30, '2025-09-04', 1, 'Misterio'),
('La Isla del Tesoro', 11.00, 20, '2025-09-05', 1, 'Aventura'),
('Peter Pan', 9.50, 45, '2025-09-06', 1, 'Infantil'),
('Moby Dick', 20.00, 8, '2025-09-07', 1, 'Aventura'),

('La Iliada', 19.00, 10, '2025-09-08', 1, 'Clásico'),
('Hamlet', 14.00, 12, '2025-09-09', 1, 'Clásico'),
('Anna Karenina', 23.00, 7, '2025-09-01', 1, 'Romántica'),
('Las Aventuras de Tom Sawyer', 11.50, 28, '2025-09-02', 1, 'Juvenil'),
('Robinson Crusoe', 13.50, 16, '2025-09-03', 1, 'Aventura'),

('La Historia Interminable', 18.00, 22, '2025-09-04', 1, 'Fantasía'),
('Frankenstein', 17.00, 19, '2025-09-05', 1, 'Terror'),
('Cumbres Borrascosas', 16.00, 14, '2025-09-06', 1, 'Romántica'),
('El Retrato de Dorian Gray', 15.50, 21, '2025-09-07', 1, 'Clásico'),
('Los Pilares de la Tierra', 27.00, 9, '2025-09-08', 1, 'Histórica'),

('Madame Bovary', 19.00, 11, '2025-09-09', 1, 'Romántica'),
('La Celestina', 12.00, 13, '2025-09-01', 1, 'Clásico'),
('Rayuela', 22.00, 8, '2025-09-02', 1, 'Novela'),
('Ensayo sobre la Ceguera', 18.00, 15, '2025-09-03', 1, 'Filosofía'),
('La Casa de los Espíritus', 20.00, 19, '2025-09-04', 1, 'Novela'),

('Odisea en el Espacio', 21.00, 12, '2025-09-05', 1, 'Ciencia Ficción'),
('Metro 2033', 17.00, 18, '2025-09-06', 1, 'Ciencia Ficción'),
('Los Detectives Salvajes', 23.00, 7, '2025-09-07', 1, 'Novela'),
('El Nombre de la Rosa', 25.00, 6, '2025-09-08', 1, 'Misterio'),
('Ulises', 28.00, 5, '2025-09-09', 1, 'Clásico');
