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
            <h1 class="titulo-degradado">Panel de Control</h1>
        </header>

        <div class="flex justificar-entre items-centrado mb-2">
            <h2>Historial de Movimientos</h2>

            <a href="${pageContext.request.contextPath}/transacciones/nuevo" class="boton boton-primario">
                + Nueva Transacción
            </a>
        </div>

        <div class="tarjeta tabla-contenedor">

            <table class="tabla">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Fecha</th>
                        <th>A Nombre De</th>
                        <th>Tipo Operación</th>
                        <th>Descripción</th>
                        <th class="texto-derecha">Monto</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="t" items="${transacciones}">

                    <tr>
                        <td style="color: var(--texto-apagado)">#${t.id}</td>
                        <td style="color: var(--texto-apagado)">${t.fechaTransaccion}</td>
                        <td style="font-weight: 500">${t.usuario.nombreCompleto}</td>
                        <td>
                            <c:choose>
                                <c:when test="${t.tipoTransaccion == 'DEPOSITO'}">
                                    <span class="etiqueta badge-deposito">DEPOSITO</span>
                                </c:when>
                                <c:when test="${t.tipoTransaccion == 'RETIRO'}">
                                    <span class="etiqueta badge-retiro">RETIRO</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="etiqueta badge-transferencia">${t.tipoTransaccion}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td style="color: var(--texto-apagado)">${t.descripcion}</td>
                        <td class="texto-derecha" style="font-weight: 700; font-size: 1.1rem; color: var(--primario);">
                            $ ${t.monto}
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