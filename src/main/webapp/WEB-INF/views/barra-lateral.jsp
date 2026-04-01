<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="barra-lateral">

    <div class="marca">
        <div class="avatar flex centro">
             <span>🏦</span>
        </div>
        <span class="titulo-degradado" style="font-size: 1.5rem">Banco App</span>
    </div>

    <div class="insignia-usuario mb-2 mt">
        <div class="avatar flex centro items-centrado" style="width: 32px; height: 32px; font-size: 12px; font-weight: bold;">
            ${sessionScope.username.substring(0, 1).toUpperCase()}
        </div>
        <div>
            <div style="font-weight: 600; font-size: 0.9rem">${sessionScope.nombreUsuario}</div>
            <div style="color: var(--texto-apagado); font-size: 0.75rem;">${sessionScope.rol}</div>
        </div>
    </div>

    <nav style="flex: 1; margin-top: 1.5rem;">
        <a href="${pageContext.request.contextPath}/transacciones/list" class="enlace-nav activo">
            <span style="font-size: 1.2rem;">📊</span> Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/usuarios/list" class="enlace-nav">
            <span style="font-size: 1.2rem;">👥</span> Usuarios
        </a>
        <a href="${pageContext.request.contextPath}/transacciones/nuevo" class="enlace-nav">
            <span style="font-size: 1.2rem;">➕</span> Nueva Transacción
        </a>
    </nav>
    
    <div style="padding-top: 2rem; border-top: 1px solid var(--borde);">
        <a href="${pageContext.request.contextPath}/logout" class="enlace-nav" style="color: #fca5a5;">
            <span style="font-size: 1.2rem;">🚪</span> Cerrar Sesión
        </a>
    </div>

</aside>
