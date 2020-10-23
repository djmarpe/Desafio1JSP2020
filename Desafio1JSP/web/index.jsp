<%-- 
    Document   : index
    Created on : 14-oct-2020, 13:07:17
    Author     : alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/index.css">
        <title>CyberMatch 3000</title>
    </head>
    <body>
        <header class="row">

            <div class="col-m-2 col-l-2 col-0">
                <img src="Imagenes/prueba.jpg">
            </div>

            <div class="row"
                 <div class="titulo col-m-8 col-l-8">
                    <h1>Bienvenid@ a CyberMatch 3000 &COPY;</h1>
                </div>
            </div>
        </header>

        <main class="row">
            <aside class="col-m-10 col-l-2">
                <div class="row">
                    <ul>
                        <div class="col-m-10 col-l-10">
                            <li>
                                <a href="Vista/contacto.jsp">Contacto</a>
                            </li>
                        </div>

                        <div class="col-m-10 col-l-10">
                            <li>
                                <a href="Vista/informacion.jsp">Información</a>
                            </li>
                        </div>
                    </ul>
                </div>
            </aside>
            <section class="col-l-8 col-m-8">
                <div class="row">
                    <div class="boton col-10 mbt1">
                        <a class="mov" href="Vista/login.jsp">Iniciar Sesión</a>
                    </div>

                    <div class="boton col-10 mbt2">
                        <a class="mov"href="Vista/registro.jsp">Regístrate!</a>
                    </div>
                </div>
            </section>
        </main>

        <footer class="row">
            <table class="col-4">
                <tbody>
                    <tr>
                        <td>Nombre de la aplicación:</td>
                        <td>CyberMatch 3000 &COPY;</td>
                    </tr>
                    <tr>
                        <td>Creador de la aplicación:</td>
                        <td>Alejandro Martín Pérez</td>
                    </tr>
                </tbody>
            </table>
        </footer>

    </body>
</html>
