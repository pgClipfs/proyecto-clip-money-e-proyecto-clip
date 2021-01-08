package ProgramaClip.ClipMoneyAPI.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;

public interface CuentaRepositorio extends JpaRepository<Cuenta, Long> {
	
}
