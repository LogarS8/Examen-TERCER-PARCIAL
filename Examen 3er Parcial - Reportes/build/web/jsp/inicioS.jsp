
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
    
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Registro de reportes</title>
</head>
<body >
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="px-5 ms-xl-4"><br>
                        <div class="h2 fw-bold mb-0">Bienvenido al registro de reportes</div>
                    </div><%

                    
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
            
            try{
                String pro_emailF, pro_contrasenaF;
                int val;

                pro_emailF = request.getParameter("pro_email");
                pro_contrasenaF = request.getParameter("pro_contrasena");
                
                String q1 = "SELECT COUNT(pro_email) FROM profesores WHERE pro_email='"+pro_emailF+"' AND pro_contrasena='"+pro_contrasenaF+"'";
                                        
                set = con.createStatement();
                rs = set.executeQuery(q1);
                                        
                while(rs.next()){
                    val = rs.getInt("COUNT(pro_email)");
                    System.out.println(val);
                    
                    if (val == 1 ) {
                        String q2 = "SELECT * FROM profesores WHERE pro_email = '" 
                                + pro_emailF +"' AND pro_contrasena = '" +pro_contrasenaF +"' LIMIT 1";
                    
                        set = con.createStatement();
                        rs = set.executeQuery(q2);
                    
                        while(rs.next()){
        ses.setAttribute("pro_email", pro_emailF);
ses.setAttribute("pro_contrasena", pro_contrasenaF);
String pro_nombre = rs.getString("pro_nombre");
ses.setAttribute("pro_nombre", pro_nombre);
int pro_numempleado=rs.getInt("pro_numempleado");
ses.setAttribute("pro_numempleado", pro_numempleado);

%>
    <div class="">
        <br>
        <h2 class="">Bienvenido <%=pro_nombre%></h2>
        <p class="mb-0">Email <%=pro_emailF%></p>
        <p class="mb-0">Número de Empleado <%=pro_numempleado%></p>
        <form action="editarperfil.jsp" method="post" name="editar">
            <div style="visibility:hidden;">
                <label><input value="<%=pro_emailF%>" type="text" name="pro_email" id="pro_email" /></label>
            </div>
            <div class="pt-1 mb-4">
                <label><input class="btn btn-outline-success btn-lg px-5" type="submit" value="Editar Perfil"></label>
            </div>
        </form>
        <p class="mb-0"><a href="../cerrarSesion.jsp" class="link-info fw-bold">Cerrar Sesión</a></p>
    </div>
    <br>
    <div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">ID Reporte</th>
                    <th scope="col">Lab.</th>
                    <th scope="col">Fecha y Hora Reporte</th>
                    <th scope="col">Etiqueta Equipo</th>
                    <th scope="col">CPU Serial</th>
                    <th scope="col">ID Teclado</th>
                    <th scope="col">ID Mouse</th>
                    <th scope="col">Marca</th>
                    <th scope="col">ID Monitor</th>
                    <th scope="col">Nom. Responsable</th>
                    <th scope="col">Asignatura</th>
                    <th scope="col">Reporte</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Prioridad Reporte</th>
                    <th scope="col">Estado Reporte</th>
                    <th scope="col">Tecnico</th>
                    <th scope="col">Editar</th>
                <tr>
            </thead>
            <tbody><%

                        }

                        String q = "SELECT reportes.rep_id,laboratorios.lab_nom,reportes.rep_fechahora ,reportes.equ_etiqueta,equipos.cpu_serial,equipos.tec_id,equipos.mou_id,marcas.mar_nom,equipos.mon_id," 
                                + "reportes.pro_nombre,asignaturas.asi_nom,reportes.rep_problema,reportes.rep_estado,prioridades.pri_nom,estados.est_nom,tecnicos.tecn_nombrec "
                                + "FROM equipos "
                                + "INNER JOIN reportes ON reportes.equ_etiqueta = equipos.equ_etiqueta "
                                + "INNER JOIN laboratorios ON laboratorios.lab_id = reportes.lab_id "
                                + "INNER JOIN marcas ON marcas.mar_id = equipos.mar_id "
                                + "INNER JOIN asignaturas ON asignaturas.asi_id = reportes.asi_id "
                                + "INNER JOIN prioridades ON prioridades.pri_id = reportes.pri_id "
                                + "INNER JOIN estados ON estados.est_id = reportes.est_id "
                                + "INNER JOIN tecnicos ON tecnicos.tecn_id = reportes.tecn_id ORDER BY reportes.rep_id";

                                set = con.createStatement();
                                rs = set.executeQuery(q);
                        while(rs.next()){

                        String lab_nom, rep_fechahora, equ_etiqueta, cpu_serial, tec_id, mou_id, mar_nom, mon_id, pro_nombre, asi_nom, rep_problema, rep_estado, pri_nom, est_nom, tecn_nombrec;
                        int rep_id = rs.getInt("rep_id");
                        lab_nom = rs.getString("lab_nom");
                        rep_fechahora=rs.getString("rep_fechahora");
                        equ_etiqueta=rs.getString("equ_etiqueta");
                        cpu_serial=rs.getString("cpu_serial");
                        tec_id=rs.getString("tec_id");
                        mou_id=rs.getString("mou_id");
                        mar_nom=rs.getString("mar_nom");
                        mon_id=rs.getString("mon_id");
                        pro_nombre=rs.getString("pro_nombre");
                        asi_nom=rs.getString("asi_nom");
                        rep_problema=rs.getString("rep_problema");
                        rep_estado=rs.getString("rep_estado");
                        pri_nom=rs.getString("pri_nom");
                        est_nom=rs.getString("est_nom");
                        tecn_nombrec=rs.getString("tecn_nombrec");

            %>
                <tr>
                    <td scope="row"><%=rep_id%></td>
                    <td><%=lab_nom%></td>
                    <td><%=rep_fechahora%></td>
                    <td><%=equ_etiqueta%></td>
                    <td><%=cpu_serial%></td>
                    <td><%=tec_id%></td>
                    <td><%=mou_id%></td>
                    <td><%=mar_nom%></td>
                    <td><%=mon_id%></td>
                    <td><%=pro_nombre%></td>
                    <td><%=asi_nom%></td>
                    <td><%=rep_problema%></td>
                    <td><%=rep_estado%></td>
                    <td><%=pri_nom%></td>
                    <td><%=est_nom%></td>
                    <td><%=tecn_nombrec%></td>
                    <td><a class="link-info fw-bold" href="editarreporte.jsp?rep_id=<%=rs.getInt("rep_id")%>" >Editar</a></td>
                </tr><%
                        }
                        String qnn = "SELECT pro_email FROM profesores WHERE pro_email='"+pro_emailF+"' AND pro_contrasena='"+pro_contrasenaF+"'";
                        
                        set = con.createStatement();
                        rs = set.executeQuery(qnn);
                        while(rs.next()){
            %>
            </tbody>
        </table>
    </div>
    <br>
    <form action="realizareporte.jsp" method="post" name="inicio">
        <div>
            <label><input value="<%=rs.getString("pro_email")%>" type="hidden" name="pro_email" id="pro_email" /></label>
        </div>
        <div>
            <label><input class="btn btn-outline-success btn-lg px-5" type="submit" value="Realizar Reporte"></label><br><br><br>
        </div>
    </form>
  </section><%
                        }
                    }else{

%>
    <h2>Sesion no realizada correctamente</h2>
    <p>Usuario no existente o contraseña invalida</p>
    <br><%
                    }
                }
            }catch(SQLException es){
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
                out.println(es);
%>  
    <h1>Error al consultar la tabla de la tabla</h1><%
            }
        }catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());

%>
    <h1>No conecto</h1><%
        }
%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="js/validacionIndex.js"></script>
</body>
</html>
