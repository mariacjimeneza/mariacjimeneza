package com.tiendavirtual.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {

	private String bd = "tienda_virtual";
	private String login = "root";
	private String password = "admin";
	private String url = "jdbc:mysql://localhost/" + bd;

	// PARA CARGAR EN AMAZON
	/*
	 * private String bd = "Grupo11villavicencio"; private String login = "admin";
	 * private String password = "MisionTIC2022GRUPO11"; private String url =
	 * "jdbc:mysql://misiontic2022grupo11.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/"
	 * + bd;
	 */

	public Connection getConnection() {

		Connection connection = null;

		try {
			// esta linea la comentareo para cargar amazon
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Class.forName("org.mariadb.jdbc.Driver");

			connection = DriverManager.getConnection(url, login, password);
			if (connection != null) {
				System.out.println("Conexión a base de datos " + bd + " OK\n");
			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}

		return connection;
	}

}
