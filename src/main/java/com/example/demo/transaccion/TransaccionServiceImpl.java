package com.example.demo.transaccion;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class TransaccionServiceImpl implements TransaccionService {

    private final TransaccionDAO dao;

    // Inyección por constructor tal como lo haces en tu proyecto
    public TransaccionServiceImpl(TransaccionDAO dao) {
        this.dao = dao;
    }

    @Override
    public List<Transaccion> listar() {
        return dao.listar();
    }
}