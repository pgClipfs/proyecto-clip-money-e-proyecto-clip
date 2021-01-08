package ProgramaClip.ClipMoneyAPI.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;
import ProgramaClip.ClipMoneyAPI.entidad.Usuario;
import ProgramaClip.ClipMoneyAPI.repositorio.CuentaRepositorio;

@Service
public class CuentaServicio {
	@Autowired
	private CuentaRepositorio repositorio;
	@Autowired
	private UsuarioServicio usuarioServicio;
	
	public Page<Cuenta> listarTodas(Pageable pageable) {
		return this.repositorio.findAll(pageable);
	}
	
	public Optional<Cuenta> getCuentaPorId(Long id) {
		return this.repositorio.findById(id);
	}

	public Optional<Cuenta> getCuentaPorCvu(String cvu) {
		return this.repositorio.findByCvu(cvu);
	}

	public List<Cuenta> getCuentasPorNickUsuario(String nickUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return usuario.getCuentas();
	}

	public List<Cuenta> getCuentasPorDniUsuario(Integer dniUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);
		
		return usuario.getCuentas();
	}

	public Cuenta crearCuenta(Cuenta cuenta) {
		return this.repositorio.save(cuenta);		
	}

	public Cuenta editarCuenta(Cuenta cuenta) {
		return this.repositorio.save(cuenta);
	}

	public void borrarCuenta(Long id) {
		Cuenta cuenta = this.getCuentaPorId(id).get();
		
		this.repositorio.delete(cuenta);
	}
}
