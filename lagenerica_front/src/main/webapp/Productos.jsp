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
        #sectionentrada{text-align: center; margin-top: 250px;}
        #sectionentrada button{margin-top:30px}
	#entradaarchivo{background-color: lightblue;}
	#guardar{background-color: lightblue;}
    </style>
    <script>
        function comenzar(){
        	
        	var entradaarchivo=document.getElementById("entradaarchivo");
        	var botonguardar=document.getElementById("guardar");
        	botonguardar.addEventListener("click",function(){
        		
        		var archivo=entradaarchivo.value;
        		var extPermitidas=/(.csv)$/i;
        		if(entradaarchivo.value!=""){
        		if(!extPermitidas.exec(archivo)){
        			alert("Error: formato de archivo invalido");
        			entradaarchivo.value="";
        			return false;
        		}else{
        			let cantidadlineas=0;
        			const reader=new FileReader();
        			reader.onload=function(){
        				try{
        				const lines=reader.result.split('\n').map(function(line){
        					return line.split(',')
        				})
        				
        				for(i=0;i<lines.length;i++){
        					let codigo=parseInt(lines[i][0]);
        					let iva=parseFloat(lines[i][4]);
        					let nit=parseInt(lines[i][2]);
        					let pcompra=parseFloat(lines[i][3]);
        					let pventa=parseFloat(lines[i][5]);
        					        					
        				if(!Number.isNaN(codigo) && !Number.isNaN(iva) &&
        				!Number.isNaN(nit)&& !Number.isNaN(pcompra) &&
        				!Number.isNaN(pventa) && lines[i].length==6){
        					
        					cantidadlineas++;
        					if(cantidadlineas==lines.length){
        	        				for(i=0;i<lines.length;i++){
        	        				
        	        				fetch('http://localhost:5001/productos/guardar', {
        	                            method: 'POST',
        	                            body: JSON.stringify({
        	                            	codigo_producto: lines[i][0],
        	                            	ivacompra: lines[i][4],
        	                            	nitproveedor: lines[i][2],
        	                            	nombre_producto: lines[i][1],
        	                            	precio_compra: lines[i][3],
        	                            	precio_venta: lines[i][5]
        	                            }),
        	                            headers: {
        	                                "Content-type": "application/json"
        	                            }});
        	        				}
        	        				alert("Archivo Cargado Exitosamente");
        					}
        					
        					}else{
        						alert("Error: datos leidos invalidos en la linea "+(i+1));
        						}
        				
        				}
        				
        				}catch(error){
        					alert("Error: datos leidos invalidos");
        					}
        			}
        			reader.readAsText(entradaarchivo.files[0]);
        			entradaarchivo.value="";
        		}
        		}else{alert("Error: no se selecciono archivo para cargar");}
                
        	},false);

        	var etiquetaproductos=document.getElementById("productos");
            etiquetaproductos.style.backgroundColor="lightblue";
            var etiquetas=document.getElementsByName("opcion");
            etiquetas.forEach(function(etiqueta){
                etiqueta.addEventListener("mouseover",function(){
                etiqueta.style.backgroundColor="lightblue";},false);
                etiqueta.addEventListener("mouseleave" ,function(){
                etiqueta.style.backgroundColor="white";
                etiquetaproductos.style.backgroundColor="lightblue";
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
            <label name="opcion" id="productos">Productos</label>
            <label name="opcion" onclick="location.href='Clientes.jsp';">
            Clientes</label>
            <label name="opcion" onclick="location.href='Ventas.jsp';">
            Ventas</label>          
            <label name="opcion" onclick="location.href='Reportes.jsp';">
            Reportes</label> 
	    <label name="opcion" onclick="location.href='Consolidacion.jsp';">
            Consolidacion</label>                        
        </div>
    </section>
    <a href='Login.jsp?cerrarsesion=true'><h5>Cerrar Sesion</h5></a>
<section id="sectionentrada">
<input type="file" id="entradaarchivo">
<br>
<button id="guardar">Guardar</button>
</section>
</body>
</html>