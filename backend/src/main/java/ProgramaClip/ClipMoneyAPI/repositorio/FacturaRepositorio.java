package ProgramaClip.ClipMoneyAPI.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ProgramaClip.ClipMoneyAPI.entidad.Factura;

@Repository
public interface FacturaRepositorio extends JpaRepository<Factura, Long>{

}
