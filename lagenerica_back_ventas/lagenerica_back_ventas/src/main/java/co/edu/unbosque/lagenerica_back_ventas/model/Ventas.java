package co.edu.unbosque.lagenerica_back_ventas.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "db_ventas")
public class Ventas {
	@Id
	private Integer codigo_venta;
	private Integer cedula_cliente;
	private String nombre_cliente;
	private DetalleVentas[] detalle_ventas;
	private Double valor_venta;
	private Double iva_venta;
	private Double total_venta;
	
	public Integer getCodigo_venta() {
		return codigo_venta;
	}
	public void setCodigo_venta(Integer codigo_venta) {
		this.codigo_venta = codigo_venta;
	}
	public Integer getCedula_cliente() {
		return cedula_cliente;
	}
	public void setCedula_cliente(Integer cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}
	public String getNombre_cliente() {
		return nombre_cliente;
	}
	public void setNombre_cliente(String nombre_cliente) {
		this.nombre_cliente = nombre_cliente;
	}
	public DetalleVentas[] getDetalle_ventas() {
		return detalle_ventas;
	}
	public void setDetalle_ventas(DetalleVentas[] detalle_ventas) {
		this.detalle_ventas = detalle_ventas;
	}
	public Double getIva_venta() {
		return iva_venta;
	}
	public void setIva_venta(Double iva_venta) {
		this.iva_venta = iva_venta;
	}
	public Double getValor_venta() {
		return valor_venta;
	}
	public void setValor_venta(Double valor_venta) {
		this.valor_venta = valor_venta;
	}
	public Double getTotal_venta() {
		return total_venta;
	}
	public void setTotal_venta(Double total_venta) {
		this.total_venta = total_venta;
	}
	

}
