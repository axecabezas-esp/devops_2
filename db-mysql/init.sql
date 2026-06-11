-- Asegurar el uso de la base de datos correcta
USE db_sistema;

-- =====================================================================
-- 1. CREACIÓN DE LA TABLA DE VENTAS (Mapeado de Venta.java)
-- =====================================================================
CREATE TABLE IF NOT EXISTS venta (
    `idVenta` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `nombreCliente` VARCHAR(255) NOT NULL,
    `valorCompra` DOUBLE NOT NULL,         -- Cambiado para coincidir con tu TableCompras.jsx
    `fechaCompra` DATETIME NOT NULL,       -- Cambiado para coincidir con tu TableCompras.jsx
    `direccionCompra` VARCHAR(255) NOT NULL, -- Cambiado para coincidir con tu TableCompras.jsx
    `despachoGenerado` BOOLEAN NOT NULL DEFAULT FALSE -- Cambiado para tu .filter en React
);

-- =====================================================================
-- 2. CREACIÓN DE LA TABLA DE DESPACHOS (Mapeado de Despacho.java)
-- =====================================================================
CREATE TABLE IF NOT EXISTS despacho (
    `idDespacho` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `idCompra` BIGINT NOT NULL,
    `direccionCompra` VARCHAR(255) NOT NULL,
    `fechaDespacho` DATETIME NULL,
    `patenteCamion` VARCHAR(20) NULL,
    `entregado` BOOLEAN NOT NULL DEFAULT FALSE,
    `intento` INT NOT NULL DEFAULT 0
);

-- =====================================================================
-- 3. CARGA DE DATOS DEMO POR DEFECTO
-- =====================================================================

-- Insertar Ventas de prueba
INSERT INTO venta (`idVenta`, `nombreCliente`, `valorCompra`, `fechaCompra`, `direccionCompra`, `despachoGenerado`) VALUES
(1, 'Alejandro San Martín', 45500.0, '2026-06-01 10:30:00', 'Av. Concha y Toro 543', TRUE),
(2, 'Constanza Silva', 128900.0, '2026-06-03 14:15:00', 'Pasaje Los Alerces 1120', TRUE),
(3, 'Mauricio Araya', 23500.0, '2026-06-05 18:45:00', 'Calle Limache 400', FALSE),
(4, 'Gabriela Tapia', 67000.0, '2026-06-08 11:00:00', 'Calle Nueva York 88', TRUE);

-- Insertar Despachos de prueba
INSERT INTO despacho (`idDespacho`, `idCompra`, `direccionCompra`, `fechaDespacho`, `patenteCamion`, `entregado`, `intento`) VALUES
(1, 1, 'Av. Concha y Toro 543', '2026-06-02 09:00:00', 'AA-BB-11', TRUE, 1),
(2, 2, 'Pasaje Los Alerces 1120', '2026-06-04 11:30:00', 'CC-DD-22', FALSE, 2),
(3, 4, 'Calle Nueva York 88', NULL, NULL, FALSE, 0);