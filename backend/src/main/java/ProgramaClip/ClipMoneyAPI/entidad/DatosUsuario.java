package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class DatosUsuario {
	@Id
	@GeneratedValue
	private Long id;
	private Integer dni;
	private String nombres;
	private String apellidos;
	private String email;
	private String telefono;
	private String direccion;
	private String codigoPostal;
	@ManyToOne
	private Localidad localidad;
}
