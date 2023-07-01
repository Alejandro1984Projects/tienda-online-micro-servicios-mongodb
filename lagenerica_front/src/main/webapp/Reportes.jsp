<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<style>
        #titulo{color: white; background-color: lightblue;}
        #titulo h1{margin-left: 15px;}
        #menu{border: 3px solid;border-color:lightblue;}
        #menu label{color: black; margin-left: 15px;}
        #sectionbotones{text-align: center; margin-top: 70px;}
        #sectionbotones button{margin-top:30px;background-color: lightblue;}
        #titulotabla{margin-top:30px; text-align: center;}
        #divtabla table{margin-left: auto;margin-right: auto;text-align: center;}
        table,tr,td{border: 3px solid;border-color: lightblue;}
        #divtotalventas{margin-top:30px;text-align: center;}
    </style>
    <script>
    function borrarTabla(){
    	const tablahead=document.querySelector("#tablahead");
		tablahead.innerHTML="";
		const tablabody=document.querySelector("#tablabody");
		tablabody.innerHTML="";
		const divtotalventas=document.querySelector("#divtotalventas");
		divtotalventas.innerHTML="";		
    }
    function mostrarTablaClientes(clientes){
    	const tabla=document.querySelector("#tablabody");
    	clientes.forEach((cliente)=>{
    		
    		var tr=document.createElement("tr");
    		var td1=document.createElement("td");
    		var td2=document.createElement("td");
    		var td3=document.createElement("td");
    		var td4=document.createElement("td");
    		var td5=document.createElement("td");
    		
    		td1.innerHTML=cliente.cedula_cliente;
    		td2.innerHTML=cliente.nombre_cliente;
    		td3.innerHTML=cliente.email_cliente;
    		td4.innerHTML=cliente.direccion_cliente;
    		td5.innerHTML=cliente.telefono_cliente;
    		
    		tr.appendChild(td1);
    		tr.appendChild(td2);
    		tr.appendChild(td3);
    		tr.appendChild(td4);
    		tr.appendChild(td5);
    		
    		tabla.appendChild(tr);
			               		
    	});
    }
    function mostrarTabla(n_array){
		const tabla=document.querySelector("#tablabody");
		const divtotalventas=document.querySelector("#divtotalventas");
    	var grupos=[];
		var mostrartotal=0;
    	n_array.forEach(objeto=>{
    		const n_id=objeto.cedula_cliente;
    		if(!grupos[n_id]) {
    			grupos[n_id]=[];
    			}
    			grupos[n_id].push(objeto);	
    	});
    	grupos.forEach(array=>{
    		var id=0;
    		var nombre="";
    		var venta=0;
		array.forEach((json)=>{
			
			id=json.cedula_cliente;
			nombre=json.nombre_cliente;
			venta+=json.total_venta;
    		mostrartotal+=json.total_venta;
    	});
		var tr=document.createElement("tr");
		var td1=document.createElement("td");
		var td2=document.createElement("td");
		var td3=document.createElement("td");
		td1.innerHTML=id;
		td2.innerHTML=nombre;
		td3.innerHTML=venta;
		td3.style.textAlign="right";
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tabla.appendChild(tr);
		                          
    	});
    	divtotalventas.innerHTML="Total Ventas $ "+mostrartotal;
    }
        function comenzar(){
        	        	
        	var listaclientes=document.getElementById("listaclientes");           
        	listaclientes.addEventListener("click",function(){
        		borrarTabla();
        		const titulotabla=document.querySelector("#titulotabla");
        		titulotabla.innerHTML="<h3 style='background-color:lightblue'>Listado de Clientes</h3>";
        		const tablahead=document.querySelector("#tablahead");
        		const trhead=document.createElement("tr");
        		let tdcedulahead=document.createElement("td");
        		let tdnombrehead=document.createElement("td");
        		let tdcorreohead=document.createElement("td");
        		let tddireccionhead=document.createElement("td");
        		let tdtelefonohead=document.createElement("td");
        		
        		tdcedulahead.appendChild(
        				document.createTextNode(`${"Cedula"}`));
        		tdnombrehead.appendChild(
        				document.createTextNode(`${"Nombre"}`));
        		tdcorreohead.appendChild(
        				document.createTextNode(`${"CorreoElectronico"}`));
        		tddireccionhead.appendChild(
        				document.createTextNode(`${"Direccion"}`));
        		tdtelefonohead.appendChild(
        				document.createTextNode(`${"Telefono"}`));
        		
        		trhead.appendChild(tdcedulahead);
        		trhead.appendChild(tdnombrehead);
        		trhead.appendChild(tdcorreohead);
        		trhead.appendChild(tddireccionhead);
        		trhead.appendChild(tdtelefonohead);
        		
        		tablahead.appendChild(trhead);        		
        		
        		fetch('http://localhost:5002/clientes/listar')
        		.then(response => response.json())
                .then(clientes => { 
                	if(clientes.length!=0){
                		mostrarTablaClientes(clientes);
                	}else{
                		titulotabla.innerHTML="";
                		borrarTabla();
                		alert("La lista esta vacia");
                	}
                });
                },false);
        	var listaventas=document.getElementById("listaventas");           
        	listaventas.addEventListener("click",function(){
        		borrarTabla();
        		const titulotabla=document.querySelector("#titulotabla");
        		titulotabla.innerHTML="<h3 style='background-color:lightblue'>Total de Ventas por Cliente</h3>";
        		const tablahead=document.querySelector("#tablahead");
        		const trhead=document.createElement("tr");
        		let tdcedulahead=document.createElement("td");
        		let tdnombrehead=document.createElement("td");
        		let tdventahead=document.createElement("td");
        		
        		tdcedulahead.appendChild(
        				document.createTextNode(`${"Cedula"}`));
        		tdnombrehead.appendChild(
        				document.createTextNode(`${"Nombre"}`));
        		tdventahead.appendChild(
        				document.createTextNode(`${"Valor Total Ventas"}`));
        		
        		trhead.appendChild(tdcedulahead);
        		trhead.appendChild(tdnombrehead);
        		trhead.appendChild(tdventahead);
        		
        		tablahead.appendChild(trhead); 		
        		
        		fetch('http://localhost:5003/ventas/listar')
        		.then(response => response.json())
                .then(array => { 
                	if(array.length!=0){  
                		mostrarTabla(array);
                		}else{
                		titulotabla.innerHTML="";
                		borrarTabla();
                		alert("La lista esta vacia");
                	}
                });
               
                },false);
                
        	var etiquetareportes=document.getElementById("reportes");
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
            <label name="opcion" id="reportes">
            Reportes</label> 
            <label name="opcion" onclick="location.href='Consolidacion.jsp';">
            Consolidacion</label>                        
        </div>
    </section>
    <a href='Login.jsp?cerrarsesion=true'><h5>Cerrar Sesion</h5></a>    
    <section id="sectionbotones">
    	<br>
        <button id="listaclientes">Listado de Clientes</button>
        
        <button id="listaventas">Ventas por Cliente</button>    
    </section>
    <div id="titulotabla"></div>
    <section id="sectiontabla">
    <div id="divtabla">
    <table>
    <thead id="tablahead"></thead>
    <tbody id="tablabody"></tbody>
    </table>
    </div>
    </section>
    <section><div id="divtotalventas"></div></section>
</body>
</html>