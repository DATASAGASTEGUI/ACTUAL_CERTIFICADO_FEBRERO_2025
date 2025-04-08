-- Crear tabla solo si no existe
CREATE TABLE IF NOT EXISTS Paciente (
    codigo_paciente TEXT PRIMARY KEY,
    nombre_paciente TEXT NOT NULL,
    costo_tratamiento REAL NOT NULL,
    dias_hospitalizado INTEGER DEFAULT 0,
    fecha_ingreso DATE NOT NULL,
    asegurado BOOLEAN NOT NULL DEFAULT 1,
    diagnostico TEXT NOT NULL
);

-- Eliminar registros (si existen)
DELETE FROM Paciente;

-- Insertar 10 registros de ejemplo
INSERT INTO Paciente (codigo_paciente, nombre_paciente, costo_tratamiento, dias_hospitalizado, fecha_ingreso, asegurado, diagnostico)
VALUES
('P001', 'Juan Pérez', 1200.50, 5, '2025-09-01', 1, 'Neumonía'),
('P002', 'María López', 800.00, 3, '2025-09-02', 1, 'Gastritis'),
('P003', 'Carlos Sánchez', 2500.75, 12, '2025-09-03', 0, 'Fractura'),
('P004', 'Lucía Ramírez', 1500.00, 7, '2025-09-04', 1, 'Apendicitis'),
('P005', 'Andrés Torres', 600.25, 2, '2025-09-05', 1, 'Migraña'),
('P006', 'Fernanda Díaz', 3000.00, 15, '2025-09-06', 0, 'Cirugía Cardíaca'),
('P007', 'Ricardo Gómez', 200.00, 1, '2025-09-07', 1, 'Resfriado Común'),
('P008', 'Laura Fernández', 1800.99, 6, '2025-09-08', 1, 'Diabetes'),
('P009', 'Pedro Castillo', 950.40, 4, '2025-09-09', 1, 'Hipertensión'),
('P010', 'Ana Morales', 700.00, 3, '2025-09-01', 0, 'Infección Urinaria');