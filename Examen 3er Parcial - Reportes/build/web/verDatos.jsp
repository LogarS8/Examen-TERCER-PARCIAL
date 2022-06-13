
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>


<%

HttpSession ses = request.getSession();

String s = (String)ses.getAttribute("turno");
int gra = (int)ses.getAttribute("grado");
int g = (int)ses.getAttribute("grupo");
int id = (int)ses.getAttribute("id");


Connection con = null;
Statement set = null;
ResultSet rs = null;

String userName, URL, password, driver;

URL = "jdbc:mysql://localhost:3306/integrador";
userName = "root";
password = "Rodrigo88";
driver = "com.mysql.cj.jdbc.Driver";

String titulos[]=new String[4];

int c=4;

if(gra==3){
    c=3;
    } else{
    c=4;
    }

String[] clases = new String[4];

String []salones=new String[c];

int[]pos=new int[c];

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

try{


    Class.forName(driver);
    con = DriverManager.getConnection(URL, userName, password);
            
    String q1;
    q1="select * from maquinas where id_alu="+id+";";

    set=con.createStatement();
    rs=set.executeQuery(q1);

    int i =0;
    
    while(rs.next()){
        salones[i]=rs.getString("maq_salon");
        pos[i]=rs.getInt("maq_numero");
        i++;
    }
    
}catch(Exception e){
out.println(id);
out.println(e);
}


%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver datos del alumno</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        <section class="container" id="p2">
            
            <div class="table justify-content-center">
                
                <div class="row my-2 justify-content-center">
                    <div class="col-4">
                        Unidad de aprendizaje
                    </div>
                    <div class="col-4">
                        Salón
                    </div>
                    <div class="col-4 justify-content-center">
                        Núm. de Máquina
                    </div>
                </div>
                <%for(int i=0;i<c;i++){%>
                    <div class="row my-2 justify-content-center" <%if(i==3){out.println(ocultar);}%>>
                        <div class="col-8">
                            <%out.println(titulos[i]);%>
                        </div>
                        <div class="col-8">
                            <%out.println(salones[i]);%>
                        </div>
                        <div class="col-2 justify-content-center">
                            <%out.println(pos[i]);%>
                        </div>
                    </div>
                <%}%>
            </div>

            <div class="row justify-content-end">
                <a href="cerrarSesion.jsp" class="fs-3 link-dark justify-content-end"> Cerrar sesión</a> 
            </div>
            
        </section>
    </body>
</html>
