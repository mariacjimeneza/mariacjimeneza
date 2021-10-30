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

.Row {
	display: table;
	width: 100%; /*Optional*/
	table-layout: fixed; /*Optional*/
	border-spacing: 10px; /*Optional*/
	border-spacing: 2em;
}

.Column {
	display: inline-table;
	/*background-color: white; Optional*/
	border-spacing: 3em;
}

td {
	text-align: center;
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

</head>
<body class="bodyregister">
	<br>
	<br>

	<div class="btn-opciones-general">
		<center>
			<button onClick="parent.location='index.html'">Home</button>
			<button>
				<a href="/Grupo11Villavicencio/CrumUsuarios.jsp"> Usuarios</a>
			</button>
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

		</center>
	</div>
	<br>
	<br>
	<center>
		<h1 id="titulo">REPORTES</h1>

		<br> <br> <br>

		<div class="Row">

			<div class="Column">
				<a href="/Grupo11Villavicencio/ConsultaUsuarios.jsp"> <img
					alt="Usuarios" src="/Grupo11Villavicencio/images/usuarios.png"
					width="100" height="100">
				</a>
			</div>

			<div class="Column">
				<a href="/Grupo11Villavicencio/ConsultaClientes.jsp"> <img
					alt="Clientes" src="/Grupo11Villavicencio/images/clientes.png"
					width="100" height="100">
				</a>
			</div>

			<div class="Column">
				<a href="/Grupo11Villavicencio/ConsultaProveedores.jsp"> <img
					alt="Proveedores"
					src="/Grupo11Villavicencio/images/proveedores.png" width="100"
					height="100"></a>
			</div>

			<div class="Column">
				<a href="/Grupo11Villavicencio/ConsultaProductos.jsp"> <img
					alt="Productos" src="/Grupo11Villavicencio/images/productos.png"
					width="100" height="100">
				</a>
			</div>
			<div class="Column">
				<a href="/Grupo11Villavicencio/ReporteVentas.jsp"> <img
					alt="Ventas" src="/Grupo11Villavicencio/images/ventas.png"
					width="100" height="100">
				</a>
			</div>
			<br>

			<table border="1" width="60%">
				<tr>
					<td width="200">Usuarios</td>
					<td width="200">Clientes</td>
					<td width="200">Proveedores</td>
					<td width="200">Productos</td>
					<td width="200">Ventas</td>

				</tr>
			</table>
		</div>

	</center>

</body>
</html>