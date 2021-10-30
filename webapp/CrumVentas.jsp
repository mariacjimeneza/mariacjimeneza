<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: módulo de ventas</title>

<style>
#titulo {
	color: black;
	font-size: 40px;
}

#subtitulo {
	color: black;
	font-size: 20px;
}

.bodyregister {
	/*margin: 0;
	padding: 0; */
	background-color: LightBlue;
	font-family: 'Arial';
}

input {
	width: 50%;
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
	width: 70%;
	border: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

/*botones*/
.btn-opciones button {
	color: black;
	padding: 10px 24px;
	cursor: pointer;
	width: 15%;
	top: 10%;
	display: inline-table;
}

/*Add a background color on hover*/
.btn-opciones button:hover {
	background-color: #CD5C5C;
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
		if (document.getElementById("txtCodigoVenta").value.trim().length == 0) {
			alert("El campo código venta está vacío.");
			return false;
		} else if(document.getElementById("txtCedulaCliente").value.trim().length == 0) {
			alert("El campo cedula cliente está vacío.");
			return false;
		} else if (document.getElementById("txtCedulaUsuario").value.trim().length == 0) {
			alert("El campo cedula usuario está vacío.");
			return false;
		} else if (document.getElementById("txtValorBruto").value.trim().length == 0) {
			alert("El campo valor bruto venta está vacío.");
			return false;
		} else if (document.getElementById("txtIva").value.trim().length == 0) {
			alert("El campo iva está vacío.");
			return false;
		} else if (document.getElementById("txtValorNeto").value.trim().length == 0) {
			alert("El campo valor neto venta está vacío.");
			return false;
		} else if (document.getElementById("txtCodigoProducto").value.trim().length == 0) {
			alert("El campo código producto está vacío.");
			return false;
		} else if (document.getElementById("txtCantidad").value.trim().length == 0) {
			alert("El campo cantidad está vacío.");
			return false;
		} else if (document.getElementById("txtValorUnitario").value.trim().length == 0) {
			alert("El campo valor unitario está vacío.");
			return false;
		} else if (document.getElementById("txtValorTotal").value.trim().length == 0) {
			alert("El campo valor total está vacío.");
			return false;
		} else {
			return true;
		}
	}

	function sendData() {
		if (!validateFields()) {
			return;
		} else {
			var codigo_venta = document.getElementById("txtCodigoVenta").value
			.trim();
	
			var cedula_cliente = document.getElementById("txtCedulaCliente").value
					.trim();
			var cedula_usuario = document.getElementById("txtCedulaUsuario").value
					.trim();
			var valor_bruto_venta = document.getElementById("txtValorBruto").value
					.trim();
			var valor_iva = document.getElementById("txtIva").value.trim();
			var valor_neto_venta = document.getElementById("txtValorNeto").value
					.trim();

			var codigo_producto = document.getElementById("txtCodigoProducto").value
					.trim();
			var cantidad = document.getElementById("txtCantidad").value.trim();
			var valor_unitario = document.getElementById("txtValorUnitario").value
					.trim();
			var valor_total = document.getElementById("txtValorTotal").value
					.trim();
			
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/registrarVentas';
			var params = "codigo_venta=" + codigo_venta +  "&" + "cedula_cliente=" + cedula_cliente + "&"
					+ "cedula_usuario=" + cedula_usuario + "&"+ "valor_bruto_venta=" + valor_bruto_venta + "&" + "valor_iva=" + valor_iva + "&" + "valor_neto_venta="
					+ valor_neto_venta

					+ "&" + "codigo_producto=" + codigo_producto + "&"
					+ "cantidad=" + cantidad + "&" + "valor_unitario="
					+ valor_unitario + "&" + "valor_total=" + valor_total;

			
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
		document.getElementById('txtCodigoVenta').value = '';
		
		document.getElementById('txtCedulaCliente').value = '';
		document.getElementById('txtCedulaUsuario').value = '';
		document.getElementById('txtValorBruto').value = '';
		document.getElementById('txtIva').value = '';
		document.getElementById('txtValorNeto').value = '';

		document.getElementById('txtCodigoProducto').value = '';
		document.getElementById('txtCantidad').value = '';
		document.getElementById('txtValorUnitario').value = '';
		document.getElementById('txtValorTotal').value = '';
		
	}

	function eliminar() {
		var codigo = document.getElementById("txtCodigoVenta").value.trim();
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/eliminarVenta';
		var params = "codigo_venta=" + codigo;
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


		/*
	 function actualizar() {
	 var cedula_cliente = document.getElementById("txtCedulaCliente").value
	 .trim();
	 var cedula_usuario = document.getElementById("txtCedulaUsuario").value
	 .trim();
	 var valor_bruto_venta = document.getElementById("txtValorBruto").value
	 .trim();
	 var valor_iva = document.getElementById("txtIva").value.trim();
	 var valor_neto_venta = document.getElementById("txtValorNeto").value
	 .trim();

	 var codigo_producto = document.getElementById("txtCodigoProducto").value
	 .trim();
	 var cantidad = document.getElementById("txtCantidad").value.trim();
	 var valor_unitario = document.getElementById("txtValorUnitario").value
	 .trim();
	 var valor_total = document.getElementById("txtValorTotal").value.trim();
	 var codigo_venta = document.getElementById("txtCodigoVenta").value
	 .trim();

	 var http = new XMLHttpRequest();
	 var url = '/Grupo11Villavicencio/actualizarVenta';
	 var params = "cedula_cliente=" + cedula_cliente + "&"
	 + "cedula_usuario=" + cedula_usuario + "&"
	 + "valor_bruto_venta=" + valor_bruto_venta + "&" + "valor_iva="
	 + valor_iva + "&" + "valor_neto_venta=" + valor_neto_venta

	 + "&" + "codigo_producto=" + codigo_producto + "&"
	 + "cantidad=" + cantidad + "&" + "valor_unitario="
	 + valor_unitario + "&" + "valor_total=" + valor_total + "&"
	 + "codigo_venta=" + codigo_venta;

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
	 */
</script>
</head>
<body class="bodyregister">
	<br>
	<div class="btn-opciones-general">
		<center>
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
				<a href="/Grupo11Villavicencio/CrumVentas.jsp"> Ventas</a>
			</button>
			<button>
				<a href="/Grupo11Villavicencio/ConsultaProveedores.jsp">
					Reportes</a>
			</button>
		</center>
	</div>
	<br>
	<br>

	<center>
		<h1 id="titulo">GESTIÓN DE VENTAS</h1>
	</center>
	<br>
	<div class="row">
		<tr>
			<td><label for="txtCodigoVenta">Código Venta:</label></td>
			<td><input type="text" id="txtCodigoVenta" name="codigo_venta"></td>
		</tr>

		<div class="column">
			<h2 id="subtitulo">Detalle Venta:</h2>
			<table>
				<tr>
					<td><label for="txtCedulaCliente">Cedula Cliente:</label></td>
					<td><input type="text" id="txtCedulaCliente"
						name="cedula_cliente"></td>
				</tr>
				<tr>
					<td><label for="txtCedulaUsuario">Cedula Usuario:</label></td>
					<td><input type="text" id="txtCedulaUsuario"
						name="cedula_usuario"></td>
				</tr>
				<tr>
					<td><label for="txtValorBruto">Valor Bruto Venta:</label></td>
					<td><input type="email" id="txtValorBruto"
						name="valor_bruto_venta"></td>
				</tr>
				<tr>
					<td><label for="txtIva">Valor IVA:</label></td>
					<td><input type="text" id="txtIva" name="valor_iva"></td>
				</tr>
				<tr>
					<td><label for="txtValorNeto">Valor Neto Venta:</label></td>
					<td><input type="text" id="txtValorNeto"
						name="valor_neto_venta"></td>
				</tr>
			</table>
		</div>
		<div class="column">
			<h2 id="subtitulo">Detalle Producto:</h2>
			<table>
				<tr>
					<td><label for="txtCodigoProducto">Código Producto:</label></td>
					<td><input type="text" id="txtCodigoProducto"
						name="codigo_producto"></td>
				</tr>
				<tr>
					<td><label for="txtCantidad">Cantidad:</label></td>
					<td><input type="text" id="txtCantidad" name="cantidad"></td>
				</tr>
				<tr>
					<td><label for="txtValorUnitario">Valor Unitario:</label></td>
					<td><input type="email" id="txtValorUnitario"
						name="valor_unitario"></td>
				</tr>
				<tr>
					<td><label for="txtValorTotal">Valor Total:</label></td>
					<td><input type="text" id="txtValorTotal" name="valor_total"></td>
				</tr>
			</table>
		</div>

	</div>
	<br>
	<br>
	<br>
	<div class="btn-opciones">
		<center>
			<button onclick="sendData()">Crear</button>
			<button onclick="eliminar()">Borrar</button>
			<button onclick="clearFields()">Cancelar</button>
		</center>
	</div>
	<br>
	<br>

</body>
</html>