<%-- 
    Document   : usuarioPrincipal
    Created on : 17-oct-2020, 16:36:03
    Author     : alejandro
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/usuarioPrincipal.css">
        <title>Perfil</title>
    </head>
    <body>
        <%

            Persona p = (Persona) session.getAttribute("UsuarioLogin");
            Integer usuariosOnline = (Integer) application.getAttribute("usuariosOnline");
            LinkedList<Persona> gente = (LinkedList<Persona>) session.getAttribute("genteCercana");

        %>

        <header class="row">
            <div class="col-2">
                <img src="../Imagenes/prueba.jpg">
            </div>

            <div class="col-8">
                <h1>Panel de usuario</h1>
            </div>
        </header>

        <main class="row">
            <aside class="col-2">
                <ul>
                    <li><a href="./contacto.jsp">Contacto</a></li>
                    <li><a href="./registro.jsp">Regístrate!</a></li>
                    <li><a href="../index.jsp">Página principal</a></li>
                </ul>
            </aside>

            <section class="col-8">
                <div class="row">
                    <div class="usuario col-10">
                        <p>Conectado como: <%= p.getNombre() + " " + p.getApellidos()%>.</p>
                    </div>
                </div>

                <div class="row">
                    <nav class="herramientas col-10">
                        <ul>
                            <form action="../controlador.jsp">
                                <li><button type="submit" name="perfil" value="perfilPersonal">Perfil personal</button></li>
                                <li><button type="submit" name="perfil" value="genteCercana">Gente cercana</button></li>
                                <li><button type="submit" name="perfil" value="amigos">Amigos</button></li>
                                <li><button type="submit" name="perfil" value="enviarMensajes">Enviar mensajes</button></li>
                                <li><button type="submit" name="cerrarSesion">Cerrar Sesion</button></li>
                            </form>
                        </ul>
                    </nav>
                </div>

                <div class="row">
                    <div class="usuariosOnline col-10">
                        <p>Hay: <%= usuariosOnline%> usuarios conectados.</p>
                    </div>
                </div>

                <div class="row">
                    <%
                        if (gente != null) {

                            for (int i = 0; i < gente.size(); i++) {
                                Persona aux = (Persona) gente.get(i);
                    %>

                    <div class="contenedor col-5">
                        <div class="tabla">
                            <table>
                                <thead>
                                    <tr>
                                        <th colspan="2"><%= aux.getNombre() + " " + aux.getApellidos()%></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>DNI:</td>
                                        <td><%= aux.getDni()%></td>
                                    </tr>
                                    <tr>
                                        <td>Edad:</td>
                                        <td><%= aux.getEdad()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><%= aux.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><button type="submit" name="usuarioPrincipal" value="enviarMensaje">Enviar mensaje</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
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
