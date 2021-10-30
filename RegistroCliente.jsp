<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: ingreso de clientes</title>
<style>
table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #ddd;
	padding: 5px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #D68910;
}

th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>



<script>
	function enviarDatos() {
		if (validarDatos()) {
			alert("todo ok");
			var nombre = document.getElementById("txtName").value.trim();
			var cedula = document.getElementById("txtIdent").value.trim();
			var direccion = document.getElementById("txtAddress").value.trim();
			var telefono = document.getElementById("txtPhone").value.trim();
			var email = document.getElementById("txtEmail").value.trim();

			//SEÑORAS Y SEÑORES EL FAMOSO OBJETO CMLHTTPREQUEST
			var http = new XMLHttpRequest();

			var url = '/Grupo11Villavicencio/ingresarclientes';
			
			//?cedula=888&nombre=felipe&direccion=cali&telefono=333&email=gato@gmail
			var params ="nombre=" + nombre + "&" + "cedula=" + cedula + "&"   
					+ "direccion=" + direccion + "&" + "telefono=" + telefono + "&"
					+ "email=" + email;

			http.open('POST', url, true);
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);

				}
			}

		} else {
			alert("algo va mal")
		}

		return;
	}
	function validarDatos() {
		if (document.getElementById("txtName").value.length == 0) {
			alert("El campo nombre está vacío");
			return false;
		} else if (document.getElementById("txtIdent").value.length == 0) {
			alert("El campo cedula está vacío");
			return false;
		} else if (document.getElementById("txtAddress").value.length == 0) {
			alert("El campo dirección está vacío");
			return false;
		} else if (document.getElementById("txtPhone").value.length == 0) {
			alert("El campo telefono está vacío");
			return false;
		} else if (document.getElementById("txtEmail").value.length == 0) {
			alert("El campo correo electrónico está vacío");
			return false;
		} else {
			return true;
		}

	}
</script>


</head>
<body>
	<form action="http://localhost:8080/ingresarclientes"
		method="post">
		<table border='1'>

			<tr>
				<td>Nombre:</td>
				<td><input type="text" id="txtName" name="nombre"> </input></td>
			</tr>

			<tr>
				<td>Cedula:</td>
				<td><input type="text" id="txtIdent" name="cedula"> </input></td>
			</tr>

			<tr>
				<td>Direccion:</td>
				<td><input type="text" id="txtAddress" name="direccion">
					</input></td>
			</tr>

			<tr>
				<td>Telefono:</td>
				<td><input type="text" id="txtPhone" name="telefono"> </input></td>
			</tr>

			<tr>
				<td>CorreoElectronico:</td>
				<td><input type="text" id="txtEmail" name="email"> </input></td>
			</tr>


		</table>
		<br /> <input type="submit" value="Registrar cliente">
	</form>

</body>
</html>