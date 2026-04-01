<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Nueva Transacción</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>

<body>

<div class="contenedor">

    <jsp:include page="/WEB-INF/views/barra-lateral.jsp" />

    <main class="principal">

        <header class="encabezado">
            <div>
                <h1 class="titulo-degradado">Registrar Movimiento</h1>
                <p style="color: var(--texto-apagado); margin-top: 5px;">Añade una nueva transacción a tu cuenta.</p>
            </div>
        </header>

        <div class="tarjeta" style="max-width: 600px; margin: 0 auto;">
            
            <form action="${pageContext.request.contextPath}/transacciones/nuevo" method="post">
                <div class="grupo-formulario">
                    <label>Tipo de Transacción</label>
                    <select name="tipoTransaccion" class="control-formulario" required>
                        <option value="" disabled selected>-- Seleccionar Tipo --</option>
                        <option value="DEPOSITO">Depósito</option>
                        <option value="RETIRO">Retiro</option>
                        <option value="TRANSFERENCIA">Transferencia</option>
                    </select>
                </div>
                
                <div class="grupo-formulario">
                    <label>Monto</label>
                    <div style="position: relative;">
                        <span style="position: absolute; left: 15px; top: 14px; color: var(--texto-apagado)">$</span>
                        <input type="number" step="0.01" min="0.01" name="monto" class="control-formulario" style="padding-left: 30px;" placeholder="0.00" required>
                    </div>
                </div>

                <div class="grupo-formulario">
                    <label>Descripción</label>
                    <textarea name="descripcion" class="control-formulario" rows="3" placeholder="Detalles de la transacción..." required></textarea>
                </div>

                <div class="flex justificar-entre mt-2">
                    <a href="${pageContext.request.contextPath}/transacciones/list" class="boton" style="color: var(--texto-apagado);">
                        Cancelar
                    </a>
                    <button type="submit" class="boton boton-primario">
                        Guardar Transacción
                    </button>
                </div>
            </form>

        </div>

    </main>
</div>

</body>
</html>
