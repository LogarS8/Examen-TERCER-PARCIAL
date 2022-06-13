
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="style.css" rel="stylesheet">
    </head>

    <%
        
        
        
        HttpSession ses = request.getSession();
        
        if(ses.getAttribute("reg")!=null){
        out.println(ses.getAttribute("reg"));
            if(ses.getAttribute("reg").equals("existe")){
            response.sendRedirect("verDatos.jsp");
        }
        }
        
        String s = (String)ses.getAttribute("turno");
        int gra = (int)ses.getAttribute("grado");
        int g = (int)ses.getAttribute("grupo");
        int id = (int)ses.getAttribute("id");
        
        String nombre = (String)ses.getAttribute("nombre");
        String boleta = (String)ses.getAttribute("boleta");

        

        Connection con = null;
        Statement set = null;
        ResultSet rs = null;

        String userName, URL, password, driver;

        URL = "jdbc:mysql://localhost:3306/integrador";
        userName = "root";
        password = "Rodrigo88";
        driver = "com.mysql.cj.jdbc.Driver";

        String titulos[]=new String[4];
        String[] clases = new String[4];
        String ocultar="";
        switch(gra){
            case 3:
                titulos=new String[] {"PROGRAMACIÓN ORIENTADA A OBJETOS","LAB. DE PROYECTOS DE TECNOLOGÍAS DE LA INFORMACIÓN","ADMÓN. DE PROYECTOS DE TECNOLOGÍAS DE LA INFORMACIÓN",""};
                clases=new String[] {"POO","LPTII","APTII",""};
                ocultar = "style='display: none'"; 
                break;
            case 4:
                titulos=new String[] {"PROGRAMACIÓN Y SERVICIOS WEB","LAB. DE PROYECTOS DE TECNOLOGÍAS DE LA INFORMACIÓN II","BASES DE DATOS","TEC. DE PROGRAMACIÓN CON CALIDAD"};
                clases=new String[]{"PSW","LPTIII","BD","TPPC"};
                break;
            case 5:
                titulos=new String[] {"SEGURIDAD WEB Y APLICACIONES","LAB. DE PROYECTOS DE TECNOLOGÍAS DE LA INFORMACIÓN III","INTRODUCCIÓN A LA INGENIERÍA DE PRUEBAS","INTRODUCCIÓN A LOS SISTEMAS DISTRIBUIDOS"};
                clases=new String[]{"SWA","LPTIIII","IP","SD"};
                break;
            case 6:
                titulos=new String[] {"MÉTODOS ÁGILES DE PROGRAMACIÓN","LAB. DE PROYECTOS DE TECNOLOGÍAS DE LA INFORMACIÓN IV","SOPORTE DE SOFTWARE","INGENIERÍA DE SOFTWARE BÁSICA"};
                clases=new String[]{"MAP","LPTIIV","SS","ISB"};
                break;
        }
        
        String p1, p2, p3, p4;
        int p1v, p2v, p3v, p4v;
        p1=request.getParameter(clases[0]);
        p2=request.getParameter(clases[1]);
        p3=request.getParameter(clases[2]);
        p4=request.getParameter(clases[3]);
        p1v=Integer.parseInt(request.getParameter(clases[0]+"-value"));
        p2v=Integer.parseInt(request.getParameter(clases[1]+"-value"));
        p3v=Integer.parseInt(request.getParameter(clases[2]+"-value"));
        if(request.getParameter(clases[3]+"-value").equals("")){
            p4v=0;
        }else{
            p4v=Integer.parseInt(request.getParameter(clases[3]+"-value"));
        }
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            String q1;
            if(gra==3){q1 = "insert into maquinas(maq_salon, maq_unidad, maq_numero, id_alu) values('"+p1+"','"+clases[0]+"',"+p1v+","+id+"),('"+p2+"','"+clases[1]+"',"+p2v+","+id+"),('"+p3+"','"+clases[2]+"',"+p3v+","+id+");";}
            else{q1= "insert into maquinas(maq_salon, maq_unidad, maq_numero, id_alu) values('"+p1+"','"+clases[0]+"',"+p1v+","+id+"),('"+p2+"','"+clases[1]+"',"+p2v+","+id+"),('"+p3+"','"+clases[2]+"',"+p3v+","+id+"),('"+p4+"','"+clases[3]+"',"+p4v+","+id+");";}
            
            set=con.createStatement();
            
            set.execute(q1);
            
            ses.setAttribute("reg", "existe");
            
            response.sendRedirect("verDatos.jsp");
            
            
        }catch(Exception e){
            out.println(e);
        }
        

        String fecha = request.getParameter("fecha");

    %>
    
    <body class="text-center">
        <main class="form-signin">
            <button class="my-2 w-100 btn btn-lg btn-dark btn-outline-success" onclick="mostrarInfo()">Consultar</button>
            <form method="get" action="formulario.jsp">
                <input type="hidden" value="<%=gra%>" name="grado">
                <input type="hidden" value="<%=s%>" name="turno">
                <input type="hidden" value="<%=g%>" name="grupo">
                <input type="hidden" value="<%=nombre%>" name="nombre">
                <input type="hidden" value="<%=boleta%>" name="boleta">
                <button class="my-2 w-100 btn btn-lg btn-dark btn-outline-success" type="submit">Editar</button>
            </form>
        </main><br><br>
                
        <section class="container" style="display: none" id="p1">

            <div class="my-2 row justify-content-center">
                Nombre del alumno: <%=nombre%>
            </div>
            <div class="my-2 row justify-content-center">
                Boleta: <%=boleta%>
            </div>
            <div class="my-2 row justify-content-center">
                Grupo: <%=gra%>I<%=s%><%=g%>
            </div>
            <div class="my-2 row justify-content-center">
                Registro: <%=fecha%>
            </div>
            
        </section><br><br>
            
        <br><br>
    </body>
    <script type="text/javascript">
        
        function mostrarInfo(){
            document.getElementById("p1").style="display: block";
            document.getElementById("p2").style="display: block";
        }
        
    </script>
</html>
