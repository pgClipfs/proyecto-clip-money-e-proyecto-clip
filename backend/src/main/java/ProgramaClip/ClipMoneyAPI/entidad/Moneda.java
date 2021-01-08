package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class Moneda {
	@Id
	@GeneratedValue
	private Integer id;
	@NotNull
	private String nombre;
	@NotNull
	private Float valorDolares;
}
