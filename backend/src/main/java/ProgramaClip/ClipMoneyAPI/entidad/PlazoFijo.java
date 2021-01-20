package ProgramaClip.ClipMoneyAPI.entidad;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class PlazoFijo {
	@Id
	@GeneratedValue
	private Long id;
	@NotNull
	private Timestamp fechaHoraCreacion;
	@NotNull
	private Date fechaInicioPlazo;
	@NotNull
	private Date fechaFinPlazo;
	@NotNull
	private Float interesAnual;
	@NotNull
	private Float monto;
	@ManyToOne
	@NotNull
	private Cuenta cuenta;
	@ManyToOne
	@NotNull
	private TipoPlazoFijo tipoPlazoFijo;
}
