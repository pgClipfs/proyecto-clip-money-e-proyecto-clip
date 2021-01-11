package ProgramaClip.ClipMoneyAPI.servicio;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ProgramaClip.ClipMoneyAPI.entidad.Usuario;
import ProgramaClip.ClipMoneyAPI.repositorio.UsuarioRepositorio;

@Service
public class UsuarioServicio {
	@Autowired
	private UsuarioRepositorio repositorio;	

	public boolean login(String nick, String contrasena) {
		Usuario usuario = this.getUsuarioPorNick(nick);
		
		if (usuario == null) {
			return false;
		}
		
		if (usuario.getContrasena().equals(contrasena)) {
			return true;
		}
		
		return false;
	}
	
	public Usuario getUsuarioPorId(Long nick) {
		Optional<Usuario> usuario = this.repositorio.findById(nick);
		
		if (usuario.isPresent()) {
			return usuario.get();
		} else {
			return null;
		}
	}
	
	public Usuario getUsuarioPorNick(String nick) {
		Optional<Usuario> usuario = this.repositorio.findByNick(nick);
		
		if (usuario.isPresent()) {
			return usuario.get();
		} else {
			return null;
		}
	}

	public Usuario getUsuarioPorDni(Integer dniUsuario) {
		Optional<Usuario> usuario = this.repositorio.findByDatos_Dni(dniUsuario);
		
		if (usuario.isPresent()) {
			return usuario.get();
		} else {
			return null;
		}
	}

}
