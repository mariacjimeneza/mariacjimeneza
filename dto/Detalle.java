package com.tiendavirtual.dto;

public class Detalle {
	private String codigo_venta;
	private String codigo_producto;
	private Float cantidad;
	private Float valor_unitario;
	private Float valor_total;

	public Detalle(String codigo_venta, String codigo_producto, Float cantidad, Float valor_unitario,
			Float valor_total) {
		super();
		this.codigo_venta = codigo_venta;
		this.codigo_producto = codigo_producto;
		this.cantidad = cantidad;
		this.valor_unitario = valor_unitario;
		this.valor_total = valor_total;

	}

	public String getCodigo_venta() {
		return codigo_venta;
	}

	public void setCodigo_venta(String codigo_venta) {
		this.codigo_venta = codigo_venta;
	}

	public String getCodigo_producto() {
		return codigo_producto;
	}

	public void setCodigo_producto(String codigo_producto) {
		this.codigo_producto = codigo_producto;
	}

	public Float getCantidad() {
		return cantidad;
	}

	public void setCantidad(Float cantidad) {
		this.cantidad = cantidad;
	}

	public Float getValor_unitario() {
		return valor_unitario;
	}

	public void setValor_unitario(Float valor_unitario) {
		this.valor_unitario = valor_unitario;
	}

	public Float getValor_total() {
		return valor_total;
	}

	public void setValor_total(Float valor_total) {
		this.valor_total = valor_total;
	}

}
