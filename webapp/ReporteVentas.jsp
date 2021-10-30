<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	//===================================== FUNCIONES PROPIAS =============================

	function consultar(t) {
		if (t == 1) {
			var tipo = "cliente";
		} else if (t == 0) {
			var tipo = "producto";
		}
		var http = new XMLHttpRequest();
		var url = '/Grupo11Villavicencio/resumenVentas';
		var params = "tipo=" + tipo;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {

				//alert(http.responseText);
				//CreateTableFromJSON(http.responseText);

				var datos = http.responseText;
				datos = datos.replace('[', '').replace(']', '');
				var tokens = datos.split(',');
				var tabla = [];
				tabla.push([ "Item", "Total" ]);
				for (var i = 0; i < tokens.length; i++) {
					var tokens2 = tokens[i].split(';');
					var reg = [];
					reg.push(tokens2[0].replace('"', ''));
					reg.push(parseInt(tokens2[1].replace('"', '')));
					tabla.push(reg);
				}
				drawChart(tabla);
			}
		}
		http.send(params);
	}

	// ======================================= FIN DE FUNCIONES PROPIAS ===============================================

	function drawChart(tabla) {
		/*var data = google.visualization.arrayToDataTable([
				[ 'Mes', 'Sales', 'Expenses', 'Profit' ],
				[ 'Enero', 1000, 400, 200 ], [ 'Febrero', 1170, 460, 250 ],
				[ 'Marzo', 660, 1120, 300 ], [ 'Abril', 1030, 540, 350 ] ]);
		 */
		var data = google.visualization.arrayToDataTable(tabla);

		var options = {
			chart : {
				title : 'Reporte de ventas del 2020',
				subtitle : 'Tienda Virtual',
			},
			bars : 'horizontal' // Required for Material Bar Charts.
		};

		var chart = new google.charts.Bar(document
				.getElementById('barchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>
</head>
<body>
	<br>
	<br>
	<div id="barchart_material" style="width: 900px; height: 500px;"></div>
	<br>
	<br>
	<button onclick="consultar(0)">Consultar por producto</button>
	<button onclick="consultar(1)">Consultar por cliente</button>
	<br>
		<br>
		<input type="button" value="Go back!"
			onclick="history.back()">
	
</body>
</html>
