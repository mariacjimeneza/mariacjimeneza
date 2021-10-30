package com.tiendavirtual.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Cliente;
import com.tiendavirtual.dto.Detalle;
import com.tiendavirtual.dto.Usuario;
import com.tiendavirtual.dto.Ventas;

public class VentasDAO {
	public void insertVenta(Ventas ven) {
		Conexion connection = new Conexion();

		try {
			Statement stmt = connection.getConnection().createStatement();
			stmt.executeUpdate(
					"INSERT INTO ventas(codigo_venta, cedula_cliente, cedula_usuario, valor_bruto_venta, valor_iva, valor_neto_venta) VALUES ("
							+ "'" + ven.getCodigo_venta() + "'" + "," + "'" + ven.getCedula_cliente() + "'" + "," + "'"
							+ ven.getCedula_usuario() + "'" + "," + "'" + ven.getValor_bruto_venta() + "'" + "," + "'"
							+ ven.getValor_iva() + "'" + "," + "'" + ven.getValor_neto_venta() + "'" + ")");

			/*
			 * Statement stmt1 = connection.getConnection().createStatement();
			 * stmt1.executeUpdate(
			 * "INSERT INTO detalleventas(codigo_venta, codigo_producto, cantidad, valor_unitario, valor_total) VALUES ("
			 * + "'" + det.getCodigo_venta() + "'" + "," + "'" + det.getCodigo_producto() +
			 * "'" + "," + "'" + det.getCantidad() + "'" + "," + "'" +
			 * det.getValor_unitario() + "'" + "," + "'" + det.getValor_total() + "'" +
			 * ")");
			 */
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteVenta(String cod) {
		Conexion connection = new Conexion();
		String sql1 = "SET SQL_SAFE_UPDATES = 0 ";
		String sql2 = "DELETE FROM VENTAS WHERE CODIGO_VENTA = '" + cod + "'";
		String sql3 = "  SET SQL_SAFE_UPDATES = 1 ";
/*
		String sql4 = "SET SQL_SAFE_UPDATES = 0 ";
		String sql5 = "DELETE FROM DETALLEVENTAS WHERE CODIGO_VENTA = '" + cod + "'";
		String sql6 = "  SET SQL_SAFE_UPDATES = 1 ";
*/
		try {
			Statement consulta = connection.getConnection().createStatement();
			consulta.executeUpdate(sql1);
			consulta.executeUpdate(sql2);
			consulta.executeUpdate(sql3);
			/*
			consulta.executeUpdate(sql4);
			consulta.executeUpdate(sql5);
			consulta.executeUpdate(sql6);
*/
			// consulta.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public String consultarVenta(String num) {
		String registro = null;
		Conexion connection = new Conexion();

		String sql = "SELECT A.nombre AS reg FROM clientes A left JOIN ventas B ON A.cedula = B.cedula_cliente";
		sql = sql + " WHERE B.cedula_cliente = 777";
		// + "'" + num + "'";

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);
			while (res.next()) {

				registro = new String(res.getString("reg"));

			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return registro;
	}
	
	public ArrayList <String> consultarConsolidado(String tipo) {
		ArrayList<String> registros = new ArrayList<String>();
		Conexion connection = new Conexion();

		String sql = "";
		if (tipo.trim().equals("producto")) {
			sql = "SELECT codigo_producto AS Item, SUM(cantidad) AS Unidades\r\n"
					+ "FROM detalleventas\r\n"
					+ "GROUP BY codigo_producto\r\n"
					+ "ORDER BY codigo_producto;";
			
		} else if (tipo.trim().equals("cliente")){
			sql = "SELECT cedula_cliente AS Item, SUM(valor_neto_venta) AS Unidades\r\n"
					+ "FROM ventas\r\n"
					+ "GROUP BY cedula_cliente\r\n"
					+ "ORDER BY cedula_cliente;";
		}

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);
			while (res.next()) {
				registros.add(res.getString("Item")+";"+res.getInt("unidades"));

			}
			res.close();
			consulta.close();
			

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar el Proveedor\n" + e);
		}
		return registros;
	}

}
