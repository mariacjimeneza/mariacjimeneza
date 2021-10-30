<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cargue masivo de productos</title>

<style>
#titulo {
	color: black;
	font-size: 40px;
}

#fondo {
	background-color: LightBlue;
	background-size: auto;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center top;
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
	async
	function cargarArchivo() {
		let formData = new FormData();
		formData.append("file", fileupload.files[0]);
		let response = await
		fetch('/Grupo11Villavicencio/upload', {
			method : "POST",
			body : formData
		});
		if (response.status == 200) {
			alert("File successfully uploaded.");
		}
	}
</script>

</head>
<body id="fondo">
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
		<h1 id="titulo">GESTIÓN DE PRODUCTOS</h1>
		<br> <br> <br> <input id="fileupload" type="file"
			name="fileupload" />
		<button id="btnUpload" onclick="cargarArchivo()">Cargar</button>
	</center>



</body>
</html>