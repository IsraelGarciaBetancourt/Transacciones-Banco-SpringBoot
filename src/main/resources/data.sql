
-- USUARIOS
-----------------------------------
INSERT INTO usuarios (username, password, nombre_completo, rol, activo)
VALUES
('admin', 'admin123', 'Administrador General', 'ADMIN', TRUE),
('empleado', '1234', 'Empleado Regular', 'USER', TRUE);

--------------------------------------------------------
-- DATOS DE PRUEBA: TRANSACCIONES
--------------------------------------------------------

-- Asignando transacciones al usuario con ID 1 y ID 2
INSERT INTO transacciones (usuario_id, monto, tipo_transaccion, descripcion, fecha_transaccion) VALUES
(1, 1500.00, 'DEPOSITO', 'Apertura de caja chica', '2023-10-01 08:30:00'),
(1, 350.50, 'RETIRO', 'Pago a proveedor de limpieza', '2023-10-02 14:15:00'),
(2, 800.00, 'TRANSFERENCIA', 'Transferencia a cuenta bancaria principal', '2023-10-03 10:45:00'),
(2, 120.00, 'RETIRO', 'Compra de suministros de oficina (papelería)', '2023-10-04 11:20:00'),
(1, 4500.00, 'DEPOSITO', 'Ingreso por ventas de la semana', CURRENT_TIMESTAMP),
(2, 60.00, 'RETIRO', 'Pago de pasajes y viáticos', CURRENT_TIMESTAMP);

