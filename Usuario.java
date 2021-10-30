package com.tiendavirtual.dto;

public class Usuario {
	private String cedula;
	private String nombre;
	private String email;
	private String user;
	private String password;

	public Usuario(String cedula, String nombre, String email, String user, String password) {
		super();
		this.cedula = cedula;
		this.nombre = nombre;
		this.email = email;
		this.user = user;
		this.password = password;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}