package ProgramaClip.ClipMoneyAPI.repositorio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;
import ProgramaClip.ClipMoneyAPI.entidad.Operacion;

public interface OperacionRepositorio extends JpaRepository<Operacion, Long>{
	public List<Operacion> findByCuenta(Cuenta cuenta);
	public Page<Operacion> findByCuenta_NroCuenta(Long nroCuenta, Pageable pageable);
	public List<Operacion> findByCuenta_NroCuenta(Long nroCuenta);
	public Page<Operacion> findByCuenta_Cvu(String cvu, Pageable pageable);
	public List<Operacion> findLast10ByCuenta_NroCuenta(Long nroCuenta);
}
