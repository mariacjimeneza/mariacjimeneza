package com.tiendavirtual.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Producto;

public class ProductosDAO {

	public void insertProducto(Producto prod) {
		Conexion connection = new Conexion();

		try {
			Statement estatuto = connection.getConnection().createStatement();
			estatuto.executeUpdate(
					"INSERT INTO productos(codigo_producto, nombre_producto, nit_proveedor, precio_compra, iva_compra, precio_venta) "
							+ "VALUES ('" + prod.getCodigo_producto() + "', '" + prod.getNombre_producto() + "', '"
							+ prod.getNit_proveedor() + "', '" + prod.getPrecio_compra() + "', '" + prod.getIva_compra()
							+ "', '" + prod.getPrecio_venta() + "')");
			estatuto.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<Producto> consultarProductos(String codigo_producto) {
		ArrayList<Producto> productos = new ArrayList<Producto>();
		Conexion connection = new Conexion();

		String sql = "SELECT * FROM productos ";
		if (!codigo_producto.trim().equals("null")) {
			sql = sql + "WHERE codigo_producto = '" + codigo_producto + "'";
		}

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Producto prod = new Producto(res.getString("codigo_producto"), res.getString("nombre_producto"),
						res.getString("nit_proveedor"), res.getFloat("precio_compra"), res.getFloat("iva_compra"),
						res.getFloat("precio_venta"));
				productos.add(prod);
			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return productos;
	}

	public void fileUpload(File archivo) {
		try {
			FileReader fr = new FileReader(archivo);
			BufferedReader br = new BufferedReader(fr);
			String linea = "";
			while ((linea = br.readLine()) != null) {
				String[] tokens = linea.split(";");
				Producto p = new Producto(tokens[0], tokens[1], tokens[2], Float.parseFloat(tokens[3]),
						Float.parseFloat(tokens[4]), Float.parseFloat(tokens[5]));
				insertProducto(p);
			}
			br.close();
			fr.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String consultarProducto(String cod) {

		String registro = null;
		Conexion connection = new Conexion();

		String sql = "SELECT nombre_producto, precio_venta, iva_compra FROM productos";

		sql = sql + " WHERE codigo_producto =56058";
		// + "'" + cod + "'";

		try {
			Statement consulta = connection.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);
			while (res.next()) {

				registro = new String("{" + '"' + "nombre_producto" + '"' + ":" + '"' + res.getString("nombre_producto")
						+ '"' + "," + '"' + "precio_venta" + '"' + ":" + '"' + res.getString("precio_venta") + '"' + ","
						+ '"' + "iva_compra" + '"' + ":" + '"' + res.getString("iva_compra") + '"' + "}");

			}
			res.close();
			consulta.close();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return registro;
	}

}
