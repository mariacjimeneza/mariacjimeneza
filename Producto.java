package com.tiendavirtual.dto;

public class Producto {
	
	private String codigo_producto;
	private String nombre_producto;
	private String nit_proveedor;
	private float precio_compra;
	private float iva_compra;
	private float precio_venta;
	
	public Producto(String codigo_producto, String nombre_producto, String nit_proveedor, float precio_compra,
			float iva_compra, float precio_venta) {
		super();
		this.codigo_producto = codigo_producto;
		this.nombre_producto = nombre_producto;
		this.nit_proveedor = nit_proveedor;
		this.precio_compra = precio_compra;
		this.iva_compra = iva_compra;
		this.precio_venta = precio_venta;
	}

	public String getCodigo_producto() {
		return codigo_producto;
	}

	public void setCodigo_producto(String codigo_producto) {
		this.codigo_producto = codigo_producto;
	}

	public String getNombre_producto() {
		return nombre_producto;
	}

	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}

	public String getNit_proveedor() {
		return nit_proveedor;
	}

	public void setNit_proveedor(String nit_proveedor) {
		this.nit_proveedor = nit_proveedor;
	}

	public float getPrecio_compra() {
		return precio_compra;
	}

	public void setPrecio_compra(float precio_compra) {
		this.precio_compra = precio_compra;
	}

	public float getIva_compra() {
		return iva_compra;
	}

	public void setIva_compra(float iva_compra) {
		this.iva_compra = iva_compra;
	}

	public float getPrecio_venta() {
		return precio_venta;
	}

	public void setPrecio_venta(float precio_venta) {
		this.precio_venta = precio_venta;
	}
	
	
	
	
}
