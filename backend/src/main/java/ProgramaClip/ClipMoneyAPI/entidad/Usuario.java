package ProgramaClip.ClipMoneyAPI.entidad;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.Data;

@Entity
@Data
public class Usuario {
	@Id
	@GeneratedValue
	private Long id;
	private String nick;
	private String contrasena;
	@OneToOne
	private DatosUsuario datos;
	@OneToMany
	private List<Factura> facturas;
	@OneToMany
	private List<Cuenta> cuentas;
}
