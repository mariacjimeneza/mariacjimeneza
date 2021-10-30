<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: consulta de productos</title>
<style>
.bodyProductos {
	background-color: #6abadeba;
	font-family: 'Arial';
}

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
	function consultar() {
		var codigo_producto = document.getElementById("txtCodigoProducto").value
				.trim();
		if (codigo_producto.trim() == "") {
			codigo_producto = "null";
		}
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/consultarProductos';
		var params = "codigo_producto=" + codigo_producto;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				alert(http.responseText);
				CreateTableFromJSON(http.responseText);

			}
		}
		http.send(params);
	}

	function CreateTableFromJSON(json_result) {

		const json_arr = JSON.parse(json_result);

		// EXTRACT VALUE FOR HTML HEADER. 	
		var col = [];
		for (var i = 0; i < json_arr.length; i++) {
			for ( var key in json_arr[i]) {
				if (col.indexOf(key) === -1) {
					col.push(key);
				}
			}
		}

		// CREATE DYNAMIC TABLE.
		var table = document.createElement("table");
		table.setAttribute("border", "1");

		// CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

		var tr = table.insertRow(-1); // TABLE ROW.

		for (var i = 0; i < col.length; i++) {
			var th = document.createElement("th"); // TABLE HEADER.
			th.innerHTML = col[i];
			tr.appendChild(th);
		}

		// ADD JSON DATA TO THE TABLE AS ROWS.
		for (var i = 0; i < json_arr.length; i++) {

			tr = table.insertRow(-1);

			for (var j = 0; j < col.length; j++) {
				var tabCell = tr.insertCell(-1);
				tabCell.innerHTML = json_arr[i][col[j]];
			}
		}

		// FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
		var divContainer = document.getElementById("dvResult");
		divContainer.innerHTML = "";
		divContainer.appendChild(table);
	}
</script>
</head>
<body class="bodyProductos">
	<center>
		<h2>Consulta de Productos</h2>
		<br>
		<table>
			<tr>
				<td><label for="txtCodigoProducto">codigo_producto:</label></td>
				<td><input type="text" id="txtCodigoProducto"
					name="codigo_producto"></td>
				<td><button onclick="consultar()">Consultar</button></td>
			</tr>
		</table>
		<div id="dvResult"></div>
		<br>
		<br>
		<input type="button" value="Go back!"
			onclick="history.back()">
	</center>
</body>
</html>