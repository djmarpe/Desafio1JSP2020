<%-- 
    Document   : ventanaSeleccionRol
    Created on : 16-oct-2020, 9:26:40
    Author     : alejandro
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/ventanaSeleccionRol.css">
        <title>Selecciona tu rol</title>
    </head>
    <body>

        <%

            Persona usuarioLogin = (Persona) session.getAttribute("UsuarioLogin");

        %>

        <header class="row">
            <div class="col-2">
                <img src="../Imagenes/prueba.jpg">
            </div>

            <div class="col-8">
                <h1>Bienvenido <%= usuarioLogin.getNombre()%>!!</h1>
            </div>
        </header>

        <main class="row">

            <aside class="col-2">
                <ul>
                    <li><a href="contacto.jsp">Contacto</a></li>
                    <li><a href="informacion.jsp">Información</a></li>
                </ul>
            </aside>

            <section class="col-8">
                <article>
                    <fieldset>
                        <p>Selecciona un rol para continuar.</p>
                        <form action="../controlador.jsp" name="seleccionRol">
                            <select name="rolSeleccionado">
                                <%
                                    for (int i = 0; i < usuarioLogin.getRolSize(); i++) {
                                %>

                                <option><%= usuarioLogin.getRol(i)%></option>

                                <%
                                    }
                                %>
                            </select>
                            <p><button type="submit" name="rol">Continuar</button></p>
                            <p><button type="submit" name="cerrarSesion">Cerrar Sesión</button></p>
                        </form>
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
