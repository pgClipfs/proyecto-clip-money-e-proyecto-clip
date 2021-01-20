package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class TipoPlazoFijo {
	@Id
	@GeneratedValue
	private Integer id;
	@NotNull
	private String nombre;
	@NotNull
	private Integer plazoMinimoDias;
	@NotNull
	private Float interesAnual;
	@NotNull
	private Float montoMinimo;
	@ManyToOne
	@NotNull
	private Moneda moneda;
}
