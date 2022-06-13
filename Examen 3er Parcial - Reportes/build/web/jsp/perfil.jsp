
<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Perfil</title>
</head>
<body>
    <h1><i>REGISTRO DE REPORTES DE INMUEBLES CECYT 9</i></h1><%
        
        HttpSession ses = request.getSession();
        
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
    
        String userName, URL, password, driver;
    
        URL = "jdbc:mysql://localhost:3306/integrador";
        userName = "root";
        password = "Rodrigo88";
        driver = "com.mysql.cj.jdbc.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            out.println("FALLO");
            try{
                String pro_nombre, pro_appat, pro_apmat, pro_fnacimiento, pro_Nemail, pro_Ncontrasena, pro_Vemail;
                int pro_numempleado, sex_id;
                
                pro_nombre = request.getParameter("pro_nombre");
                pro_appat = request.getParameter("pro_appat");
                pro_apmat = request.getParameter("pro_apmat");
                pro_fnacimiento = request.getParameter("pro_fnacimiento");
                pro_Nemail = request.getParameter("pro_email");
                pro_Ncontrasena = request.getParameter("pro_contrasena");
                
                pro_numempleado = Integer.parseInt(request.getParameter("pro_numempleado"));
                sex_id = Integer.parseInt(request.getParameter("sex_id"));
                
                pro_Vemail=(String)ses.getAttribute("pro_email");
                
                out.println(pro_appat+"<br>");
                out.println(pro_apmat+"<br>");
                out.println(pro_nombre+"<br>");
                
                String qz = "UPDATE profesores "
                        + "SET pro_numempleado="+pro_numempleado+", pro_nombre='"+pro_nombre+"', pro_appat='"+pro_appat+"', "
                        + "pro_apmat='"+pro_apmat+"', sex_id="+sex_id+", pro_fnacimiento='"+pro_fnacimiento+"', pro_email='"+pro_Nemail+"', pro_contrasena='"+pro_Ncontrasena+"' "
                        + "WHERE pro_email = '"+pro_Vemail+"';";
                
                set = con.createStatement();
                
                ses.setAttribute("pro_email", pro_Nemail);
                ses.setAttribute("pro_contrasena", pro_Ncontrasena);
                
                set.executeUpdate(qz);

                response.sendRedirect("./inicioS.jsp");
                
            }catch(SQLException es){

                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
out.println(es);
%>
    <h2>Error al Reporte</h2>
    <form action="inicioS.jsp" method="post" name="inicio">
        <div>
            <a href="../index.jsp">Iniciar sesión</a>
        </div>
    </form><%
            }
        }catch(Exception e){
            
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
out.println(e);
%>
    <h1>No conecto Error</h1>
    <form action="../index.html" method="post" name="inicio">
        <div>
            <a href="../index.jsp">Iniciar sesión</a>
        </div>
    </form><%    
        }   
%>
</body>
</html>