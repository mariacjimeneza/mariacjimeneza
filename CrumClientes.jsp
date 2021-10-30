<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: módulo de clientes</title> 
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
	function validarDatos() {
		if (document.getElementById("txtIdent").value.length == 0) {
			alert("El campo cedula está vacío");
			return false;
		} else if (document.getElementById("txtName").value.length == 0) {
			alert("El campo nombre está vacío");
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

	function enviarDatos() {
		if (!validarDatos()) {
			return;
		} else {
			var cedula = document.getElementById("txtIdent").value.trim();
			var nombre = document.getElementById("txtName").value.trim();
			var direccion = document.getElementById("txtAddress").value.trim();
			var telefono = document.getElementById("txtPhone").value.trim();
			var email = document.getElementById("txtEmail").value.trim();

			//SEÑORAS Y SEÑORES EL FAMOSO OBJETO CMLHTTPREQUEST
			var http = new XMLHttpRequest();

			var url = '/Grupo11Villavicencio/ingresarClientes';

			//?cedula=888&nombre=felipe&direccion=cali&telefono=333&email=gato@gmail
			var params = "nombre=" + nombre + "&" + "cedula=" + cedula + "&"
					+ "direccion=" + direccion + "&" + "telefono=" + telefono
					+ "&" + "email=" + email;

			http.open('POST', url, true);
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
				}
			}
			http.send(params);
		}
	}

	function clearFields() {
		document.getElementById('txtIdent').value = '';
		document.getElementById('txtName').value = '';
		document.getElementById('txtAddress').value = '';
		document.getElementById('txtPhone').value = '';
		document.getElementById('txtEmail').value = '';
	}

	function consultar() {
		var cedula = document.getElementById("txtIdent").value.trim();
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/consultarClientes';
		var params = "cedula=" + cedula;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				alert(http.responseText);
				var myArr = JSON.parse(http.responseText);

				document.getElementById('txtIdent').value = myArr.cedula;
				document.getElementById('txtName').value = myArr.nombre;
				document.getElementById('txtAddress').value = myArr.direccion;
				document.getElementById('txtPhone').value = myArr.telefono;
				document.getElementById('txtEmail').value = myArr.email;

			}
		}
		http.send(params);
	}

	function eliminar() {
		var cedula = document.getElementById("txtIdent").value.trim();
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/eliminarCliente';
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

		var cedula = document.getElementById("txtIdent").value.trim();
		var nombre = document.getElementById("txtName").value.trim();
		var direccion = document.getElementById("txtAddress").value.trim();
		var telefono = document.getElementById("txtPhone").value.trim();
		var email = document.getElementById("txtEmail").value.trim();

		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/actualizarCliente';

		var params = "nombre=" + nombre + "&" + "cedula=" + cedula + "&"
				+ "direccion=" + direccion + "&" + "telefono=" + telefono + "&"
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
				<a href="/Grupo11Villavicencio/CrumUsuarios.jsp"> Usuarios</a>
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
		<h1 id="titulo">GESTIÓN DE CLIENTES</h1>
	</center>

	<br>
	<br>
	<br>

	<div class="column">
		<table>
			<tr>
				<td><label for="txtIdent">Cedula:</label></td>
				<td><input type="text" id="txtIdent" name="cedula"></td>
			</tr>
			<tr>
				<td><label for="txtName">Nombre:</label></td>
				<td><input type="text" id="txtName" name="nombre"></td>
			</tr>
			<tr>
				<td><label for="txtAddress">Dirección:</label></td>
				<td><input type="text" id="txtAddress" name="direccion"></td>
			</tr>
			<tr>
				<td><label for="txtPhone">Teléfono:</label></td>
				<td><input type="text" id="txtPhone" name="telefono"></td>
			</tr>
			<tr>
				<td><label for="txtEmail">Correo electrónico:</label></td>
				<td><input type="text" id="txtEmail" name="email"></td>
			</tr>

		</table>
	</div>
	<br>
	<br>
	
	<div class="btn-opciones">
		<center>
			<button onclick="enviarDatos()">Crear</button>
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