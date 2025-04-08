-- Crear tabla solo si no existe
CREATE TABLE IF NOT EXISTS Videojuego (
    codigo_juego INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_juego TEXT NOT NULL,
    costo REAL NOT NULL,
    unidades_disponibles INTEGER DEFAULT 0,
    fecha_salida DATE NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT 1,
    categoria TEXT NOT NULL
);

-- Eliminar registros (si existen)
DELETE FROM Videojuego;

-- Reiniciar el autoincremento
DELETE FROM sqlite_sequence WHERE name = 'Videojuego';

-- Insertar 50 registros
INSERT INTO Videojuego (nombre_juego, costo, unidades_disponibles, fecha_salida, activo, categoria)
VALUES
('The Legend of Zelda: Breath of the Wild', 59.99, 25, '2025-09-01', 1, 'Aventura'),
('Super Mario Odyssey', 49.99, 100, '2025-09-02', 1, 'Plataformas'),
('Red Dead Redemption 2', 39.99, 15, '2025-09-03', 1, 'Acción-Aventura'),
('Cyberpunk 2077', 29.99, 40, '2025-09-04', 1, 'RPG'),
('The Witcher 3: Wild Hunt', 19.99, 30, '2025-09-05', 1, 'RPG'),

('God of War', 49.50, 10, '2025-09-06', 1, 'Acción'),
('Elden Ring', 59.99, 18, '2025-09-07', 1, 'Souls-like'),
('Resident Evil 4 Remake', 54.99, 8, '2025-09-08', 1, 'Survival Horror'),
('Final Fantasy VII Remake', 49.99, 12, '2025-09-09', 1, 'RPG'),
('Minecraft', 26.95, 50, '2025-09-01', 1, 'Sandbox'),

('Grand Theft Auto V', 29.99, 20, '2025-09-02', 1, 'Acción-Aventura'),
('Fortnite: Capítulo 5', 0.00, 35, '2025-09-03', 1, 'Battle Royale'),
('The Last of Us Part II', 39.99, 22, '2025-09-04', 1, 'Acción-Aventura'),
('Animal Crossing: New Horizons', 54.99, 27, '2025-09-05', 1, 'Simulación'),
('Silent Hill 2', 44.99, 9, '2025-09-06', 1, 'Survival Horror'),

('Halo Infinite', 59.99, 17, '2025-09-07', 1, 'Shooter'),
('Stardew Valley', 14.99, 40, '2025-09-08', 1, 'Simulación'),
('Dark Souls III', 39.99, 6, '2025-09-09', 1, 'Souls-like'),
('The Elder Scrolls V: Skyrim', 19.99, 14, '2025-09-01', 1, 'RPG'),
('Persona 5 Royal', 59.99, 5, '2025-09-02', 1, 'RPG'),

('Call of Duty: Modern Warfare', 59.99, 25, '2025-09-03', 1, 'Shooter'),
('Detroit: Become Human', 29.99, 30, '2025-09-04', 1, 'Aventura Gráfica'),
('Uncharted 4: El Desenlace del Ladrón', 19.99, 20, '2025-09-05', 1, 'Aventura'),
('Crash Bandicoot 4', 49.99, 45, '2025-09-06', 1, 'Plataformas'),
('Sea of Thieves', 39.99, 8, '2025-09-07', 1, 'Aventura'),

('Horizon Zero Dawn', 19.99, 10, '2025-09-08', 1, 'RPG'),
('Overwatch 2', 0.00, 12, '2025-09-09', 1, 'Shooter'),
('Mass Effect Legendary Edition', 59.99, 7, '2025-09-01', 1, 'RPG'),
('Spider-Man: Miles Morales', 49.99, 28, '2025-09-02', 1, 'Acción-Aventura'),
('Tomb Raider: Definitive Edition', 14.99, 16, '2025-09-03', 1, 'Aventura'),

('Baldur''s Gate 3', 59.99, 22, '2025-09-04', 1, 'RPG'),
('Dead Space Remake', 59.99, 19, '2025-09-05', 1, 'Survival Horror'),
('Fire Emblem: Three Houses', 59.99, 14, '2025-09-06', 1, 'Estrategia'),
('BioShock: The Collection', 39.99, 21, '2025-09-07', 1, 'Shooter'),
('Civilization VI', 29.99, 9, '2025-09-08', 1, 'Estrategia'),

('Doom Eternal', 39.99, 11, '2025-09-09', 1, 'Shooter'),
('Street Fighter 6', 59.99, 13, '2025-09-01', 1, 'Lucha'),
('Death Stranding', 29.99, 8, '2025-09-02', 1, 'Acción-Aventura'),
('Disco Elysium', 39.99, 15, '2025-09-03', 1, 'RPG'),
('Hades', 24.99, 19, '2025-09-04', 1, 'Roguelike'),

('Starfield', 69.99, 12, '2025-09-05', 1, 'RPG'),
('Metro Exodus', 29.99, 18, '2025-09-06', 1, 'Shooter'),
('Nier: Automata', 39.99, 7, '2025-09-07', 1, 'RPG'),
('Ghost of Tsushima', 59.99, 6, '2025-09-08', 1, 'Acción-Aventura'),
('Super Smash Bros. Ultimate', 59.99, 5, '2025-09-09', 1, 'Lucha');