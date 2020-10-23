<%-- 
    Document   : registro
    Created on : 14-oct-2020, 13:31:46
    Author     : alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/registro.css">
        <script src="../JS/validacion.js"></script>
        <title>Regístrate!</title>
    </head>
    <body onload="validacion()">

        <header class="row">
            <div class="col-2">
                <img src="../Imagenes/prueba.jpg">
            </div>

            <div class="col-8">
                <h1>Da el primer paso en CiberMatch 3000 &COPY;</h1>
            </div>
        </header>

        <main class="row">
            <aside class="col-2">
                <ul>
                    <li><a href="contacto.jsp">Contacto</a></li>
                    <li><a href="informacion.jsp">Información</a></li>
                    <li><a href="../index.jsp">Página principal</a></li>
                </ul>
            </aside>

            <section class="col-8">
                <article>
                    <fieldset>
                        <p>Regístrate para continuar.</p>
                        <form novalidate action="../controlador.jsp" id="formulario">

                            <!------------------- Nombre ---------------------->
                            <div class="m1">
                                <label for="nombre">Nombre</label>
                                <input type="text" id="nombre" name="nombre" placeholder="Introduce tu nombre" aria-describedby="nombreError" required>
                                <small id="nombreError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!------------------- Apellidos ------------------->
                            <div class="m1">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" id="apellidos" name="apellidos" placeholder="Introduce tus apellidos" aria-describedby="apellidosError" required>
                                <small id="apellidosError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!---------------------- DNI ---------------------->
                            <div class="m-1">
                                <label for="dni">DNI</label>
                                <input type="text" class="input" id="dni" name="dni" aria-describedby="dniError" placeholder="Introduce tu DNI" required pattern="\d{8}[A-Z]">
                                <small id="dniError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!-------------- Correo electrónico --------------->
                            <div class="m-1">
                                <label for="email">Correo electronico</label>
                                <input type="email" class="input" id="email" name="email" aria-describedby="emailError" placeholder="Introduce tu correo" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$">
                                <small id="emailError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!----------------- Contraseña -------------------->
                            <div class="m-1">
                                <label for="password">Contraseña</label>
                                <input type="password" class="input" id="password" name="password" aria-describedby="passwordError" placeholder="Introduce tu contraseña" required minlength="6" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}">
                                <small id="passwordError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!-------------------- Edad ----------------------->
                            <div class="m-1">
                                <label for="edad">Edad</label>
                                <input type="number" class="input" id="edad" name="edad" aria-describedby="edadError" placeholder="Introduce tu edad" pattern="^[0-80]{1}$" minlength="18" maxlength="80" required>
                                <small id="edadError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!-------------------- Foto ----------------------->
                            <div class="m-1">
                                <label for="foto">Foto</label>
                                <input type="file" class="input" id="foto" name="foto" aria-describedby="fotoError" pattern="">
                                <small id="fotoError" class="form-text error" aria-live="polite"></small>
                            </div>

                            <hr>

                            <!-------------------- Sexo ----------------------->
                            <div class="m-1">
                                <label for="sexo">Sexo</label>
                                <select name="sexo" id="sexo">
                                    <option name="sexo" value="hombre" selected>Hombre</option>
                                    <option name="sexo" value="mujer">Mujer</option>
                                </select>
                            </div>

                            <hr>

                            <table>
                                <tr>
                                    <td>Captcha</td>
                                </tr>
                                <tr>
                                    <td>
                                        <canvas id="captcha"></canvas>
                                        <input type="button" id="refresh" value="Refresh" onclick="captcha();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" id="txtInput"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="button1" type="button" value="Check" onclick="alert(validCaptcha('txtInput'));"/>
                                    </td>
                                </tr>
                            </table>

                            <button type="submit" name="registro" value="Regístrate">Regístrate</button>
                        </form>
                        <form action="../controlador.jsp">
                            <button type="submit" name="cerrarSesion" value="Volver a Inicio">Volver a Inicio</button>
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
