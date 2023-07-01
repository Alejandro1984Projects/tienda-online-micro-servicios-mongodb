<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
        #titulo{color: white; background-color: lightblue;}
        #titulo h1{margin-left: 15px;}
        #menu{border: 3px solid;border-color:lightblue;}
        #menu label{margin-left: 15px;}
        #titulotabla{margin-top:30px; text-align: center;}
        #divtabla table{margin-left: auto;margin-right: auto;text-align: center;}
        table,td{border: 3px solid;border-color: lightblue;}
        #tablahead{background-color: lightblue;}
        #divtotalventas{margin-top:30px;text-align: center;}
    </style>
    <script>
	var tabla=null;
	var totalventas=0;

    function ventasBogota(array){
    	var ventasbogota=0;
    	array.forEach(venta=>{
    		ventasbogota+=venta.total_venta;
    	});
    	var tr=document.createElement("tr");
    	var nombreciudad=document.createElement("td");
    	var ventas=document.createElement("td");
    	nombreciudad.innerHTML="Bogota";
    	ventas.innerHTML=ventasbogota;
    	ventas.style.textAlign="right";
    	tr.appendChild(nombreciudad);
    	tr.appendChild(ventas);
    	tabla.appendChild(tr);
		totalventas+=ventasbogota;
    	document.getElementById("totalventastienda").value=totalventas;    	
    }
    	function comenzar(){
    		tabla=document.querySelector("#tablabody");
    		fetch('http://localhost:5003/ventas/listar')
    		.then(response => response.json())
            .then(array => {
            	if(array.length!=0){
            		ventasBogota(array);
            	}
            });
    		var etiquetareportes=document.getElementById("consolidacion");
        	etiquetareportes.style.backgroundColor="lightblue";
        	var etiquetas=document.getElementsByName("opcion");
            etiquetas.forEach(function(etiqueta){
                etiqueta.addEventListener("mouseover",function(){
                etiqueta.style.backgroundColor="lightblue";},false);
                etiqueta.addEventListener("mouseleave" ,function(){
                etiqueta.style.backgroundColor="white";
            	etiquetareportes.style.backgroundColor="lightblue";
                },false);           
            });
    	}
        window.addEventListener("load", comenzar,false);
    </script>
</head>
<body>
<%
HttpSession sesion=request.getSession();
if(sesion.getAttribute("iniciarsesion")==null){	
	out.print("<script>location.replace('Login.jsp');</script>");
}
%>
<section>
        <div id="titulo">
            <h1>Cadena de Tiendas La Generica</h1>
        </div>
        <div id="menu">
            <label name="opcion" onclick="location.href='Productos.jsp';">
            Productos</label>
            <label name="opcion" onclick="location.href='Clientes.jsp';">
            Clientes</label>
            <label name="opcion" onclick="location.href='Ventas.jsp';">
            Ventas</label>                        
            <label name="opcion" onclick="location.href='Reportes.jsp';">
            Reportes</label> 
            <label name="opcion" id="consolidacion">
            Consolidacion</label>                        
        </div>
    </section>
    <a href='Login.jsp?cerrarsesion=true'><h5>Cerrar Sesion</h5></a>
    <div id="titulotabla"><h3>Total de Ventas por Ciudad</h3></div>
    <section id="sectiontabla">
    <div id="divtabla">
    <table>
    <thead id="tablahead">
    <tr><td>Ciudad</td><td>Valor Total Ventas</td></tr>
    </thead>
    <tbody id="tablabody"></tbody>
    </table>
    </div>
    </section>
    <section><div id="divtotalventas">
    Total Ventas Tienda $ <input id="totalventastienda" style="text-align:center">
    </div></section>    
</body>
</html>