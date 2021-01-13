package ProgramaClip.ClipMoneyAPI.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ProgramaClip.ClipMoneyAPI.entidad.Usuario;
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

	@PostMapping
	public Usuario crearUsuario(@RequestBody Usuario usuario) {
		return this.servicio.crearUsuario(usuario);
	}
	
	@PutMapping
	public Usuario editarUsuario(@RequestBody Usuario usuario) {
		// TODO: Crear datos usuario
		return this.servicio.editarUsuario(usuario);
	}
	
	@DeleteMapping(params = "id")
	public void borrarUsuario (Long id) {
		this.servicio.borrarUsuario(id);
	}
}
