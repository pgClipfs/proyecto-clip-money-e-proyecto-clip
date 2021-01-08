package ProgramaClip.ClipMoneyAPI.controlador;


import java.util.Optional;

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

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;
import ProgramaClip.ClipMoneyAPI.servicio.CuentaServicio;

@RestController
@RequestMapping("/cuenta/")
public class CuentaControlador {
	@Autowired
	private CuentaServicio servicio;
	
	@GetMapping
	public Page<Cuenta> listarTodas(Pageable pageable) {
		return this.servicio.listarTodas(pageable);
	}
	
	@GetMapping(params = "id")
	public Optional<Cuenta> getCuentaPorId(Long id) {
		return this.servicio.getCuentaPorId(id);
	}
	
	@PostMapping
	public Cuenta crearCuenta(@RequestBody Cuenta cuenta) {
		return this.servicio.crearCuenta(cuenta);
	}
	
	@PutMapping
	public Cuenta  editarCuenta(@RequestBody Cuenta cuenta) {
		return this.servicio.editarCuenta(cuenta);
	}
	
	@DeleteMapping(params = "id")
	public void borrarCuenta(Long id) {
		this.servicio.borrarCuenta(id);
	}
}
