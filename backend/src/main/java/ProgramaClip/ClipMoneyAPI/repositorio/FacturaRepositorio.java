package ProgramaClip.ClipMoneyAPI.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import ProgramaClip.ClipMoneyAPI.entidad.Factura;

public interface FacturaRepositorio extends JpaRepository<Factura, Long>{

}
