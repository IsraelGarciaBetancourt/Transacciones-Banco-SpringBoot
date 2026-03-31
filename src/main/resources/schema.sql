------------------------------
-- 1. USUARIOS
------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    nombre_completo VARCHAR(200) NOT NULL,
    rol VARCHAR(50) NOT NULL,         -- ADMIN / USER
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

------------------------------
-- 2. TRANSACCIONES
------------------------------
CREATE TABLE IF NOT EXISTS transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    tipo_transaccion VARCHAR(50) NOT NULL, -- Ej: 'DEPOSITO', 'RETIRO', 'TRANSFERENCIA'
    descripcion VARCHAR(255),
    fecha_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_transaccion_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id) ON DELETE CASCADE
);