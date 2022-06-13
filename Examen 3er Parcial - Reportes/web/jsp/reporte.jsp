
<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Reporte</title>
</head>
<body>
    <h1><i>Reporte registrado correctamente</i></h1><%
        
        HttpSession ses = request.getSession();
        
        String pro_contrasena=(String)ses.getAttribute("pro_contrasena");
        
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
            
            try{
                String equ_etiqueta, pro_nombre, rep_problema, rep_estado, pro_email;
                int pro_numempleado, lab_id, asi_id, pri_id;
                
                equ_etiqueta = request.getParameter("equ_etiqueta");
                pro_nombre = request.getParameter("pro_nombre");
                rep_problema = request.getParameter("rep_problema");
                rep_estado = request.getParameter("rep_estado");
                pro_email = request.getParameter("pro_email");
               
                
                pro_numempleado = Integer.parseInt(request.getParameter("pro_numempleado"));
                lab_id = Integer.parseInt(request.getParameter("lab_id"));
                asi_id = Integer.parseInt(request.getParameter("asi_id"));
                pri_id = Integer.parseInt(request.getParameter("pri_id"));
                
                String qz = "INSERT INTO reportes (lab_id, equ_etiqueta, pro_nombre, "
                        + "pro_numempleado, asi_id, rep_problema, rep_estado, pri_id, est_id, tecn_id) VALUES "
                        + "("+lab_id+", '"+equ_etiqueta+"', '"+pro_nombre+"', "+pro_numempleado+", "
                        + asi_id+", '"+rep_problema+"', '"+rep_estado+"', "+pri_id+", 1 , 3)";
                
                set = con.createStatement();
                
                int reg = set.executeUpdate(qz);
%>
    <form action="inicioS.jsp" method="post" name="inicio">
        <div>
            <label><input type="hidden" name="pro_email" id="pro_email" value="<%=pro_email%>"/></label>
        </div>
        <div>
            <label><input type="hidden" name="pro_contrasena" id="pro_email" value="<%=pro_contrasena%>"/></label>
        </div>
        <div>
            <label><input class="input-group" type="submit" value="Regresar a Inicio"></label>
        </div>
    </form><%
            }catch(SQLException es){
                out.println(es);
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
%>
    <h2>Error al Reporte</h2>
    <form action="inicioS.jsp" method="post" name="inicio">
        <div>
          <label><input type="submit" value="Regresar a Inicio"></label>
        </div>
    </form><%
            }
        }catch(Exception e){
out.println(e);
            
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
%>
    <h1>No conecto Error</h1>
    <form action="../index.html" method="post" name="inicio">
        <div>
            <label><input type="submit" value="Iniciar Sesion" ></label>
        </div>
    </form><%    
        }   
%>
</body>
</html>