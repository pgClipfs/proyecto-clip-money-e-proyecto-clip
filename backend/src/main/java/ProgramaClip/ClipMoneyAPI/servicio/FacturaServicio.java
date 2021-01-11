package ProgramaClip.ClipMoneyAPI.servicio;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ProgramaClip.ClipMoneyAPI.entidad.Factura;
import ProgramaClip.ClipMoneyAPI.entidad.Usuario;
import ProgramaClip.ClipMoneyAPI.repositorio.FacturaRepositorio;

@Service
public class FacturaServicio {
	@Autowired
	private FacturaRepositorio repositorio;
	@Autowired
	private UsuarioServicio usuarioServicio;

	public Page<Factura> listarTodas(Pageable pageable) {
		return this.repositorio.findAll(pageable);			
	}

	public List<Factura> getFacturasPorIdUsuario(Long idUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorId(idUsuario);
		
		return usuario.getFacturas();
	} 
	
	public List<Factura> getFacturasPorNickUsuario(String nickUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return usuario.getFacturas();
	}
	
	public List<Factura> getFacturasPorDniUsuario(Integer dniUsuario) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);
		
		return usuario.getFacturas();
	}
	
	public List<Factura> getFacturasPorIdUsuarioYPlazoPrimerVencimiento(Long idUsuario, Date fechaInicioPlazo, Date fechaFinPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorId(idUsuario);

		return this.getFacturasPlazoPrimerVencimiento(usuario.getFacturas(), fechaInicioPlazo, fechaFinPlazo);
	}

	public List<Factura> getFacturasPorNickUsuarioYPlazoPrimerVencimiento(String nickUsuario, Date fechaInicioPlazo, Date fechaFinPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return this.getFacturasPlazoPrimerVencimiento(usuario.getFacturas(), fechaInicioPlazo, fechaFinPlazo);
	}

	public List<Factura> getFacturasPorDniUsuarioYPlazoPrimerVencimiento(Integer dniUsuario, Date fechaInicioPlazo, Date fechaFinPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);

		return this.getFacturasPlazoPrimerVencimiento(usuario.getFacturas(), fechaInicioPlazo, fechaFinPlazo);
	}
	
	public List<Factura> getFacturasPlazoPrimerVencimiento(List<Factura> facturas, Date fechaInicioPlazo, Date fechaFinPlazo) {
		List<Factura> facturasEnPlazo = new ArrayList<Factura>();
		
		facturas.forEach((f) -> {
			if (f.getFechaPrimerVencimiento().after(fechaInicioPlazo) && f.getFechaPrimerVencimiento().before(fechaFinPlazo)) {
				facturasEnPlazo.add(f);
			}
		});
		
		return facturasEnPlazo;
	}
	
	public List<Factura> getFacturasPrimerVencimientoDespuesDeFecha(List<Factura> facturas, Date fechaInicioPlazo) {
		List<Factura> facturasEnPlazo = new ArrayList<Factura>();
		
		facturas.forEach((f) -> {
			if (f.getFechaPrimerVencimiento().after(fechaInicioPlazo)) {
				facturasEnPlazo.add(f);
			}
		});
		
		return facturasEnPlazo;
	}
	
	public List<Factura> getFacturasPrimerVencimientoAntesDeFecha(List<Factura> facturas, Date fechaFinPlazo) {
		List<Factura> facturasEnPlazo = new ArrayList<Factura>();
		
		facturas.forEach((f) -> {
			if (f.getFechaPrimerVencimiento().before(fechaFinPlazo)) {
				facturasEnPlazo.add(f);
			}
		});
		
		return facturasEnPlazo;
	}

	public List<Factura> getFacturasPorIdUsuarioYPrimerVencimientoDespuesDeFecha(Long idUsuario,
			Date fechaInicioPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorId(idUsuario);
		
		return this.getFacturasPrimerVencimientoDespuesDeFecha(usuario.getFacturas(), fechaInicioPlazo);
	}

	public List<Factura> getFacturasPorNickUsuarioYPrimerVencimientoDespuesDeFecha(String nickUsuario,
			Date fechaInicioPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return this.getFacturasPrimerVencimientoDespuesDeFecha(usuario.getFacturas(), fechaInicioPlazo);
	}

	public List<Factura> getFacturasPorDniUsuarioYPrimerVencimientoDespuesDeFecha(Integer dniUsuario,
			Date fechaInicioPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);
		
		return this.getFacturasPrimerVencimientoDespuesDeFecha(usuario.getFacturas(), fechaInicioPlazo);
	}

	public List<Factura> getFacturasPorIdUsuarioYPrimerVencimientoAntesDeFecha(Long idUsuario, Date fechaFinPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorId(idUsuario);
		
		return this.getFacturasPrimerVencimientoAntesDeFecha(usuario.getFacturas(), fechaFinPlazo);
	}

	public List<Factura> getFacturasPorNickUsuarioYPrimerVencimientoAntesDeFecha(String nickUsuario,
			Date fechaFinPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorNick(nickUsuario);
		
		return this.getFacturasPrimerVencimientoAntesDeFecha(usuario.getFacturas(), fechaFinPlazo);
	}

	public List<Factura> getFacturasPorDniUsuarioYPrimerVencimientoAntesDeFecha(Integer dniUsuario,
			Date fechaFinPlazo) {
		Usuario usuario = this.usuarioServicio.getUsuarioPorDni(dniUsuario);
		
		return this.getFacturasPrimerVencimientoAntesDeFecha(usuario.getFacturas(), fechaFinPlazo);
	}
}
