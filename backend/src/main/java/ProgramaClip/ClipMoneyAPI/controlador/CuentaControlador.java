package ProgramaClip.ClipMoneyAPI.controlador;


import java.util.List;
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
	
	@GetMapping(params = "cvu")
	public Optional<Cuenta> getCuentaPorCvu(String cvu) {
		return this.servicio.getCuentaPorCvu(cvu);
	}
	
	@GetMapping(params = "idUsuario")
	public List<Cuenta> getCuentasPorIdUsuario(Long idUsuario) {
		return this.servicio.getCuentasPorIdUsuario(idUsuario);
	}
	
	@GetMapping(params = "nickUsuario")
	public List<Cuenta> getCuentasPorNickUsuario(String nickUsuario) {
		return this.servicio.getCuentasPorNickUsuario(nickUsuario);
	}
	
	@GetMapping(params = "dniUsuario")
	public List<Cuenta> getCuentasPorDniUsuario(Integer dniUsuario) {
		return this.servicio.getCuentasPorDniUsuario(dniUsuario);
	}
	
	@GetMapping(params = {"idUsuario", "idMoneda"})
	public List<Cuenta> getCuentasPorIdUsuarioEIdMoneda(Long idUsuario, Integer idMoneda) {
		return this.servicio.getCuentasPorIdUsuarioEIdMoneda(idUsuario, idMoneda);
	}
	
	@GetMapping(params = {"nickUsuario", "idMoneda"})
	public List<Cuenta> getCuentasPorNickUsuarioEIdMoneda(String nickUsuario, Integer idMoneda) {
		return this.servicio.getCuentasPorNickUsuarioEIdMoneda(nickUsuario, idMoneda);
	}
	
	@GetMapping(params = {"dniUsuario", "nombreMoneda"})
	public List<Cuenta> getCuentasPorDniUsuarioEIdMoneda(Integer dniUsuario, Integer idMoneda) {
		return this.servicio.getCuentasPorDniUsuarioEIdMoneda(dniUsuario, idMoneda);
	}
	
	@PostMapping
	public Cuenta crearCuenta(@RequestBody Cuenta cuenta) {
		return this.servicio.crearCuenta(cuenta);
	}
	
	@PutMapping
	public Cuenta editarCuenta(@RequestBody Cuenta cuenta) {
		return this.servicio.editarCuenta(cuenta);
	}
	
	@DeleteMapping(params = "id")
	public void borrarCuenta(Long id) {
		this.servicio.borrarCuenta(id);
	}
}
