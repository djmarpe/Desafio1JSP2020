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
                <h1>Contacta con nosotros</h1>
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
                        <p>Formulario de contacto</p>
                        <form novalidate action="../controlador.jsp" name="formulario" id="formulario">
                            <div class="row">
                                <div class="col-10">
                                    <label for="nombre">Nombre:</label>
                                    <input type="text"  id="nombre" placeholder="Introduce tu nombre" pattern="^([A-Za-zÀ-ú]+){1}$" required />
                                    <small class="error" aria-live="polite"></small>
                                </div>

                                <div class="col-10">
                                    <label for="email">Email:</label>
                                    <input type="text"  id="email" placeholder="Introduce tu email"  pattern="^[A-Za-z0-9]+@[a-z]+.[a-z]{2,3}$" required />
                                    <small class="error" aria-live="polite"></small>
                                </div>

                                <div class="col-10">
                                    <label for="area">Mensaje:</label>
                                    <textarea id="area" name="textarea" rows="15" cols="50" placeholder= "Escribe un mensaje..." required></textarea>
                                </div>
                                <button type="submit" name="enviar" value="enviar">Enviar</button>
                            </div>
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
