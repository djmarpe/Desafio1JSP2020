<%-- 
    Document   : Contacto
    Created on : 22-oct-2020, 12:01:58
    Author     : alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../CSS/contacto.css">
        <script src="../JS/validacion.js"></script>
    </head>

    <body onload="validacion()">
        <header class="row">
            <div class="col-2">
                <img src="../Imagenes/prueba.jpg">
            </div>

            <div class="col-8">
                <h1>Información</h1>
            </div>
        </header>

        <main class="row">
            <aside class="col-2">
                <ul>
                    <li><a href="./login.jsp">Iniciar Sesión</a></li>
                    <li><a href="./registro.jsp">Regístrate!</a></li>
                    <li><a href="../index.jsp">Página principal</a></li>
                </ul>
            </aside>

            <section class="col-8">
                <article>
                    <fieldset>
                        <h3>Atención personalizada las 24 horas, los 7 días de la semana</h3>
                        <h3>Teléfono de contacto: +34 692-388-705</h3>
                        <h3>Email de contacto: alejandro.martin.perez.99@gmail.com</h3>
                    </fieldset>
                </article>
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
