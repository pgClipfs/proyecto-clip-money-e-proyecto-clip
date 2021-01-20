package ProgramaClip.ClipMoneyAPI.entidad;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class Usuario {
	@Id
	@GeneratedValue
	private Long id;
	@Column(unique = true)
	@NotNull
	private String nick;
	@NotNull
	private String contrasena;
	@OneToOne
	@NotNull
	private DatosUsuario datosUsuario;
	@OneToMany
	private List<Factura> facturas;
	@OneToMany
	private List<Cuenta> cuentas;
}
