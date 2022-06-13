
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%

HttpSession ses = request.getSession();

if(ses.getAttribute("reg")!=null){
    if(ses.getAttribute("reg").equals("existe")){
    response.sendRedirect("verDatos.jsp");
}
}
        

%>

<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Examen B-LGR</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="style.css" rel="stylesheet">
  </head>
  
  <body class="text-center">
    
    <main class="form-signin">
        <%if(request.getAttribute("error")!=null){out.println("<div class=\"text-danger\">"+request.getAttribute("error")+"</div>");}%>
        <form method="get" action="validarLogin.jsp">
          <h1 class="h3 mb-3 fw-normal ">Bienvenido</h1><br>

        <div class="form-floating">
            Correo:
            <input type="email" name="email"><br><br>
        </div>
        <div class="form-floating">
            Contraseña:
            <input type="password" name="password"><br><br>
        </div>
        <button class="w-100 btn btn-lg btn-dark btn-outline-success" type="submit">Entrar</button>
        <br><br>¿Eres alumno y no tienes cuenta? <a href="./signinAlumno.html" class="link link-dark">
            Registrarse como alumno
        </a>
        
        <br><br>¿Eres docente y no tienes cuenta? <a href="./signinDocente.html" class="link link-dark">
            Registrarse como docente
        </a>
        
      </form>
    </main>


    
  </body>
</html>
