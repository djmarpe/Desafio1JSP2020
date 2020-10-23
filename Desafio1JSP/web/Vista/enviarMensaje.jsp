<%-- 
    Document   : enviarMensaje
    Created on : 23-oct-2020, 16:56:46
    Author     : alejandro
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enviar mensajes</title>
    </head>
    <body>

        <%
            Persona p = (Persona) session.getAttribute("UsuarioLogin");
        %>

        <header class="row">
            <div class="col-2">
                <img src="../Imagenes/prueba.jpg">
            </div>

            <div class="col-8">
                <h1>Enviar mensajes</h1>
            </div>
        </header>


        <main>
            <div class="usuario col-10">
                <p>Conectado como: <%= p.getNombre() + " " + p.getApellidos()%>.</p>
            </div>

            <div>
                <form action="../controlador.jsp">
                    <p>De: <input type="text" name="de" required></p>
                    <p>Para: <input type="text" name="para" required></p>
                    <p>Asunto: <input type="text" name="asunto" required></p>
                    <p>Mensaje:</p> 
                    <textarea id="area" name="cuerpo" rows="15" cols="50" placeholder= "Escribe un mensaje..." required ></textarea>
                    <button type="submit" name="mensaje" value="enviarMensaje">Enviar Mensaje</button>
                </form>
            </div>
        </main>
    </body>
</html>
