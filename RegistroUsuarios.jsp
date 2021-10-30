<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: creación de usuarios</title>

<style>
#titulo {
	color: black;
	font-size: 40px;
}

.bodyregister {
	margin: 0;
	padding: 0;
	background-color: #6abadeba;
	font-family: 'Arial';
}

.box {
	background-color: #6abadeba;
	position: fixed;
	margin-left: -150px; /* half of width */
	margin-top: -150px; /* half of height */
	top: 40%;
	left: 50%;
}

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
	color: black;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #CD5C5C;
}
</style>

<script>
	function validateFields() {
		if (document.getElementById("txtUser").value.length == 0) {
			alert("El campo usuario está vacío");
			return false;
		} else if (document.getElementById("txtPass").value.length == 0) {
			alert("El campo password está vacío");
			return false;
		} else if (document.getElementById("txtNombre").value.length == 0) {
			alert("El campo nombre está vacío");
			return false;
		} else if (document.getElementById("txtId").value.length == 0) {
			alert("El campo cedula está vacío");
			return false;
		} else if (document.getElementById("txtEmail").value.length == 0) {
			alert("El campo correo electrónico está vacío");
			return false;
		} else {
			return true;
		}
	}

	function sendData() {
		if (!validateFields()) {
			return;
		} else {
			var user = document.getElementById("txtUser").value.trim();
			var password = document.getElementById("txtPass").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var cedula = document.getElementById("txtId").value.trim();
			var email = document.getElementById("txtEmail").value.trim();

			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/creacionUsuario';
			var params = "user=" + user + "&" + "password=" + password + "&"
					+ "nombre=" + nombre + "&" + "cedula=" + cedula + "&"
					+ "email=" + email;

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
	
	function clearFields() {
		document.getElementById('txtId').value = '';
		document.getElementById('txtNombre').value = '';
		document.getElementById('txtEmail').value = '';
		document.getElementById('txtUser').value = '';
		document.getElementById('txtPass').value = '';
	}
</script>
</head>
<body class="bodyregister">
	<br>
	<br>
	<center>
		<h1 id="titulo">CREACIÓN DE USUARIO</h1>
		<br>
		<table class="box">
			<tr>
				<td><label for="txtUser">Usuario:</label></td>
				<td><input type="text" id="txtUser" name="user"></td>
			</tr>
			<tr>
				<td><label for="txtPass">Contraseña:</label></td>
				<td><input type="text" id="txtPass" name="password"></td>
			</tr>
			<tr>
				<td><label for="txtNombre">Nombre</label></td>
				<td><input type="text" id="txtNombre" name="nombre"></td>
			</tr>
			<tr>
				<td><label for="txtId">Cedula:</label></td>
				<td><input type="text" id="txtId" name="cedula"></td>
			</tr>
			<tr>
				<td><label for="txtEmail">Correo Electrónico:</label></td>
				<td><input type="email" id="txtEmail" name="email"></td>
			</tr>
			<tr>
				<td><button onclick="sendData()">Crear</button></td>
				<td><button onclick="clearFields()">Cancelar</button></td>
			</tr>
		</table>
	</center>

</body>
</html>