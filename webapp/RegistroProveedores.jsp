<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: registro de proveedores</title>
<style>
input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
button {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

</style>
<script>
	function validateFields() {
		if (document.getElementById("txtNIT").value.trim().length == 0) {
			alert("El campo NIT está vacío.");
			return false;
		} else if (document.getElementById("txtNombre").value.trim().length == 0) {
			alert("El campo nombre del proveedor está vacío.");
			return false;
		} else if (document.getElementById("txtDireccion").value.trim().length == 0) {
			alert("El campo dirección del proveedor está vacío.");
			return false;
		} else if (document.getElementById("txtTelefono").value.trim().length == 0) {
			alert("El campo telefono del proveedor está vacío.");
			return false;
		} else {
			return true;
		}
	}

	function sendData() {
		if (!validateFields()) {
			return;
		} else {
			var nit = document.getElementById("txtNIT").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var direccion = document.getElementById("txtDireccion").value
					.trim();
			var telefono = document.getElementById("txtTelefono").value.trim();
			var email = document.getElementById("txtEmail").value.trim();
			var sitioweb = document.getElementById("txtSitioWeb").value.trim();

			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/registrarProveedor';
			var params = "NIT=" + nit + "&" + "nombre=" + nombre + "&"
					+ "direccion=" + direccion + "&" + "telefono=" + telefono
					+ "&" + "email=" + email + "&" + "sitioweb=" + sitioweb;
			http.open('POST', url, true);

			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');

			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
				}
			}
			http.send(params);
		}
	}
</script>
</head>
<body>
	<h1>Registro de Provedores</h1>
	<table>
		<tr>
			<td><label for="txtNIT">NIT:</label></td>
			<td><input type="text" id="txtNIT" name="NIT"></td>
		</tr>
		<tr>
			<td><label for="txtNombre">Nombre</label></td>
			<td><input type="text" id="txtNombre" name="nombre"></td>
		</tr>
		<tr>
			<td><label for="txtDireccion">Dirección:</label></td>
			<td><input type="text" id="txtDireccion" name="direccion"></td>
		</tr>
		<tr>
			<td><label for="txtTelefono">Telefono</label></td>
			<td><input type="text" id="txtTelefono" name="telefono"></td>
		</tr>
		<tr>
			<td><label for="txtEmail">Correo Electrónico:</label></td>
			<td><input type="email" id="txtEmail" name="email"></td>
		</tr>
		<tr>
			<td><label for="txtSitioWeb">Sitio Web:</label></td>
			<td><input type="text" id="txtSitioWeb" name="sitioweb"></td>
		</tr>
		<tr>
			<td><button onclick="sendData()">Enviar Datos</button></td>
			<td><button onclick="clearForm()">Cancelar</button></td>
		</tr>
	</table>

</body>
</html>