package ProgramaClip.ClipMoneyAPI.entidad;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;

@Entity
@Data
public class Factura {
	@Id
	@GeneratedValue
	private Long id;
	@NotNull
	private Long nroFactura;
	@NotNull
	private Float monto;
	@NotNull
	private Date fechaPrimerVencimiento;
	private Date fechaSegundoVencimiento;
	@NotNull
	private Float montoPrimerVencimiento;
	private Float montoSegundoVencimiento;
	private Date fechaPago;
	private Time horaPago;
	@ManyToOne
	@NotNull
	private Servicio servicio;
	@ManyToOne
	private Cuenta cuentaPago;
	@ManyToOne
	@NotNull
	private EstadoFactura estado;
}
