package com.example.demo.transaccion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.usuario.Usuario;

@Repository
public class TransaccionRepository implements TransaccionDAO {

    private final JdbcTemplate jdbc;

    public TransaccionRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    private RowMapper<Transaccion> mapper = new RowMapper<Transaccion>() {
        @Override
        public Transaccion mapRow(ResultSet rs, int rowNum) throws SQLException {

            // 1. Instanciamos tu modelo Usuario completo usando los alias de la consulta SQL
            Usuario usuario = new Usuario(
                    rs.getInt("usuario_id"),
                    rs.getString("u_username"),
                    rs.getString("u_password"),
                    rs.getString("u_nombre_completo"),
                    rs.getString("u_rol"),
                    rs.getBoolean("u_activo"),
                    rs.getTimestamp("u_created_at") != null ? rs.getTimestamp("u_created_at").toLocalDateTime() : null,
                    rs.getTimestamp("u_updated_at") != null ? rs.getTimestamp("u_updated_at").toLocalDateTime() : null
            );

            // 2. Retornamos la Transaccion con el objeto Usuario anidado
            return new Transaccion(
                    rs.getInt("id"),
                    usuario,
                    rs.getBigDecimal("monto"),
                    rs.getString("tipo_transaccion"),
                    rs.getString("descripcion"),
                    rs.getTimestamp("fecha_transaccion") != null ? rs.getTimestamp("fecha_transaccion").toLocalDateTime() : null
            );
        }
    };

    @Override
    public List<Transaccion> listar() {
        // Corregimos u.nombreCompleto por u.nombre_completo y las fechas con guión bajo
        String sql = """
            SELECT t.id, t.usuario_id, t.monto, t.tipo_transaccion, t.descripcion, t.fecha_transaccion,
                   u.username AS u_username, 
                   u.password AS u_password, 
                   u.nombre_completo AS u_nombre_completo, 
                   u.rol AS u_rol, 
                   u.activo AS u_activo, 
                   u.created_at AS u_created_at, 
                   u.updated_at AS u_updated_at
            FROM transacciones t
            JOIN usuarios u ON u.id = t.usuario_id
            ORDER BY t.fecha_transaccion DESC;
        """;

        return jdbc.query(sql, mapper);
    }

    @Override
    public void guardar(Transaccion t) {
        String sql = "INSERT INTO transacciones (usuario_id, monto, tipo_transaccion, descripcion, fecha_transaccion) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";
        jdbc.update(sql, t.getUsuario().getId(), t.getMonto(), t.getTipoTransaccion(), t.getDescripcion());
    }
}