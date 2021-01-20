package ProgramaClip.ClipMoneyAPI.entidad;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import com.sun.istack.NotNull;

@Entity
@Data
public class Servicio {
	@Id
	@GeneratedValue
	private Long id;
	@NotNull
	private String razonSocial;
	@Column(unique = true)
	@NotNull
	private Long cuit;
}
