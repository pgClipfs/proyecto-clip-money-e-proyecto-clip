package ProgramaClip.ClipMoneyAPI.entidad;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class PlazoFijo {
	@Id
	@GeneratedValue
	private Long id;
	private Date fechaCreacion;
	private Time horaCreacion;
	private Date fechaInicioPlazo;
	private Date fechaFinPlazo;
	private Float interesAnual;
	private Float monto;
	@ManyToOne
	private Cuenta cuenta;
	@ManyToOne
	private TipoPlazoFijo tipo;
}
