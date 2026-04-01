package com.example.demo.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import com.example.demo.usuario.Usuario;
import com.example.demo.usuario.UsuarioService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final UsuarioService usuarioService;

    public LoginController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // Mostrar formulario
    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    // Procesar formulario
    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        try {
            Usuario u = usuarioService.buscarPorUsername(username);

            // ... (resto de tus validaciones de password) ...

            return "redirect:/transacciones/list";

        } catch (org.springframework.dao.EmptyResultDataAccessException e) {
            // Este error ocurre específicamente cuando el username NO existe en la tabla
            model.addAttribute("error", "El usuario '" + username + "' no existe en la base de datos.");
            return "login";
        } catch (Exception e) {
            // Esto imprimirá en tu consola de VS Code el error real (permisos, red, etc.)
            e.printStackTrace();
            model.addAttribute("error", "Error de conexión o base de datos: " + e.getMessage());
            return "login";
        }
    }

    // CERRAR SESIÓN
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
