package ProgramaClip.ClipMoneyAPI.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ProgramaClip.ClipMoneyAPI.servicio.UsuarioServicio;

@RestController
@RequestMapping("/usuario/")
public class UsuarioControlador {
	@Autowired
	private UsuarioServicio servicio;
	
	@GetMapping(value = "login", params = {"nick", "contrasena"})
	public boolean login(String nick, String contrasena) {
		return this.servicio.login(nick, contrasena);
	}

}
