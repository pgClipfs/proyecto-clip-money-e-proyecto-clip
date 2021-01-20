package ProgramaClip.ClipMoneyAPI.controlador;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ProgramaClip.ClipMoneyAPI.entidad.Factura;
import ProgramaClip.ClipMoneyAPI.servicio.FacturaServicio;

@RestController
@RequestMapping("/factura/")
public class FacturaControlador {
	@Autowired
	private FacturaServicio servicio;
	
	@GetMapping
	public Page<Factura> listarTodas(Pageable pageable) {
		return this.servicio.listarTodas(pageable);
	}
	
	@GetMapping(params = "idUsuario")
	public List<Factura> getFacturasPorIdUsuario(Long idUsuario) {
		return this.servicio.getFacturasPorIdUsuario(idUsuario);
	}
	
	@GetMapping(params = "nickUsuario")
	public List<Factura> getFacturasPorNickUsuario(String nickUsuario) {
		return this.servicio.getFacturasPorNickUsuario(nickUsuario);
	}
	
	@GetMapping(params = "dniUsuario")
	public List<Factura> getFacturasPorDniUsuario(Integer dniUsuario) {
		return this.servicio.getFacturasPorDniUsuario(dniUsuario);
	}
	
	@GetMapping(params = {"idUsuario", "fechaInicioPlazo"})
	public List<Factura> getFacturasPorIdUsuarioYPrimerVencimientoDespuesDeFecha(Long idUsuario, Date fechaInicioPlazo) {
		return this.servicio.getFacturasPorIdUsuarioYPrimerVencimientoDespuesDeFecha(idUsuario, fechaInicioPlazo);
	}
	
	@GetMapping(params = {"nickUsuario", "fechaInicioPlazo"})
	public List<Factura> getFacturasPorNickUsuarioYPrimerVencimientoDespuesDeFecha(String nickUsuario, Date fechaInicioPlazo) {
		return this.servicio.getFacturasPorNickUsuarioYPrimerVencimientoDespuesDeFecha(nickUsuario, fechaInicioPlazo);
	}
	
	@GetMapping(params = {"dniUsuario", "fechaInicioPlazo"})
	public List<Factura> getFacturasPorDniUsuarioYPrimerVencimientoDespuesDeFecha(Integer dniUsuario, Date fechaInicioPlazo) {
		return this.servicio.getFacturasPorDniUsuarioYPrimerVencimientoDespuesDeFecha(dniUsuario, fechaInicioPlazo);
	}
	
	@GetMapping(params = {"idUsuario", "fechaFinPlazo"})
	public List<Factura> getFacturasPorIdUsuarioYPrimerVencimientoAntesDeFecha(Long idUsuario, Date fechaFinPlazo) {
		return this.servicio.getFacturasPorIdUsuarioYPrimerVencimientoAntesDeFecha(idUsuario, fechaFinPlazo);
	}
	
	@GetMapping(params = {"nickUsuario", "fechaFinPlazo"})
	public List<Factura> getFacturasPorNickUsuarioYPrimerVencimientoAntesDeFecha(String nickUsuario, Date fechaFinPlazo) {
		return this.servicio.getFacturasPorNickUsuarioYPrimerVencimientoAntesDeFecha(nickUsuario, fechaFinPlazo);
	}
	
	@GetMapping(params = {"dniUsuario", "fechaFinPlazo"})
	public List<Factura> getFacturasPorDniUsuarioYPrimerVencimientoAntesDeFecha(Integer dniUsuario, Date fechaFinPlazo) {
		return this.servicio.getFacturasPorDniUsuarioYPrimerVencimientoAntesDeFecha(dniUsuario, fechaFinPlazo);
	}
	
	@GetMapping(params = {"idUsuario", "fechaInicioPlazo", "fechaFinPlazo"})
	public List<Factura> getFacturasPorIdUsuarioYPlazoPrimerVencimiento(Long idUsuario, Date fechaInicioPlazo, Date fechaFinPlazo) {
		return this.servicio.getFacturasPorIdUsuarioYPlazoPrimerVencimiento(idUsuario, fechaInicioPlazo, fechaFinPlazo);
	}
	
	@GetMapping(params = {"nickUsuario", "fechaInicioPlazo", "fechaFinPlazo"})
	public List<Factura> getFacturasPorNickUsuarioYPlazoPrimerVencimiento(String nickUsuario, Date fechaInicioPlazo, Date fechaFinPlazo) {
		return this.servicio.getFacturasPorNickUsuarioYPlazoPrimerVencimiento(nickUsuario, fechaInicioPlazo, fechaFinPlazo);
	}
	
	@GetMapping(params = {"dniUsuario", "fechaInicioPlazo", "fechaFinPlazo"})
	public List<Factura> getFacturasPorDniUsuarioYPlazoPrimerVencimiento(Integer dniUsuario, Date fechaInicioPlazo, Date fechaFinPlazo) {
		return this.servicio.getFacturasPorDniUsuarioYPlazoPrimerVencimiento(dniUsuario, fechaInicioPlazo, fechaFinPlazo);
	}
}
