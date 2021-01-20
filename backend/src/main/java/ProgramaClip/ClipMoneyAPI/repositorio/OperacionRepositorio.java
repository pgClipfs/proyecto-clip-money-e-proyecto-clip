package ProgramaClip.ClipMoneyAPI.repositorio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;
import ProgramaClip.ClipMoneyAPI.entidad.Operacion;

@Repository
public interface OperacionRepositorio extends JpaRepository<Operacion, Long> {
	public List<Operacion> findByCuentaOrigenOrCuentaDestino(Cuenta cuentaOrigen, Cuenta cuentaDestino);
	public List<Operacion> findByCuentaOrigen_NroCuentaOrCuentaDestino_NroCuenta(Long cuentaOrigen_nroCuenta, Long cuentaDestino_nroCuenta);
	public Page<Operacion> findByCuentaOrigen_NroCuentaOrCuentaDestino_NroCuenta(Long cuentaOrigen_nroCuenta, Long cuentaDestino_nroCuenta, Pageable pageable);
	public Page<Operacion> findByCuentaOrigen_CvuOrCuentaDestino_Cvu(String cuentaOrigen_cvu, String cuentaDestino_cvu, Pageable pageable);
	public List<Operacion> findByCuentaOrigen_NroCuentaOrCuentaDestino_NroCuentaOrderByFechaHora(Long cuentaOrigen_nroCuenta, Long cuentaDestino_nroCuenta);
}
