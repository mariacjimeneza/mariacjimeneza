package com.tiendavirtual.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Cliente;
import com.tiendavirtual.dto.Usuario;

public class ClientesDAO {
	public void insertCustomer(Cliente cli) {
		Conexion connection = new Conexion();
		// Statement stmt;
		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate(
					"INSERT INTO clientes(nombre, cedula, direccion, telefono, correo_electronico)" + "VALUES (" + "'"
							+ cli.getNombre() + "'" + "," + "'" + cli.getCedula() + "'" + "," + "'" + cli.getDireccion()
							+ "'" + "," + "'" + cli.getTelefono() + "'" + "," + "'" + cli.getEmail() + "'" + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Cliente consultarClientes(String cedula) {
		Cliente persona = null;
		Conexion connection = new Conexion();
		String sql = "SELECT * FROM clientes ";

		// if (!cedula.trim().equals("null")) {
		sql = sql + "WHERE cedula = '" + cedula + "'";
		// }

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);
			while (res.next()) {

				persona = new Cliente(res.getString("cedula"), res.getString("nombre"), res.getString("direccion"),
						res.getString("telefono"), res.getString("correo_electronico"));
			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar el cliente\n" + e);
		}
		return persona;
	}

	public void deleteCliente(String cedula) {
		Conexion connection = new Conexion();
		String sql1 = "SET SQL_SAFE_UPDATES = 0 ";
		String sql2 = "DELETE FROM CLIENTES WHERE CEDULA = '" + cedula + "'";
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

	public void updateCliente(Cliente cli) {

		Conexion connection = new Conexion();
		String sql = "UPDATE CLIENTES SET " + " cedula = " + "'" + cli.getCedula() + "'" + "," + "nombre = " + "'"
				+ cli.getNombre() + "'" + "," + " direccion = " + "'" + cli.getDireccion() + "'" + "," + " telefono = "
				+ "'" + cli.getTelefono() + "'" + "," + " correo_electronico = " + "'" + cli.getEmail() + "'";

		sql = sql + " WHERE cedula= '" + cli.getCedula() + "'";
		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) { // TODO Auto-generated
			e.printStackTrace();
		}
	}

	public ArrayList<Cliente> listarClientes(String cedula) {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		Conexion connection = new Conexion();

		String sql = "SELECT * FROM clientes ";
		if (!cedula.trim().equals("null")) {
			sql = sql + "WHERE cedula = '" + cedula + "'";
		}

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Cliente cli = new Cliente(res.getString("cedula"), res.getString("nombre"),
						res.getString("direccion"), res.getString("telefono"), res.getString("correo_electronico"));

				clientes.add(cli);
			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return clientes;
	}

}
