package ProgramaClip.ClipMoneyAPI.controlador;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ProgramaClip.ClipMoneyAPI.entidad.Operacion;
import ProgramaClip.ClipMoneyAPI.servicio.OperacionServicio;

@RestController
@RequestMapping("/operacion/")
public class OperacionControlador {
	@Autowired
	private OperacionServicio servicio;
	
	@GetMapping
	public Page<Operacion> listarTodas(Pageable pageable) {
		return this.servicio.listarTodas(pageable);
	}
	
	@GetMapping(params = "idUsuario")
	public List<Operacion> getOperacionesPorIdUsuario(Long idUsuario) {
		return this.servicio.getOperacionesPorIdUsuario(idUsuario);
	}
	
	@GetMapping(params = "nickUsuario")
	public List<Operacion> getOperacionesPorNickUsuario(String nickUsuario) {
		return this.servicio.getOperacionesPorNickUsuario(nickUsuario);
	}
	
	@GetMapping(params = "dniUsuario")
	public List<Operacion> getOperacionesPorDniUsuario(Integer dniUsuario) {
		return this.servicio.getOperacionesPorDniUsuario(dniUsuario);
	}
	
	@GetMapping(params = "nroCuenta")
	public Page<Operacion> getOperacionesPorNroCuenta(Long nroCuenta, Pageable pageable) {
		return this.servicio.getOperacionesPorNroCuenta(nroCuenta, pageable);
	}
	
	@GetMapping(params = "cvuCuenta")
	public Page<Operacion> getOperacionesPorCvuCuenta(String cvuCuenta, Pageable pageable) {
		return this.servicio.getOperacionesPorCvuCuenta(cvuCuenta, pageable);
	}
	
	@GetMapping(value = "ultimas-operaciones/", params = "nroCuenta")
	public List<Operacion> getUltimasOperacionesCuenta(Long nroCuenta) {
		return this.servicio.getUltimasOperacionesCuenta(nroCuenta);
	}
	
	@GetMapping(params = {"nroCuenta", "fechaInicioPlazo", "fechaFinPlazo"})
	public List<Operacion> getOperacionesCuentaEnPlazo(Long nroCuenta, Date fechaInicioPlazo, Date fechaFinPlazo) {
		return this.servicio.getOperacionesCuentaEnPlazo(nroCuenta, fechaInicioPlazo, fechaFinPlazo);
	}
	
	@GetMapping(params = {"nroCuenta", "fechaInicioPlazo"})
	public List<Operacion> getOperacionesCuentaDespuesDeFecha(Long nroCuenta, Date fechaInicioPlazo) {
		return this.servicio.getOperacionesCuentaDespuesDeFecha(nroCuenta, fechaInicioPlazo);
	}
	
	@GetMapping(params = {"nroCuenta", "fechaFinPlazo"})
	public List<Operacion> getOperacionesCuentaAntesDeFecha(Long nroCuenta, Date fechaFinPlazo) {
		return this.servicio.getOperacionesCuentaAntesDeFecha(nroCuenta, fechaFinPlazo);
	}
	
	@PostMapping
	public Operacion crearOperacion(@RequestBody Operacion operacion) {
		return this.servicio.crearOperacion(operacion);
	}
	
	@PutMapping
	public Operacion editarOperacion(@RequestBody Operacion operacion) {
		return this.servicio.editarOperacion(operacion);
	}
	
	@DeleteMapping(params = "id")
	public void borrarOperacion(Long id) {
		this.servicio.borrarOperacion(id);
	}
}
