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
        #datospersonas{margin-top:100px;text-align: center;}
        #datosproductos{margin-top:100px;text-align: center;}
        #datosproductos label{margin-left:50px;margin-right:50px;}
        #entradadatosproductos{text-align: center;}
        #datosventa{text-align:right;margin-top:50px;}
        #datosventa div{margin-right:275px;}
        button{background-color: lightblue;}
        input{text-align:center;}
        #valor1,#valor2,#valor3,#venta,#iva,#total{text-align:right;}
    </style>
    <script>
    var cedulacliente=0;
    var nombre="";
    var codigo1=0;
    var codigo2=0;
    var codigo3=0;
    var valorproducto1=0;
    var valorproducto2=0;
    var valorproducto3=0;
    var ivaproducto1=0;
    var ivaproducto2=0;
    var ivaproducto3=0;
    
        function comenzar(){ 
        	fetch('http://localhost:5003/ventas/listar')
    		.then(response => response.json())
            .then(array => {
            	var codigo=array.length+1;
        		var consecutivo=document.getElementById("consecutivo");
        		consecutivo.value=codigo;
            	});
    		
        	var consultarcliente=document.getElementById("consultarcliente");
        	consultarcliente.addEventListener("click",function(){
        		var nombrecliente=document.getElementById("nombrecliente");
        		var cedula=parseInt(document.getElementById("cedula").value);
				if(cedula!="" && !Number.isNaN(cedula)){			
        		fetch('http://localhost:5002/clientes/buscarporID/'+cedula)
        		.then(response => response.json())
                .then(json => { 
                	if(json.cedula_cliente!=null){
            		nombrecliente.value=json.nombre_cliente;
            		cedulacliente=cedula;
            		nombre=json.nombre_cliente;
                	}else{
                		alert("la cedula no se encuentra registrada");
                		document.getElementById("cedula").value="";
                		}
                }); 
				}else{
					alert("la cedula no se encuentra registrada");
					document.getElementById("cedula").value="";}
                },false);
        	var consultarproducto1=document.getElementById("consultarproducto1");
        	consultarproducto1.addEventListener("click",function(){
        		var nombreproducto1=document.getElementById("nombreproducto1");
        		codigo1=parseInt(document.getElementById("codigo1").value);
				if(codigo1!="" && !Number.isNaN(codigo1)){			
        		fetch('http://localhost:5001/productos/buscarporID/'+codigo1)
        		.then(response => response.json())
                .then(json => { 
            		if(json.codigo_producto!=null){
            		nombreproducto1.value=json.nombre_producto;
            		valorproducto1=json.precio_venta;
            		ivaproducto1=json.ivacompra;
            		}else{
            			alert("El producto no se encuentra registrado");
            			document.getElementById("codigo1").value="";}
                }); 
				}else{
					alert("El producto no se encuentra registrado");
					document.getElementById("codigo1").value="";}
                },false);
        	var consultarproducto2=document.getElementById("consultarproducto2");
        	consultarproducto2.addEventListener("click",function(){
        		codigo2=parseInt(document.getElementById("codigo2").value);
				if(codigo2!="" && !Number.isNaN(codigo2)){
        		fetch('http://localhost:5001/productos/buscarporID/'+codigo2)
        		.then(response => response.json())
                .then(json => {    
                	if(json.codigo_producto!=null){
            		var nombreproducto2=document.getElementById("nombreproducto2");
            		nombreproducto2.value=json.nombre_producto;
            		valorproducto2=json.precio_venta;
            		ivaproducto2=json.ivacompra;
    				}else{
    					alert("El producto no se encuentra registrado");
    					document.getElementById("codigo2").value="";}
                });
				}else{
					alert("El producto no se encuentra registrado");
					document.getElementById("codigo2").value="";}
                },false);
        	var consultarproducto3=document.getElementById("consultarproducto3");
        	consultarproducto3.addEventListener("click",function(){
        		codigo3=parseInt(document.getElementById("codigo3").value);
				if(codigo3!="" && !Number.isNaN(codigo3)){			
        		fetch('http://localhost:5001/productos/buscarporID/'+codigo3)
        		.then(response => response.json())
                .then(json => {  
                	if(json.codigo_producto!=null){
            		var nombreproducto3=document.getElementById("nombreproducto3");
            		nombreproducto3.value=json.nombre_producto;
            		valorproducto3=json.precio_venta;
            		ivaproducto3=json.ivacompra;
    				}else{
    					alert("El producto no se encuentra registrado");
    					document.getElementById("codigo3").value="";}
                });
				}else{
					alert("El producto no se encuentra registrado");
					document.getElementById("codigo3").value="";}
                },false);        	        	
        	
        	var confirmar=document.getElementById("confirmar");
        	confirmar.addEventListener("click",function(){
        		
        		var cantidad1=parseInt(document.getElementById("cantidad1").value);
        		var cantidad2=parseInt(document.getElementById("cantidad2").value);
        		var cantidad3=parseInt(document.getElementById("cantidad3").value);
        		if(cantidad1=="" || Number.isNaN(cantidad1)){
        			cantidad1=0}
        		if(cantidad2=="" || Number.isNaN(cantidad2)){
        			cantidad2=0}
        		if(cantidad3=="" || Number.isNaN(cantidad3)){
        			cantidad3=0}

        		if(cedulacliente!=0){
    			if(valorproducto1!=0 || valorproducto2!=0 || valorproducto3!=0){
        		if(cantidad1>0 || cantidad2>0 || cantidad3>0){
        		var consecutivo=document.getElementById("consecutivo").value;
        		var nombreclienteguardar=document.getElementById("nombrecliente").value;
        		var valor1=document.getElementById("valor1");
        		var valor2=document.getElementById("valor2");
        		var valor3=document.getElementById("valor3");
        		var venta=document.getElementById("venta");
        		var iva=document.getElementById("iva");
        		var total=document.getElementById("total");
        		valor1.value=valorproducto1*cantidad1;
        		valor2.value=valorproducto2*cantidad2;
        		valor3.value=valorproducto3*cantidad3;
        		var ventaproductos=(valorproducto1*cantidad1)+
        		(valorproducto2*cantidad2)+(valorproducto3*cantidad3);
        		venta.value=ventaproductos;
        		var iva1=Math.round((valorproducto1*cantidad1)*(ivaproducto1/100));
        		var iva2=Math.round((valorproducto2*cantidad2)*(ivaproducto2/100));
        		var iva3=Math.round((valorproducto3*cantidad3)*(ivaproducto3/100));
        		var ivaventa=iva1+iva2+iva3;
        		iva.value=ivaventa;
        		var ventatotal=ventaproductos+ivaventa;
        		total.value=ventatotal;
        		
        		var arraydetvent=[];
        		if(cantidad1!=0){
        			arraydetvent.push({
                    	codigo_producto: codigo1,
                		cantidad_producto: cantidad1,
                		valor_venta: valorproducto1*cantidad1,
                		valor_iva: iva1,
                		valor_total: (valorproducto1*cantidad1)+iva1
                    });
        		}
        		if(cantidad2!=0){
        			arraydetvent.push({
                    	codigo_producto: codigo2,
                		cantidad_producto: cantidad2,
                		valor_venta: valorproducto2*cantidad2,
                		valor_iva: iva2,
                		valor_total: (valorproducto2*cantidad2)+iva2
                    });
        		}
        		if(cantidad3!=0){
        			arraydetvent.push({
                    	codigo_producto: codigo3,
                		cantidad_producto: cantidad3,
                		valor_venta: valorproducto3*cantidad3,
                		valor_iva: iva3,
                		valor_total: (valorproducto3*cantidad3)+iva3
                    });
        		}            			
        			
        		fetch('http://localhost:5003/ventas/guardar', {
                    method: 'POST',
                    body: JSON.stringify({
                    	codigo_venta: consecutivo,
                    	cedula_cliente: cedulacliente,
                    	nombre_cliente: nombre,
                    	detalle_ventas: arraydetvent,
                    	valor_venta: ventaproductos,
                    	iva_venta: ivaventa,
                    	total_venta: ventatotal
                    }),
                    headers: {
                        "Content-type": "application/json"
                    }});
        		
        		}else{alert("El valor de cantidad es incorrecto");}
        		}else{alert("El producto no se encuentra registrado");}
        		}else{alert("la cedula no se encuentra registrada");}
        		
        		},false);
        	var etiquetaventas=document.getElementById("etiquetaventas");
        	etiquetaventas.style.backgroundColor="lightblue";
        	var etiquetas=document.getElementsByName("opcion");
            etiquetas.forEach(function(etiqueta){
                etiqueta.addEventListener("mouseover",function(){
                etiqueta.style.backgroundColor="lightblue";},false);
                etiqueta.addEventListener("mouseleave" ,function(){
                etiqueta.style.backgroundColor="white";
                etiquetaventas.style.backgroundColor="lightblue";
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
            <label name="opcion" id="etiquetaventas">Ventas</label>                                    
            <label name="opcion" onclick="location.href='Reportes.jsp';">
            Reportes</label> 
            <label name="opcion" onclick="location.href='Consolidacion.jsp';">
            Consolidacion</label>                        
        </div>
    </section>
    <a href='Login.jsp?cerrarsesion=true'><h5>Cerrar Sesion</h5></a>    
    <section>
    	<div id="datospersonas">
      		Cedula <input type="text"  id="cedula">
      		<button id="consultarcliente">Consultar</button>      		
            Cliente <input type="text"  id="nombrecliente">
            Consecutivo <input type="text"  id="consecutivo">
        </div>
    	<div id="datosproductos">
    	<label>Codigo Producto</label>
    	<label>Nombre Producto</label>
    	<label>Cantidad</label>
    	<label>Valor Total</label>
    	</div>
    	<section id="entradadatosproductos">
    	<div>
    	<input type="text"  id="codigo1">
    	<button id="consultarproducto1">Consultar</button>
    	<input type="text"  id="nombreproducto1">
    	<input type="text"  id="cantidad1">
    	<input type="text"  id="valor1">
    	</div>
    	<div>
    	<input type="text" name="" id="codigo2">
    	<button id="consultarproducto2">Consultar</button>
    	<input type="text" name="" id="nombreproducto2">
    	<input type="text" name="" id="cantidad2">
    	<input type="text" name="" id="valor2">
    	</div>
    	<div>
    	<input type="text" name="" id="codigo3">
    	<button id="consultarproducto3">Consultar</button>
    	<input type="text" name="" id="nombreproducto3">
    	<input type="text" name="" id="cantidad3">
    	<input type="text" name="" id="valor3">
    	</div>
    	</section>
    	<section id="datosventa">
    	<div>Total Venta<input type="text" name="" id="venta"></div>
    	<div>Total IVA<input type="text" name="" id="iva"></div>
    	<div>
    	<button id="confirmar">Confirmar</button>
    	Total con IVA<input type="text" name="" id="total">
    	</div> 
    	</section>   	
    </section>
</body>
</html>