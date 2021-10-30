<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: módulo de usuarios</title>

<style>
#titulo {
	color: black;
	font-size: 40px;
}

.bodyregister {
	margin: 0;
	padding: 0;
	background-color: LightBlue;
	font-family: 'Arial';
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

/* table */
* {
	box-sizing: border-box;
}

.row {
	margin-left: 50px;
	margin-right: -50px;
	top: 10%;
}

.column {
	float: left;
	width: 50%;
	padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
	content: "";
	clear: both;
	display: table;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
	margin-left: 70px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

/*botones*/
.btn-opciones button {
	border: 1px solid black; /* Green border */
	color: black; /* White text */
	padding: 10px 24px; /* Some padding */
	cursor: pointer; /* Pointer/hand icon */
	width: 15%; /* Set a width if needed */
	top: 10%;
	/*display: block;  Make the buttons appear below each other */
	display: block;
	border-radius: 10px;
	margin-bottom: 10px;
}

/* Add a background color on hover */
.btn-opciones button:hover {
	background-color: #CD5C5C;
}

th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}

/*botones*/
.btn-opciones-general button {
	border: 1px solid black; /* Green border */
	color: black; /* White text */
	padding: 10px 24px; /* Some padding */
	cursor: pointer; /* Pointer/hand icon */
	width: 15%; /* Set a width if needed */
	top: 10%;
	display: inline-table; /* Make the buttons appear below each other */
}

/* Add a background color on hover */
.btn-opciones-general button:hover {
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
		} else if (document.getElementById("txtCedula").value.length == 0) {
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
			var cedula = document.getElementById("txtCedula").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var email = document.getElementById("txtEmail").value.trim();
			var user = document.getElementById("txtUser").value.trim();
			var password = document.getElementById("txtPass").value.trim();

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
		document.getElementById('txtCedula').value = '';
		document.getElementById('txtNombre').value = '';
		document.getElementById('txtEmail').value = '';
		document.getElementById('txtUser').value = '';
		document.getElementById('txtPass').value = '';
	}

	function consultar() {
		var cedula = document.getElementById("txtCedula").value.trim();
		//.trim()
		/*if (cedula.trim() == "") {
			cedula = "null";
		}
		 */
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/consultarUsuarios';
		var params = "cedula=" + cedula;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				//alert(http.responseText);
				var myArr = JSON.parse(http.responseText);

				document.getElementById('txtCedula').value = myArr.cedula;
				document.getElementById('txtNombre').value = myArr.nombre;
				document.getElementById('txtEmail').value = myArr.email;
				document.getElementById('txtUser').value = myArr.user;
				document.getElementById('txtPass').value = myArr.password;

			}
		}
		http.send(params);
	}

	function eliminar() {
		var cedula = document.getElementById("txtCedula").value.trim();
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/eliminarUsuario';
		var params = "cedula=" + cedula;
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

	function actualizar() {
		var cedula = document.getElementById("txtCedula").value.trim();
		var nombre = document.getElementById("txtNombre").value.trim();
		var email = document.getElementById("txtEmail").value.trim();
		var user = document.getElementById("txtUser").value.trim();
		var password = document.getElementById("txtPass").value.trim();

		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/actualizarUsuario';
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
</script>
</head>
<body class="bodyregister">
	<br>
	<div class="btn-opciones-general">
		<center>
			<button onClick="parent.location='index.html'">Home</button>
			<button>
				<a href="/Grupo11Villavicencio/CrumClientes.jsp"> Clientes</a>
			</button>
			<button>
				<a href="/Grupo11Villavicencio/CrumProveedores.jsp"> Proveedores</a>
			</button>
			<button>
				<a href="/Grupo11Villavicencio/CargueMasivoProductos.jsp">
					Productos</a>
			</button>
			<button>
				<a href="/Grupo11Villavicencio/ResumenVentas.jsp"> Ventas</a>
			</button>
			<button>
				<a href="/Grupo11Villavicencio/Estadisticas.jsp">
					Reportes</a>
			</button>
		</center>
	</div>
	<br>
	<br>
	<center>
		<h1 id="titulo">GESTIÓN DE USUARIOS</h1>
	</center>
	<br>
	<br>
	<br>

	<div class="column">
		<table>
			<tr>
				<td><label for="txtCedula">Cedula:</label></td>
				<td><input type="text" id="txtCedula" name="cedula"></td>
			</tr>
			<tr>
				<td><label for="txtNombre">Nombre:</label></td>
				<td><input type="text" id="txtNombre" name="nombre"></td>
			</tr>
			<tr>
				<td><label for="txtEmail">Correo Electrónico:</label></td>
				<td><input type="email" id="txtEmail" name="email"></td>
			</tr>
			<tr>
				<td><label for="txtUser">Usuario:</label></td>
				<td><input type="text" id="txtUser" name="user"></td>
			</tr>
			<tr>
				<td><label for="txtPass">Contraseña:</label></td>
				<td><input type="text" id="txtPass" name="password"></td>
			</tr>
		</table>
	</div>
	<br>
	<br>

	<div class="btn-opciones">
		<center>
			<button onclick="sendData()">Crear</button>
			<button onclick="consultar()">Consultar</button>
			<button onclick="actualizar()">Actualizar</button>
			<button onclick="eliminar()">Borrar</button>
			<button onclick="clearFields()">Cancelar</button>
		</center>
	</div>
	<br>
	<br>

</body>
</html>