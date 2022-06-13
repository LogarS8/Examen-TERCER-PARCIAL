
<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>

<%

Connection con = null;
Statement set = null;
ResultSet rs = null;

String userName, URL, password, driver;

URL = "jdbc:mysql://localhost:3306/integrador";
userName = "root";
password = "Rodrigo88";
driver = "com.mysql.cj.jdbc.Driver";

String correo, contraseña;


try{
    Class.forName(driver);
    con = DriverManager.getConnection(URL, userName, password);
    
    correo=request.getParameter("email");
    contraseña=request.getParameter("password");
    
    String q1="select * from alumnos where alu_correo='"+correo+"' and alu_contraseña='"+contraseña+"' limit 1;";
    
    set=con.createStatement();
    rs=set.executeQuery(q1);
    
    if(rs.next()){
    
        HttpSession ses = request.getSession();

        
        ses.setAttribute("correo", correo);
        ses.setAttribute("contraseña", contraseña);
        ses.setAttribute("grado", rs.getInt("alu_grado"));
        ses.setAttribute("grupo", rs.getInt("alu_grupo"));
        ses.setAttribute("turno", rs.getString("alu_turno"));
        ses.setAttribute("nombre", rs.getString("alu_nombre"));
        ses.setAttribute("boleta", rs.getString("alu_boleta"));
        ses.setAttribute("id", rs.getInt("alu_id"));
        
        q1="select * from maquinas where id_alu="+rs.getInt("alu_id")+";";
        set=con.createStatement();
        rs=set.executeQuery(q1);
        
        if(rs.next()){
            ses.setAttribute("reg", "existe");
        }
    
    
        
        response.sendRedirect("./formulario.jsp");
    }else {
        q1="select * from profesores where pro_email='"+correo+"' and pro_contrasena='"+contraseña+"' limit 1;";
        
        set=con.createStatement();
        rs=set.executeQuery(q1);
        
        if(rs.next()){
            response.sendRedirect("./jsp/inicioS.jsp?pro_email="+correo+"&pro_contrasena="+contraseña);
        }else{
            request.setAttribute("error","CONTRASEÑA O CORREO ERRÓNEO");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        }
    }
    
    
    
}catch(Exception e){
out.println(e);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
