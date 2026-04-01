<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Banco SpringBoot</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="contenedor centro-pantalla">

<div class="tarjeta" style="max-width: 420px; width:100%; padding: 3rem 2rem;">

    <div class="texto-centrado mb-2">
        <h2 class="titulo-degradado" style="font-size: 2.5rem; margin-bottom: 0.5rem;">Banco App</h2>
        <p style="color: var(--texto-apagado);">Inicia sesión para continuar</p>
    </div>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="grupo-formulario">
            <label>Usuario</label>
            <input type="text" name="username" class="control-formulario" placeholder="Ej. administrador" required>
        </div>

        <div class="grupo-formulario">
            <label>Contraseña</label>
            <input type="password" name="password" class="control-formulario" placeholder="••••••••" required>
        </div>

        <c:if test="${not empty error}">
            <div class="alerta alerta-peligro">
                ${error}
            </div>
        </c:if>

        <div class="flex justificar-fin mt-2">
            <button class="boton boton-primario w-100" type="submit" style="padding: 1rem;">Ingresar a mi cuenta</button>
        </div>
    </form>

</div>

</body>
</html>
