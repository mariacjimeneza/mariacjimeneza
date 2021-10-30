package com.tiendavirtual.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Cliente;
import com.tiendavirtual.dto.Proveedor;

public class ProveedorDAO {

	public void insertProveedor(Proveedor prov) {
		Conexion connection = new Conexion();

		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate("INSERT INTO proveedores(nit, nombre, direccion, telefono, email, sitioweb)" + "VALUES ("
					+ "'" + prov.getNit() + "'" + "," + "'" + prov.getNombre() + "'" + "," + "'" + prov.getDireccion()
					+ "'" + "," + "'" + prov.getTelefono() + "'" + "," + "'" + prov.getEmail() + "'" + "," + "'"
					+ prov.getSitioweb() + "'" + ")");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Proveedor consultarProveedores(String nit) {
		Proveedor persona = null;
		Conexion connection = new Conexion();
		String sql = "SELECT * FROM proveedores ";

		sql = sql + "WHERE NIT = '" + nit + "'";

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);
			while (res.next()) {

				persona = new Proveedor(res.getString("nit"), res.getString("nombre"), res.getString("direccion"),
						res.getString("telefono"), res.getString("email"), res.getString("sitioweb"));

			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return persona;
	}

	public void deleteProveedor(String nit) {
		Conexion connection = new Conexion();
		String sql1 = "SET SQL_SAFE_UPDATES = 0 ";
		String sql2 = "DELETE FROM PROVEEDORES WHERE NIT = '" + nit + "'";
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

	public void updateProveedor(Proveedor prov) {

		Conexion connection = new Conexion();
		String sql1 = "SET SQL_SAFE_UPDATES = 0 ";
		String sql2 = "UPDATE PROVEEDORES SET " + "NIT = " + "'" + prov.getNit() + "'" + "," + " nombre = " + "'"
				+ prov.getNombre() + "'" + "," + " direccion = " + "'" + prov.getDireccion() + "'" + ","
				+ " telefono = " + "'" + prov.getTelefono() + "'" + "," + " email = " + "'" + prov.getEmail() + "'"
				+ "," + " sitioweb = " + "'" + prov.getSitioweb() + "'" + " WHERE nit=" + "'" + prov.getNit() + "'";
		String sql3 = "  SET SQL_SAFE_UPDATES = 1 ";

		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate(sql1);
			stmt.executeUpdate(sql2);
			stmt.executeUpdate(sql3);

		} catch (SQLException e) { // TODO Auto-generated
			e.printStackTrace();
		}
	}

	public ArrayList<Proveedor> listarProveedores(String nit) {
		ArrayList<Proveedor> provs = new ArrayList<Proveedor>();
		Conexion connection = new Conexion();

		String sql = "SELECT * FROM proveedores ";
		if (!nit.trim().equals("null")) {
			sql = sql + "WHERE NIT = '" + nit + "'";
		}

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Proveedor pro = new Proveedor(res.getString("nit"), res.getString("nombre"), res.getString("direccion"),
						res.getString("telefono"), res.getString("email"), res.getString("sitioweb"));

				provs.add(pro);
			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return provs;
	}

}
