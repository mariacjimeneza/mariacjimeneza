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

.bodyregister {
	margin: 15px 15px;
	padding: 0;
	background-color: LightBlue;
	font-family: 'Arial';
}

.input_cliente input {
	width: 15%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin: 15px 20px;
	float: center;
}

input {
	width: 10%;
	padding: 12px 20px;
	margin: 8px 8px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input_user input {
	width: 15%;
	float: right;
	clear: both;
}

div.container {
	width: 98%;
	margin: 1%;
}

td {
	text-align: center;
}

.row {
	margin-left: 50px;
	margin-right: -50px;
	top: 10%;
}

.column {
	float: left;
	width: 20%;
	padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
	content: "";
	clear: both;
	display: table;
}

/*
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 5%;
	border: 1px solid #ddd;
	margin-left: 70px;
}

*/

/*botones*/
button {
	border: 1px solid black; /* Green border */
	color: black; /* White text */
	padding: 10px 24px; /* Some padding */
	cursor: pointer; /* Pointer/hand icon */
	width: 15%; /* Set a width if needed */
	top: 10%;
	/*display: block;  Make the buttons appear below each other */
	/*display: block; */
	border-radius: 10px;
	margin-bottom: 10px;
}

/* Add a background color on hover */
button:hover {
	background-color: #CD5C5C;
}

/*
th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
*/
</style>

<script type='text/javascript'>
	function consultar() {
		var cedula = document.getElementById("txtCedulaCliente").value.trim();

		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/consultarVenta';
		var params = "cedula_cliente=" + cedula;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				alert(http.responseText);
				//var myArr = JSON.parse(http.responseText);

				document.getElementById('txtName').value = http.responseText;
				//myArr.nombre;

			}
		}
		http.send(params);
	}

	function addFields() {
		// Number of inputs to create
		var number = document.getElementById("member").value;

		// Container <div> where dynamic content will be placed
		var container = document.getElementById("container");
		// Clear previous contents of the container
		while (container.hasChildNodes()) {
			container.removeChild(container.lastChild);

		}
		// Append a line break 
		container.appendChild(document.createElement("br"));

		for (i = 0; i < number; i++) {

			// Append a node with a random text
			//container.appendChild(document.createTextNode("Member " + i));

			// Create an <input> element, set its type and name attributes
			var input1 = document.createElement("input");
			input1.type = "text";
			input1.name = "codigo_producto";
			input1.id = "txtCodigoProducto" + i;
			//input1.value = '';
			container.appendChild(input1);

			// Create a button element, set its type and name attributes
			var add_button = document.createElement("button");
			add_button.innerHTML = 'Consultar';
			add_button.id = "button" + i;

			add_button.onclick = function() {
				alert("button was clicked");
				consultarProducto(this)
			};
			container.appendChild(add_button);

			// Create an <input> element, set its type and name attributes
			var input2 = document.createElement("input");
			input2.type = "text";
			input2.name = "nombre_producto";
			input2.id = "txtNombreProducto" + i;
			container.appendChild(input2);

			// Create an <input> element, set its type and name attributes
			var input4 = document.createElement("input");
			input4.type = "text";
			input4.name = "precio_venta";
			input4.id = "txtPrecioVenta" + i;
			container.appendChild(input4);

			// Create an <input> element, set its type and name attributes
			var input6 = document.createElement("input");
			input6.type = "text";
			input6.name = "iva_compra";
			input6.id = "txtIvaCompra" + i;
			container.appendChild(input6);

			// Create an <input> element, set its type and name attributes
			var input3 = document.createElement("input");
			input3.type = "text";
			input3.name = "cantidad" + i;
			input3.id = "txtCantidad" + i;
			container.appendChild(input3);

			// Create an <input> element, set its type and name attributes
			var input5 = document.createElement("input");
			input5.type = "text";
			input5.name = "valor_total" + i;
			input5.id = "txtValorTotal" + i;
			container.appendChild(input5);

			// Append a line break 
			container.appendChild(document.createElement("br"));
		}

	}

	function consultarProducto(button) {
		if (button.id === "button0") {
			var cedula = document.getElementById("txtCodigoProducto0").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto0').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta0').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra0').value = myArr.iva_compra;
				}
			};
			http.send(params);
		} else if (button.id === "button1") {
			var cedula = document.getElementById("txtCodigoProducto1").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto1').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta1').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra1').value = myArr.iva_compra;
				}
			};
			http.send(params);
		} else if (button.id === "button2") {
			var cedula = document.getElementById("txtCodigoProducto2").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto2').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta2').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra2').value = myArr.iva_compra;
				}
			};
			http.send(params);
		} else if (button.id === "button3") {
			var cedula = document.getElementById("txtCodigoProducto3").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto3').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta3').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra3').value = myArr.iva_compra;
				}
			};
			http.send(params);
		} else if (button.id === "button4") {
			var cedula = document.getElementById("txtCodigoProducto4").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto4').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta4').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra4').value = myArr.iva_compra;
				}
			};
			http.send(params);
		} else if (button.id === "button5") {
			var cedula = document.getElementById("txtCodigoProducto5").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto5').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta5').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra5').value = myArr.iva_compra;
				}
			};
			http.send(params);
		} else if (button.id === "button6") {
			var cedula = document.getElementById("txtCodigoProducto6").value
					.trim();
			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/consultarProducto';
			var params = "codigo_producto = " + cedula;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
					var myArr = JSON.parse(http.responseText);
					document.getElementById('txtNombreProducto6').value = myArr.nombre_producto;
					document.getElementById('txtPrecioVenta6').value = myArr.precio_venta;
					document.getElementById('txtIvaCompra6').value = myArr.iva_compra;
				}
			};
			http.send(params);
		}

	}

	function calculate() {
		var sumTotal = 0;
		var sumIva = 0;
		for (i = 0; i < document.getElementById('member').value; i++) {
			//Cálculo valor total
			var myBox1 = document.getElementById('txtCantidad' + i).value;
			var myBox2 = document.getElementById('txtPrecioVenta' + i).value;
			var result = document.getElementById('txtValorTotal' + i);
			var myResult = myBox1 * myBox2;

			document.getElementById('txtValorTotal' + i).value = myResult;

			//Cálculo total venta
			sumTotal += myResult;

			//Cálculo total IVA
			var myBox3 = document.getElementById('txtCantidad' + i).value;
			var myBox4 = document.getElementById('txtIvaCompra' + i).value;
			var myResult1 = myBox3 * myBox4;
			sumIva += myResult1;
		}

		document.getElementById('box1').value = sumTotal;
		document.getElementById('box2').value = sumIva;

		//Cálculo total con iva
		var myResult2 = sumTotal + sumIva;
		document.getElementById('box3').value = myResult2;

	}

	function validateFields() {
		if (document.getElementById("txtCodigoVenta").value.trim().length == 0) {
			alert("El campo código venta está vacío.");
			return false;
		} else if (document.getElementById("txtCedulaCliente").value.trim().length == 0) {
			alert("El campo cedula cliente está vacío.");
			return false;
		} else if (document.getElementById("txtCedulaUsuario").value.trim().length == 0) {
			alert("El campo cedula usuario está vacío.");
			return false;
		} else if (document.getElementById("box1").value.trim().length == 0) {
			alert("El campo valor bruto venta está vacío.");
			return false;
		} else if (document.getElementById("box2").value.trim().length == 0) {
			alert("El campo iva está vacío.");
			return false;
		} else if (document.getElementById("box3").value.trim().length == 0) {
			alert("El campo valor neto venta está vacío.");
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
			var valor_bruto_venta = document.getElementById("box1").value
					.trim();
			var valor_iva = document.getElementById("box2").value.trim();
			var valor_neto_venta = document.getElementById("box3").value.trim();

			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/registrarVentas';
			var params = "codigo_venta=" + codigo_venta + "&"
					+ "cedula_cliente=" + cedula_cliente + "&"
					+ "cedula_usuario=" + cedula_usuario + "&"
					+ "valor_bruto_venta=" + valor_bruto_venta + "&"
					+ "valor_iva=" + valor_iva + "&" + "valor_neto_venta="
					+ valor_neto_venta;

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
		document.getElementById('member').value = '';

		document.getElementById('box1').value = '';
		document.getElementById('box2').value = '';
		document.getElementById('box3').value = '';
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
				<a href="/Grupo11Villavicencio/Estadisticas.jsp">
					Reportes</a>
			</button>
		</center>
	</div>
	<br>
	<br>
	<center>
		<h1 id="titulo">RESUMEN VENTA</h1>
	</center>

	<table border="0" width="90%" class="input_cliente ">
		<tr>
			<td width="150"></td>
			<td width="200"></td>
			<td width="150"></td>
			<td width="150"></td>
			<td width="150"></td>
			<td width="120">Id Usuario:</td>
			<td width="200"><input type="text" id="txtCedulaUsuario"
				name="cedula_usuario" style="width: 95%;" /></td>
		</tr>
	</table>
	<center>

		<div class="input_cliente">

			<td><label for="txtCedulaCliente">Cedula:</label></td>
			<td><input type="text" id="txtCedulaCliente"
				name="cedula_cliente"></td>

			<td>
				<button onclick="consultar()">Consultar</button>
			</td>

			<td><label for="txtName">Cliente:</label></td>
			<td><input type="text" id="txtName" name="nombre"></td>
			<td><label for="txtCodigoVenta">Codigo Venta:</label></td>
			<td><input type="text" id="txtCodigoVenta" name="codigo_venta"></td>
		</div>
	</center>

	<br />

	<table border="0" width="90%" class="input_cliente ">
		<tr>
			<td width="40"></td>
			<td width="100">No.Prod:</td>
			<td width="90"><input type="text" id="member" name="member"
				value="" style="width: 100%;" /></td>
			<td width="150"><a href="#" id="filldetails"
				onclick="addFields()"> Agregar</a></td>
			<td width="150"></td>
			<td width="200"></td>
			<td width="150"></td>

		</tr>
	</table>
	<br />

	<center>
		<hr
			style="width: 80%; text-align: center; margin-left: 30; color: black">

		<table border="0" width="81%">
			<tr>
				<td width="150">Cod. Producto</td>
				<td width="200"></td>
				<td width="150">Nombre Producto</td>
				<td width="150">Precio</td>
				<td width="150">Iva</td>
				<td width="150">Cant.</td>
				<td width="150">Vlr. Total</td>
			</tr>
		</table>
		<hr
			style="width: 80%; text-align: center; margin-left: 30; color: black">

		<div id="container"></div>

		<table border="0" width="80%">
			<tr>
				<td width="170"></td>
				<td width="250"></td>
				<td width="170"></td>
				<td width="170"></td>
				<td width="185"></td>
				<td width="170">Total venta</td>
				<td><input id="box1" type="text" oninput="calculate();"
					style="width: 95%;" /></td>
			</tr>
			<tr>
				<td width="170"></td>
				<td width="250"></td>
				<td width="170"></td>
				<td width="170"></td>
				<td width="185"><button style="width: 95%;"
						onclick="calculate()">Calcular</button></td>
				<td width="170">Total IVA</td>
				<td><input id="box2" type="text" oninput="calculate();"
					style="width: 95%;" /></td>
			</tr>
			<tr>
				<td width="170"></td>
				<td width="250"></td>
				<td width="170"></td>
				<td width="170"></td>
				<td width="185"></td>
				<td width="170">Total con IVA</td>
				<td><input id="box3" type="text" oninput="calculate();"
					style="width: 95%;" /></td>
			</tr>

		</table>
		<hr
			style="width: 80%; text-align: center; margin-left: 30; color: black">
		<br> <br>
		<td>
			<button onclick="sendData()">Enviar</button>
			<button onclick="eliminar()">Eliminar</button>
			<button onclick="clearFields()">Cancelar</button>

		</td>

	</center>
</body>
</html>