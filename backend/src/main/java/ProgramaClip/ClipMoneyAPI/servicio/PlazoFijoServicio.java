package ProgramaClip.ClipMoneyAPI.servicio;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ProgramaClip.ClipMoneyAPI.entidad.PlazoFijo;
import ProgramaClip.ClipMoneyAPI.entidad.Usuario;
import ProgramaClip.ClipMoneyAPI.repositorio.PlazoFijoRepositorio;

@Service
public class PlazoFijoServicio {
	@Autowired
	private PlazoFijoRepositorio repositorio;
	@Autowired
	private UsuarioServicio usuarioServicio;

	public Page<PlazoFijo> listarTodos(Pageable pageable) {
		return this.repositorio.findAll(pageable);
	}
	
	public List<PlazoFijo> getPlazosFijoPorIdUsuario(Long idUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorId(idUsuario);

		return this.getPlazosFijosUsuario(usuario);
	} 
	
	public List<PlazoFijo> getPlazosFijosPorNickUsuario(String nickUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return this.getPlazosFijosUsuario(usuario);
	}
	
	public List<PlazoFijo> getPlazosFijosPorDniUsuario(Integer dniUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);
		
		return this.getPlazosFijosUsuario(usuario);
	}

	public List<PlazoFijo> getPlazosFijosUsuario(Usuario usuario) {
		List<PlazoFijo> plazosFijos = new ArrayList<>();
		
		usuario.getCuentas().forEach((c) -> {
			plazosFijos.addAll(this.repositorio.findByCuenta(c));
		});
		
		return plazosFijos;
	}
}
