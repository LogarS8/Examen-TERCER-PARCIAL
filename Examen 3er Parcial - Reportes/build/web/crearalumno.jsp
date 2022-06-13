
<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

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

    String correo, contraseña, turno, nombre, boleta;
    int grado, grupo;
    
    correo=request.getParameter("email");
    contraseña=request.getParameter("password");
    
    grado=Integer.parseInt(request.getParameter("grado"));
    grupo=Integer.parseInt(request.getParameter("grupo"));
    turno=request.getParameter("turno");
    nombre=request.getParameter("nombre");
    boleta=request.getParameter("boleta");
    
    String q1="insert into alumnos(alu_correo, alu_contraseña, alu_grado, alu_turno, alu_grupo, alu_nombre, alu_boleta) values('"+correo+"','"+contraseña+"',"+grado+",'"+turno+"',"+grupo+",'"+nombre+"','"+boleta+"');";
    set=con.createStatement();
    set.execute(q1);
    
    response.sendRedirect("./index.jsp");
    try{
    }catch(Exception e){
out.println(e);
    }
}catch(Exception e){
out.println(e);
    }



%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
