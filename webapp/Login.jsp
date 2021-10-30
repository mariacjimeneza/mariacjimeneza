<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Tienda virtual: ingreso de usuarios</title>
<link rel="stylesheet" type="text/css" href="stylelogin.css" />

<script>
	function enviarDatos() {
		if (validarDatos()) {
			alert("todo ok");
			var user = document.getElementById("txtUser").value.trim();
			var pass = document.getElementById("txtPass").value.trim();

			//SEÑORAS Y SEÑORES EL FAMOSO OBJETO CMLHTTPREQUEST
			var http = new XMLHttpRequest();

			var url = '/Grupo11Villavicencio';
			var params = "user=" + user + "&" + "pass=" + pass;

			http.open('POST', url, true);
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);

				}
			}

		} else {
			alert("algo va mal")
		}

		return;
	}
	function validarDatos() {
		if (document.getElementById("txtUser").value.length == 0) {
			alert("El campo usuario está vacío");
			return false;
		} else if (document.getElementById("txtPass").value.length == 0) {
			alert("El campo password está vacío");
			return false;

		} else {
			return true;
		}

	}
</script>
</head>
<body class="bodylogin">
	<center>
		<h1 id="titulo">INICIAR SESIÓN</h1>
	</center>
	<br>
	<div class="login">
		<form id="login" action="http://localhost:8080/TiendaVirtualApp"
			method="post">
			<label><b> Usuario:</b> </label> <input type="text" id="txtUser"
				name="user"> </input> <br> <br> <label><b>
					Password:</b> </label> <input type="password" id="txtPass" name="pass">
			</input><br> <br>

			<!--  
		<table border='1'>

			<tr>
				<td>Usuario:</td>
				<td><input type="text" id="txtUser" name="user"> </input></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="password" id="txtPass" name="pass"> </input></td>
			</tr>

		</table>
		<!--  <br /> <input type="submit" value="Ingresar">
		-->
		</form>
		<button name="log" onclick='enviarDatos()'>Login</button>
		<br> <a href="RegistroUsuarios.jsp"> Ir a página de registro
		</a>

	</div>

</body>
</html>