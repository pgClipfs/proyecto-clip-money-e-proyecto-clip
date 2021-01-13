package ProgramaClip.ClipMoneyAPI.servicio;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ProgramaClip.ClipMoneyAPI.entidad.Operacion;
import ProgramaClip.ClipMoneyAPI.entidad.Usuario;
import ProgramaClip.ClipMoneyAPI.repositorio.OperacionRepositorio;

@Service
public class OperacionServicio {
	@Autowired
	private OperacionRepositorio repositorio;
	@Autowired
	private UsuarioServicio usuarioServicio;

	public Page<Operacion> listarTodas(Pageable pageable) {
		return this.repositorio.findAll(pageable);
	}
	
	public List<Operacion> getOperacionesPorIdUsuario(Long idUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorId(idUsuario);

		return this.getOperacionesUsuario(usuario);
	} 
	
	public List<Operacion> getOperacionesPorNickUsuario(String nickUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return this.getOperacionesUsuario(usuario);
	}
	
	public List<Operacion> getOperacionesPorDniUsuario(Integer dniUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);
		
		return this.getOperacionesUsuario(usuario);
	}

	public List<Operacion> getOperacionesUsuario(Usuario usuario) {
		List<Operacion> operaciones = new ArrayList<>();
		
		usuario.getCuentas().forEach((c) -> {
			operaciones.addAll(this.repositorio.findByCuenta(c));
		});
		
		return operaciones;
	}
	
	public Page<Operacion> getOperacionesPorNroCuenta(Long nroCuenta, Pageable pageable) {
		return this.repositorio.findByCuenta_NroCuenta(nroCuenta, pageable);
	}
	
	public Page<Operacion> getOperacionesPorCvuCuenta(String cvuCuenta, Pageable pageable) {
		return this.repositorio.findByCuenta_Cvu(cvuCuenta, pageable);
	}
	
	public List<Operacion> getUltimasOperacionesCuenta(Long nroCuenta) {
		return this.repositorio.findLast10ByCuenta_NroCuenta(nroCuenta);
	}

	public List<Operacion> getOperacionesCuentaEnPlazo(Long nroCuenta, Date fechaInicioPlazo, Date fechaFinPlazo) {
		List<Operacion> operaciones = this.repositorio.findByCuenta_NroCuenta(nroCuenta);
		List<Operacion> operacionesEnPlazo = new ArrayList<>();
		
		operaciones.forEach((o) -> {
			if (o.getFecha().after(fechaInicioPlazo) && o.getFecha().before(fechaFinPlazo)) {
				operacionesEnPlazo.add(o);
			}
		});
		
		return operacionesEnPlazo;
	}

	public List<Operacion> getOperacionesCuentaAntesDeFecha(Long nroCuenta, Date fechaFinPlazo) {
		List<Operacion> operaciones = this.repositorio.findByCuenta_NroCuenta(nroCuenta);
		List<Operacion> operacionesEnPlazo = new ArrayList<>();
		
		operaciones.forEach((o) -> {
			if (o.getFecha().before(fechaFinPlazo)) {
				operacionesEnPlazo.add(o);
			}
		});
		
		return operacionesEnPlazo;
	}
	
	public List<Operacion> getOperacionesCuentaDespuesDeFecha(Long nroCuenta, Date fechaInicioPlazo) {
		List<Operacion> operaciones = this.repositorio.findByCuenta_NroCuenta(nroCuenta);
		List<Operacion> operacionesEnPlazo = new ArrayList<>();
		
		operaciones.forEach((o) -> {
			if (o.getFecha().after(fechaInicioPlazo)) {
				operacionesEnPlazo.add(o);
			}
		});
		
		return operacionesEnPlazo;
	}
	
	public Operacion crearOperacion(Operacion operacion) {
		return this.repositorio.save(operacion);		
	}

	public Operacion editarOperacion(Operacion operacion) {
		return this.repositorio.save(operacion);
	}

	public void borrarOperacion(Long id) {
		Optional<Operacion> operacion = this.repositorio.findById(id);
		
		if (operacion.isPresent()) {
			this.repositorio.delete(operacion.get());
		}
	}
}
