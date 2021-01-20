package ProgramaClip.ClipMoneyAPI.entidad;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class Operacion {
	@Id
	@GeneratedValue
	private Long id;
	@NotNull
	private Float monto;
	@NotNull
	private Timestamp fechaHora;
	@ManyToOne
	private Cuenta cuentaOrigen;
	@ManyToOne
	@NotNull
	private Cuenta cuentaDestino;
}
