package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class TipoPlazoFijo {
	@Id
	@GeneratedValue
	private Integer id;
	private String nombre;
	private Integer plazoMinimoEnDias;
	private Float interesAnual;
	private Float montoMinimo;
	@ManyToOne
	private Moneda moneda;
}
