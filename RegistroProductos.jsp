<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda virtual: registro de productos</title>
<script>
	function validateFields() {
		if (document.getElementById("txtCodigoProducto").value.trim().length == 0) {
			alert("El campo codigo del producto está vacío.");
			return false;
		}else if (document.getElementById("txtNombreProducto").value.trim().length == 0) {
			alert("El campo nombre del producto está vacío.");
			return false;
		} else if (document.getElementById("txtNitProveedor").value.trim().length == 0) {
			alert("El campo nit del proveedor está vacío.");
			return false;
		} else if (document.getElementById("txtPrecioCompra").value.trim().length == 0) {
			alert("El campo precio de compra está vacío.");
			return false;
		} else if (document.getElementById("txtIvaCompra").value.trim().length == 0) {
			alert("El campo iva del producto está vacío.");
			return false;
		} else if (document.getElementById("txtPrecioVenta").value.trim().length == 0) {
			alert("El campo precio de venta está vacío.");
			return false;	
		} else {
			return true;
		}
	}

	function sendData() {
		if (!validateFields()) {
			return;
		} else {
			var codigo_producto = document.getElementById("txtCodigoProducto").value.trim();
			var nombre_producto = document.getElementById("txtNombreProducto").value.trim();
			var nit_proveedor = document.getElementById("txtNitProveedor").value
					.trim();
			var precio_compra = document.getElementById("txtPrecioCompra").value.trim();
			var iva_compra = document.getElementById("txtIvaCompra").value.trim();
			var precio_venta= document.getElementById("txtPrecioVenta").value.trim();

			var http = new XMLHttpRequest();
			var url = '/Grupo11Villavicencio/registrarProducto';
			var params = "codigo_producto=" + codigo_producto + "&" + "nombre_producto=" + nombre_producto + "&"
					+ "nit_proveedor=" + nit_proveedor + "&" + "precio_compra=" + precio_compra
					+ "&" + "iva_compra=" + iva_compra + "&" + "precio_venta=" + precio_venta;
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
	<h1>Registro de Productos</h1>
	<table>
		<tr>
			<td><label for="txtCodigoProducto">Codigo Producto:</label></td>
			<td><input type="text" id="txtCodigoProducto" name="codigo_producto"></td>
		</tr>
		<tr>
			<td><label for="txtNombreProducto">Nombre Producto</label></td>
			<td><input type="text" id="txtNombreProducto" name="nombre_producto"></td>
		</tr>
		<tr>
			<td><label for="txtNitProveedor">Nit Proveedor:</label></td>
			<td><input type="text" id="txtNitProveedor" name="nit_proveedor"></td>
		</tr>
		<tr>
			<td><label for="txtPrecioCompra">Precio Compra</label></td>
			<td><input type="text" id="txtPrecioCompra" name="precio_compra"></td>
		</tr>
		<tr>
			<td><label for="txtIvaCompra">Iva Compra:</label></td>
			<td><input type="email" id="txtIvaCompra" name="iva_compra"></td>
		</tr>
		<tr>
			<td><label for="txtPrecioVenta">Precio Venta:</label></td>
			<td><input type="text" id="txtPrecioVenta" name="precio_venta"></td>
		</tr>
		<tr>
			<td><button onclick="sendData()">Enviar Datos</button></td>
			<td><button onclick="clearForm()">Cancelar</button></td>
		</tr>
	</table>
	
</body>
</html>