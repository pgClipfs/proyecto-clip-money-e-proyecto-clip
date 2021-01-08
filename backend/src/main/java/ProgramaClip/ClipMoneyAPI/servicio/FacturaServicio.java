package ProgramaClip.ClipMoneyAPI.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ProgramaClip.ClipMoneyAPI.entidad.Factura;
import ProgramaClip.ClipMoneyAPI.repositorio.FacturaRepositorio;

@Service
public class FacturaServicio {
	@Autowired
	private FacturaRepositorio repositorio;

	public Page<Factura> listarTodas(Pageable pageable) {
		return this.repositorio.findAll(pageable);			
	}
	
	
}
