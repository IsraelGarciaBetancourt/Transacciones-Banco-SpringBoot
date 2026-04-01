package com.example.demo.transaccion;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;
import com.example.demo.usuario.Usuario;

@Controller
@RequestMapping("/transacciones")
public class TransaccionController {

    private final TransaccionService service;

    public TransaccionController(TransaccionService service) {
        this.service = service;
    }

    @GetMapping("/list")
    public String listar(Model model) {
        model.addAttribute("transacciones", service.listar());
        return "transacciones/transacciones";
    }

    @GetMapping("/nuevo")
    public String nuevo(Model model, HttpSession session) {
        if (session.getAttribute("usuarioId") == null) {
            return "redirect:/login";
        }
        model.addAttribute("transaccion", new Transaccion());
        return "transacciones/nuevo";
    }

    @PostMapping("/nuevo")
    public String guardar(@ModelAttribute Transaccion transaccion, HttpSession session) {
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        if (usuarioId == null) {
            return "redirect:/login";
        }
        
        Usuario usuario = new Usuario();
        usuario.setId(usuarioId);
        transaccion.setUsuario(usuario);
        
        service.guardar(transaccion);
        return "redirect:/transacciones/list";
    }
}