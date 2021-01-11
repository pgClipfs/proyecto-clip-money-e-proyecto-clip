package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class Cuenta {
	@Id
	@GeneratedValue
	private Long nroCuenta;
	@Column(unique = true)
	@NotNull
	private String cvu;
	@NotNull
	private Float saldo;
	@ManyToOne
	@NotNull
	private Moneda moneda;
}
