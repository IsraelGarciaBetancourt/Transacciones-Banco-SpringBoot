package com.example.demo.transaccion;

import java.util.List;

public interface TransaccionService {
    List<Transaccion> listar();
    void guardar(Transaccion t);
}