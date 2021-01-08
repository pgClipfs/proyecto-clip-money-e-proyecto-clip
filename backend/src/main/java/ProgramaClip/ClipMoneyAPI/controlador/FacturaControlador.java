package ProgramaClip.ClipMoneyAPI.controlador;

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
}
