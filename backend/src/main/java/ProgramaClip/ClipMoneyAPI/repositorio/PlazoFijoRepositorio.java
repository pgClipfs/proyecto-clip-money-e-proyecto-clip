package ProgramaClip.ClipMoneyAPI.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;
import ProgramaClip.ClipMoneyAPI.entidad.PlazoFijo;

public interface PlazoFijoRepositorio extends JpaRepository<PlazoFijo, Long> {
	public List<PlazoFijo> findByCuenta(Cuenta cuenta);
}
