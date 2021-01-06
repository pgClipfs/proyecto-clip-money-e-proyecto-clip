package ProgramaClip.ClipMoneyAPI.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class EstadoFactura {
	@Id
	@GeneratedValue
	private Integer id;
	private String nombre;
}
