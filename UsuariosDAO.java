package com.tiendavirtual.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Cliente;
import com.tiendavirtual.dto.Usuario;

public class UsuariosDAO {

	public void insertUser(Usuario user) {
		Conexion connection = new Conexion();

		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate(
					"INSERT INTO usuarios(cedula, nombre, correo_electronico, usuario, password) " + "VALUES (" + "'"
							+ user.getCedula() + "'" + "," + "'" + user.getNombre() + "'" + "," + "'" + user.getEmail()
							+ "'" + "," + "'" + user.getUser() + "'" + "," + "'" + user.getPassword() + "'" + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Usuario consultarUsuarios(String cedula) {
		Usuario persona = null;
		Conexion connection = new Conexion();
		String sql = "SELECT * FROM usuarios ";

		// if (!cedula.trim().equals("null")) {
		sql = sql + "WHERE cedula = '" + cedula + "'";
		// }

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);
			while (res.next()) {

				persona = new Usuario(res.getString("cedula"), res.getString("nombre"),
						res.getString("correo_electronico"), res.getString("usuario"), res.getString("password"));
				/*
				 * String var1 = res.getString("cedula"); String var2 = res.getString("nombre");
				 * String var3 = res.getString("correo_electronico"); String var4 =
				 * res.getString("usuario"); String var5 = res.getString("password");
				 * 
				 * System.out.println(var1 + var2 + var3 + var4 + var5);
				 */
			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return persona;
	}

	public void deleteUser(String cedula) {
		Conexion connection = new Conexion();
		String sql1 = "SET SQL_SAFE_UPDATES = 0 ";
		String sql2 = "DELETE FROM USUARIOS WHERE CEDULA = '" + cedula + "'";
		String sql3 = "  SET SQL_SAFE_UPDATES = 1 ";

		try {
			Statement consulta = connection.getConnection().createStatement();
			consulta.executeUpdate(sql1);
			consulta.executeUpdate(sql2);
			consulta.executeUpdate(sql3);
			// consulta.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateUser(Usuario user) {

		Conexion connection = new Conexion();
		String sql = "UPDATE USUARIOS SET " + "cedula = " + "'" + user.getCedula() + "'" + "," + " nombre = " + "'"
				+ user.getNombre() + "'" + "," + " correo_electronico = " + "'" + user.getEmail() + "'" + ","
				+ " usuario = " + "'" + user.getUser() + "'" + "," + " password = " + "'" + user.getPassword() + "'";

		sql = sql + " WHERE cedula= '" + user.getCedula() + "'";
		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) { // TODO Auto-generated
			e.printStackTrace();
		}
	}

	public ArrayList<Usuario> listarUsuarios(String cedula) {
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		Conexion connection = new Conexion();

		String sql = "SELECT * FROM usuarios ";
		if (!cedula.trim().equals("null")) {
			sql = sql + "WHERE cedula = '" + cedula + "'";
		}

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Usuario user = new Usuario(res.getString("cedula"), res.getString("nombre"),
						res.getString("correo_electronico"), res.getString("usuario"), res.getString("password"));
				
				usuarios.add(user);
			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return usuarios;
	}
}