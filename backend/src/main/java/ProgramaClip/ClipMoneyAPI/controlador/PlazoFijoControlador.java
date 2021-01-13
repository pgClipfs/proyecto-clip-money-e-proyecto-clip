package ProgramaClip.ClipMoneyAPI.controlador;

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
import ProgramaClip.ClipMoneyAPI.entidad.PlazoFijo;
import ProgramaClip.ClipMoneyAPI.servicio.PlazoFijoServicio;

@RestController
@RequestMapping("/plazo-fijo/")
public class PlazoFijoControlador {
	@Autowired
	private PlazoFijoServicio servicio;
	
	@GetMapping
	public Page<PlazoFijo> listarTodos(Pageable pageable) {
		return this.servicio.listarTodos(pageable);
	}
	
	@GetMapping(params = "idUsuario")
	public List<PlazoFijo> getPlazosFijosPorIdUsuario(Long idUsuario) {
		return this.servicio.getPlazosFijoPorIdUsuario(idUsuario);
	}
	
	@GetMapping(params = "nickUsuario")
	public List<PlazoFijo> getPlazosFijosPorNickUsuario(String nickUsuario) {
		return this.servicio.getPlazosFijosPorNickUsuario(nickUsuario);
	}
	
	@GetMapping(params = "dniUsuario")
	public List<PlazoFijo> getPlazosFijosPorDniUsuario(Integer dniUsuario) {
		return this.servicio.getPlazosFijosPorDniUsuario(dniUsuario);
	}

	@PostMapping
	public PlazoFijo crearPlazoFijo(@RequestBody PlazoFijo plazoFijo) {
		return this.servicio.crearPlazoFijo(plazoFijo);
	}
	
	@PutMapping
	public PlazoFijo editarPlazoFijo(@RequestBody PlazoFijo plazoFijo) {
		return this.servicio.editarPlazoFijo(plazoFijo);
	}
	
	@DeleteMapping(params = "id")
	public void borrarPlazoFijo(Long id) {
		this.servicio.borrarPlazoFijo(id);
	}
}
