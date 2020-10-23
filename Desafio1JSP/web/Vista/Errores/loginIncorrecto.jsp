<%-- 
    Document   : login
    Created on : 14-oct-2020, 13:31:24
    Author     : alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../CSS/login.css">
        <title>Iniciar Sesión...</title>
        <!--<script src="https://www.google.com/recaptcha/api.js"></script>-->
    </head>
    <body>

        <header class="row">
            <div class="col-2">
                <img src="../../Imagenes/prueba.jpg">
            </div>

            <div class="col-8">
                <h1>Entra en el mundo de CyberMatch 3000 &COPY;</h1>
            </div>
        </header>

        <main class="row">
            <aside class="col-2">
                <ul>
                    <li><a href="contacto.jsp">Contacto</a></li>
                    <li><a href="../informacion.jsp.jsp">Información</a></li>
                    <li><a href="../../index.jsp">Página principal</a></li>
                </ul>
            </aside>

            <section class="col-8">
                <article>
                    <fieldset>
                        <p>Login Incorrecto, vuelva a intentarlo!</p>
                        <form action="../../controlador.jsp" name="login">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Usuario: </td>
                                        <td><input type="text" name="usuario" value="" placeholder="Introduce tu email" required></td>
                                    </tr>
                                    <tr>
                                        <td>Contraseña: </td>
                                        <td><input type="password" name="password" value="" placeholder="Introduce tu contraseña" required></td>
                                    </tr>
                                </tbody>
                            </table>
                            <p><a href="resetPasswd.jsp">¿Olvidaste tu contraseña?</a></p>
                            <button type="submit" name="login">Iniciar sesión</button>
                            <p>
                            <div class="g-recaptcha" data-sitekey="6Le8XtoZAAAAADnTOgWtxBOjT_uLRPoI6GqslHis"></div>
                            <span>
                                <%
                                    Object errorMessage = session.getAttribute("errorMessage");
                                    if (errorMessage != null) {
                                        out.print(errorMessage.toString());
                                    }
                                %>
                            </span>
                            </p>
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
