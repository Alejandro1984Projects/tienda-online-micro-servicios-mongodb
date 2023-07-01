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
        #menu label{margin-left: 15px;}
        #cedula{margin-left:75px;}
        #telefono{margin-left:60px;}
        #direccion{margin-left: 60px;}
        #consulta{text-align: center;}
        #sectiondatos{
            display: grid;
            grid-template-columns: 50% 50%;
            margin-top: 100px;
        }
        #sectiondatos div{
            text-align: center;
            padding: 30px;
        }
        #botones div{
            text-align: center;
            margin: 30px;            
        }
        #botones div button{margin-left: 30px;background-color: lightblue;}
        input{text-align:center;}
    </style>
    <script>
    function limpiarentradas(){
    	var cedula=document.getElementById("cedula");
    	cedula.value="";
    	var direccion=document.getElementById("direccion");
    	direccion.value="";
    	var correo=document.getElementById("correo");
		correo.value="";
		var nombre=document.getElementById("nombre");
		nombre.value="";
    	var telefono=document.getElementById("telefono");
    	telefono.value="";
    	
    	
    	
    }
    function comenzar(){
    var botonconsultar=document.getElementById("consultar");
	botonconsultar.addEventListener("click",function(){
		var cedula=parseInt(document.getElementById("cedula").value);
		if(cedula!="" && !Number.isNaN(cedula)){
		fetch('http://localhost:5002/clientes/buscarporID/'+cedula)
		.then(response => response.json())
        .then(json => { 
        	if(json.cedula_cliente!=null){
        	var direccion=document.getElementById("direccion");
    		var correo=document.getElementById("correo");
    		var nombre=document.getElementById("nombre");
        	var telefono=document.getElementById("telefono");
    		direccion.value=json.direccion_cliente;
    		correo.value=json.email_cliente;
    		nombre.value=json.nombre_cliente;
    		telefono.value=json.telefono_cliente;
        	}else{
        		alert("Cliente Inexistente");
        		limpiarentradas();}
        });  
		}else{
    		alert("Cliente Inexistente");
    		limpiarentradas();}
        },false);
	var botoncrear=document.getElementById("crear");
	botoncrear.addEventListener("click",function(){
		var cedula=parseInt(document.getElementById("cedula").value);
		var direccion=document.getElementById("direccion").value;
		var correo=document.getElementById("correo").value;
		var nombre=document.getElementById("nombre").value;
		var telefono=document.getElementById("telefono").value;
		if(cedula!="" && !Number.isNaN(cedula) && direccion!="" &&
				correo!="" && nombre!="" && telefono!=""){    			
		fetch('http://localhost:5002/clientes/guardar', {
            method: 'POST',
            body: JSON.stringify({
            	cedula_cliente: cedula,
            	direccion_cliente: direccion,
            	email_cliente: correo,
            	nombre_cliente: nombre,
            	telefono_cliente: telefono                      
            }),
            headers: {
                "Content-type": "application/json"
            }});
		alert("Cliente Creado");
		}else{alert("Faltan datos del cliente");}
		limpiarentradas();
        },false);
	var botonactualizar=document.getElementById("actualizar");
	botonactualizar.addEventListener("click",function(){
		var cedula=parseInt(document.getElementById("cedula").value);
		var direccion=document.getElementById("direccion").value;
		var correo=document.getElementById("correo").value;
		var nombre=document.getElementById("nombre").value;
		var telefono=document.getElementById("telefono").value;
		if(cedula!="" && !Number.isNaN(cedula) && direccion!="" &&
				correo!="" && nombre!="" && telefono!=""){
        			alert("Datos del Cliente Actualizados");
		fetch('http://localhost:5002/clientes/actualizar', {
            method: 'PUT',
            body: JSON.stringify({
            	cedula_cliente: cedula,
            	direccion_cliente: direccion,
            	email_cliente: correo,
            	nombre_cliente: nombre,
            	telefono_cliente: telefono                      
            }),
            headers: {
                "Content-type": "application/json"
            }});
		}else{alert("Datos faltantes");}
		limpiarentradas();
        },false);
	var botonborrar=document.getElementById("borrar");
	botonborrar.addEventListener("click",function(){
		var cedula=parseInt(document.getElementById("cedula").value);
		if(cedula!="" && !Number.isNaN(cedula)){
			fetch('http://localhost:5002/clientes/buscarporID/'+cedula)
    		.then(response => response.json())
            .then(json => {        			
			if(json.cedula_cliente!=null){
				alert("Datos del cliente Borrados");
			fetch('http://localhost:5002/clientes/eliminar/'+cedula, {
				method: 'DELETE'				
			});
			}else{alert("Cedula Errada");}
            });
		}else{alert("Cedula Errada");}
		limpiarentradas();
        },false);
        
            var etiquetaclientes=document.getElementById("clientes");
            etiquetaclientes.style.backgroundColor="lightblue";
            var etiquetas=document.getElementsByName("opcion");
            etiquetas.forEach(function(etiqueta){
                etiqueta.addEventListener("mouseover",function(){
                etiqueta.style.backgroundColor="lightblue";},false);
                etiqueta.addEventListener("mouseleave" ,function(){
                etiqueta.style.backgroundColor="white";
                etiquetaclientes.style.backgroundColor="lightblue";},false);           
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
            <label name="opcion" id="clientes">Clientes</label>
            <label name="opcion" onclick="location.href='Ventas.jsp';">
            Ventas</label>                                  
            <label name="opcion" onclick="location.href='Reportes.jsp';">
            Reportes</label> 
            <label name="opcion" onclick="location.href='Consolidacion.jsp';">
            Consolidacion</label>                        
        </div>
    </section>
    <a href='Login.jsp?cerrarsesion=true'><h5>Cerrar Sesion</h5></a>
    <section id="sectiondatos">
        <div>
            Cedula<input type="text" id="cedula">
        </div>
        <div>
            Telefono <input type="text" id="telefono"> 
        </div>
        <div>
            Nombre Completo <input type="text" id="nombre">
        </div>
        <div>
            Correo electronico <input type="text" id="correo">
        </div>
        <div>
            Direccion <input type="text" id="direccion">
        </div> 
    </section>
    <section id="botones">
        <div>
            <button id="consultar">Consultar</button>
            <button id="crear">Crear</button>
            <button id="actualizar">Actualizar</button>
            <button id="borrar">Borrar</button>
        </div>        
    </section>
</body>
</html>