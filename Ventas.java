package com.tiendavirtual.dto;

public class Ventas {
	private String codigo_venta;
	private String cedula_cliente;
	private String cedula_usuario;
	private Float valor_bruto_venta;
	private Float valor_iva;
	private Float valor_neto_venta;

	public Ventas(String codigo_venta, String cedula_cliente, String cedula_usuario, Float valor_bruto_venta,
			Float valor_iva, Float valor_neto_venta) {
		super();
		this.codigo_venta = codigo_venta;
		this.cedula_cliente = cedula_cliente;
		this.cedula_usuario = cedula_usuario;
		this.valor_bruto_venta = valor_bruto_venta;
		this.valor_iva = valor_iva;
		this.valor_neto_venta = valor_neto_venta;
	}

	public String getCodigo_venta() {
		return codigo_venta;
	}

	public void setCodigo_venta(String codigo_venta) {
		this.codigo_venta = codigo_venta;
	}

	public String getCedula_cliente() {
		return cedula_cliente;
	}

	public void setCedula_cliente(String cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}

	public String getCedula_usuario() {
		return cedula_usuario;
	}

	public void setCedula_usuario(String cedula_usuario) {
		this.cedula_usuario = cedula_usuario;
	}

	public Float getValor_bruto_venta() {
		return valor_bruto_venta;
	}

	public void setValor_bruto_venta(Float valor_bruto_venta) {
		this.valor_bruto_venta = valor_bruto_venta;
	}

	public Float getValor_iva() {
		return valor_iva;
	}

	public void setValor_iva(Float valor_iva) {
		this.valor_iva = valor_iva;
	}

	public Float getValor_neto_venta() {
		return valor_neto_venta;
	}

	public void setValor_neto_venta(Float valor_neto_venta) {
		this.valor_neto_venta = valor_neto_venta;
	}
	
}
