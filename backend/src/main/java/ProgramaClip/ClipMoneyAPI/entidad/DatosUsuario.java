package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class DatosUsuario {
	@Id
	@GeneratedValue
	private Long id;
	@NotNull
	private Integer dni;
	@NotNull
	private String nombres;
	@NotNull
	private String apellidos;
	@NotNull
	private String email;
	private String telefono;
	private String direccion;
	@NotNull
	private String codigoPostal;
	@ManyToOne
	@NotNull
	private Localidad localidad;
}
