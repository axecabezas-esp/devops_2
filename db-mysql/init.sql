USE proyectosemestral;

-- =====================================================================
-- 1. CREACIÓN DE LA TABLA DE VENTAS (Mapeado exacto de Venta.java)
-- =====================================================================
CREATE TABLE IF NOT EXISTS venta (
    `id_venta` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `direccion_compra` VARCHAR(255) ,
    `valor_compra` INT ,
    `fecha_compra` DATE ,
    `despacho_generado` BOOLEAN DEFAULT FALSE
);

-- =====================================================================
-- 2. CREACIÓN DE LA TABLA DE DESPACHOS (Mapeado exacto de Despacho.java)
-- =====================================================================
CREATE TABLE IF NOT EXISTS despacho (
    `id_despacho` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `id_compra` BIGINT ,
    `direccion_compra` VARCHAR(255) ,
    `valor_compra` BIGINT ,
    `fecha_despacho` DATE NULL,
    `patente_camion` VARCHAR(255) NULL,
    `despachado` BOOLEAN  DEFAULT FALSE,
    `intento` INT  DEFAULT 0
);

-- =====================================================================
-- 3. CARGA DE DATOS DEMO POR DEFECTO
-- =====================================================================

-- Insertar Ventas de prueba
INSERT INTO venta (`id_venta`, `direccion_compra`, `valor_compra`, `fecha_compra`, `despacho_generado`) VALUES
(1, 'Av. Concha y Toro 543', 45500, '2026-06-01', FALSE),
(2, 'Pasaje Los Alerces 1120', 128900, '2026-06-03', FALSE),
(3, 'Calle Limache 400', 23500, '2026-06-05', FALSE),
(4, 'Calle Nueva York 88', 67000, '2026-06-08', FALSE);

-- Insertar Despachos de prueba (Ajustados a la nueva estructura)
INSERT INTO despacho (`id_despacho`, `id_compra`, `direccion_compra`, `valor_compra`, `fecha_despacho`, `patente_camion`, `despachado`, `intento`) VALUES
(1, 1, 'Av. Concha y Toro 543', 45500, '2026-06-02', 'AA-BB-11', TRUE, 1),
(2, 2, 'Pasaje Los Alerces 1120', 128900, '2026-06-04', 'CC-DD-22', FALSE, 2),
(3, 4, 'Calle Nueva York 88', 67000, NULL, NULL, FALSE, 0);