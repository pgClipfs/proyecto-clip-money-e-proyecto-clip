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
public class Operacion {
	@Id
	@GeneratedValue
	private Long id;
	private Float saldo;
	private Date fecha;
	private Time hora;
	@ManyToOne
	private Cuenta cuentaOrigen;
	@ManyToOne
	private Cuenta cuentaDestino;
}
