<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Transacciones - Historial</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>

<body>

<div class="contenedor">

    <jsp:include page="/WEB-INF/views/barra-lateral.jsp" />

    <main class="principal">

        <header class="encabezado">
            <h1>Historial de Transacciones</h1>
        </header>

        <div class="flex justificar-entre items-centrado mb-2">
            <h2>Listado de Movimientos</h2>

            <a href="${pageContext.request.contextPath}/transacciones/crear"
               class="boton boton-primario">
                + Nueva Transacción
            </a>
        </div>

        <div class="tarjeta">

            <table class="tabla">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Fecha</th>
                        <th>Usuario</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th class="texto-derecha">Monto</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="t" items="${transacciones}">

                    <tr>
                        <td><strong>${t.id}</strong></td>
                        <td>${t.fechaTransaccion}</td>
                        <td>${t.usuario.nombreCompleto}</td>
                        <td>
                            <span class="etiqueta">${t.tipoTransaccion}</span>
                        </td>
                        <td>${t.descripcion}</td>
                        <td class="texto-derecha">
                            <strong>$ ${t.monto}</strong>
                        </td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>

        </div>

    </main>
</div>

</body>
</html>