package ProgramaClip.ClipMoneyAPI.entidad;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class Factura {
	@Id
	@GeneratedValue
	private Long id;
	private Long nroFactura;
	private Float monto;
	private Date fechaPrimerVencimiento;
	private Date fechaSegundoVencimiento;
	private Float montoPrimerVencimiento;
	private Float montoSegundoVencimiento;
	private Date fechaPago;
	private Time horaPago;
	@ManyToOne
	private Servicio servicio;
	@ManyToOne
	private Cuenta cuenta;
	@ManyToOne
	private EstadoFactura estado;
}
