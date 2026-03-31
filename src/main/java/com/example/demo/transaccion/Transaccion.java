package com.example.demo.transaccion;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import com.example.demo.usuario.Usuario;

public class Transaccion {

    private int id;
    private Usuario usuario; // Composición: aquí anidamos tu modelo Usuario
    private BigDecimal monto;
    private String tipoTransaccion;
    private String descripcion;
    private LocalDateTime fechaTransaccion;

    public Transaccion() {}

    public Transaccion(int id, Usuario usuario, BigDecimal monto, String tipoTransaccion,
                       String descripcion, LocalDateTime fechaTransaccion) {
        this.id = id;
        this.usuario = usuario;
        this.monto = monto;
        this.tipoTransaccion = tipoTransaccion;
        this.descripcion = descripcion;
        this.fechaTransaccion = fechaTransaccion;
    }

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }

    public BigDecimal getMonto() { return monto; }
    public void setMonto(BigDecimal monto) { this.monto = monto; }

    public String getTipoTransaccion() { return tipoTransaccion; }
    public void setTipoTransaccion(String tipoTransaccion) { this.tipoTransaccion = tipoTransaccion; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public LocalDateTime getFechaTransaccion() { return fechaTransaccion; }
    public void setFechaTransaccion(LocalDateTime fechaTransaccion) { this.fechaTransaccion = fechaTransaccion; }
}