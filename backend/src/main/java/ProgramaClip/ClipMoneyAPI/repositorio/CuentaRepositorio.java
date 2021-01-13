package ProgramaClip.ClipMoneyAPI.repositorio;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;

@Repository
public interface CuentaRepositorio extends JpaRepository<Cuenta, Long> {
	public Optional<Cuenta> findByCvu(String cvu);
}
