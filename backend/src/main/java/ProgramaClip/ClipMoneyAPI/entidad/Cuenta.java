package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class Cuenta {
	@Id
	@GeneratedValue
	private Long nro_cuenta;
	@Column(unique = true)
	private String cvu;
	private Float saldo;
	@ManyToOne
	private Moneda moneda;
}
