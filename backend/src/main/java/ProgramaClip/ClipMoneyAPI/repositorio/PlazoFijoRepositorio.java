package ProgramaClip.ClipMoneyAPI.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ProgramaClip.ClipMoneyAPI.entidad.Cuenta;
import ProgramaClip.ClipMoneyAPI.entidad.PlazoFijo;

@Repository
public interface PlazoFijoRepositorio extends JpaRepository<PlazoFijo, Long> {
	public List<PlazoFijo> findByCuenta(Cuenta cuenta);
}
