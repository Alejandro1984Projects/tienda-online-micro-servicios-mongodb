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
    #titulo label{margin-left: 15px;}        
        div{margin-top: 30px;
            text-align: center;}
        #usuario{margin-left: 17px;}
        button{background-color: lightblue;}
</style>
</head>
<body>
<div id="titulo">
            <label for="">
                <h1>Cadena de Tiendas La Generica</h1>
            </label>
        </div>
<form action="Login.jsp" method="post">
<section>
        <br><br><br>
        <div>
        <h3>Acceso al Sistema</h3><br>
        </div>
        <div>
            Usuario <input type="text" name="usuario" id="usuario"><br>
        </div>
        <div>
            Contraseña <input type="password" name="password" id="password"><br>
        </div>
        <div>
            <button type="submit" name="aceptar" value="Aceptar" id="aceptar">Aceptar</button>
            <button value="Cancelar">Cancelar</button>    
        </div>  
    </section>
    </form>
    <%
    if(request.getParameter("aceptar")!=null){
    	String usuario=request.getParameter("usuario");
		String password=request.getParameter("password");
		if(usuario.equals("admininicial") && password.equals("admin123456")) {
			HttpSession sesion=request.getSession();
			sesion.setAttribute("iniciarsesion", true);
			response.sendRedirect("Productos.jsp");
		}else {			
            	out.print("<script>alert('Usuario o contraseña errados')</script>");	        		        
		}
    }
    if(request.getParameter("cerrarsesion")!=null){
    	session.invalidate();
    }
    %>
</body>
</html>