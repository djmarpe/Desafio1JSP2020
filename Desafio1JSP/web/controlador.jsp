<%-- 
    Document   : controlador
    Created on : 15-oct-2020, 12:03:09
    Author     : alejandro
--%>

<%@page import="captcha.VerificarRecaptcha"%>
<%@page import="Modelo.Email"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.ConexionEstatica"%>
<%

    //-------------------------------------------------------------------------
    //----------------------- Ventana Login -----------------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("login") != null) {
        
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("password");
        String errorMessage = "";
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        System.out.println(gRecaptchaResponse);
        //------------------------------------------------------------------
        //Fallo en el siguiente método de la clase VerificarRecaptcha, línea 49;
        //DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        boolean verificado = VerificarRecaptcha.verificar(gRecaptchaResponse);
        
        verificado = true;
        if (ConexionEstatica.existeUsuario(usuario, clave) == 0 && verificado) {
            Persona p = (Persona) ConexionEstatica.getPersona(usuario, clave);
            //Recupero la persona conectada
            session.setAttribute("UsuarioLogin", p);

            //Añado +1 a la variable aplicación de gente conectada
            Integer usuariosOnline = (Integer) application.getAttribute("usuariosOnline");
            if (usuariosOnline == null || usuariosOnline == 0) {
                usuariosOnline = 1;
            } else {
                usuariosOnline += 1;
            }
            application.setAttribute("usuariosOnline", usuariosOnline);

            //-----------------------------------------------------------------
            if (p.getRolSize() > 1) {
                response.sendRedirect("Vista/ventanaSeleccionRol.jsp");
            } else {
                if (p.getRol(0).equals("Administrador")) {
                    response.sendRedirect("Vista/panelAdministracion.jsp");
                }
                if (p.getRol(0).equals("Usuario")) {
                    response.sendRedirect("Vista/usuarioPrincipal.jsp");
                }
            }
            
        } else {
            response.sendRedirect("Vista/Errores/loginIncorrecto.jsp");
            errorMessage = "Captcha no válido";
            session.setAttribute("errorMessage", errorMessage);
        }
        
    }

    //-------------------------------------------------------------------------
    //----------------------- Ventana seleccion rol ---------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("rol") != null) {
        String rolSeleccionado = request.getParameter("rolSeleccionado");
        
        if (rolSeleccionado.equals("Administrador")) {
            response.sendRedirect("Vista/panelAdministracion.jsp");
        }
        
        if (rolSeleccionado.equals("Usuario")) {
            response.sendRedirect("Vista/usuarioPrincipal.jsp");
        }
        
    }

    //-------------------------------------------------------------------------
    //------------------ Ventana Panel Administracion -------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("filtrarRol") != null) {
        String rol = request.getParameter("rolFiltrar");
        session.setAttribute("rolFiltrado", rol);
        
        if (rol.equals("Administrador")) {
            LinkedList administradores = ConexionEstatica.getAdministradores();
            session.setAttribute("administradores", administradores);
            response.sendRedirect("Vista/panelAdministracion.jsp");
        }
        
        if (rol.equals("Usuario")) {
            LinkedList usuarios = ConexionEstatica.getUsuarios();
            session.setAttribute("usuarios", usuarios);
            response.sendRedirect("Vista/panelAdministracion.jsp");
        }
        
    }

    //-------------------------------------------------------------------------
    if (request.getParameter("btAdministracion") != null) {
        String botonPulsado = request.getParameter("btAdministracion");
        Persona aux = new Persona();
        aux.setNombre(request.getParameter("nombre"));
        aux.setApellidos(request.getParameter("apellido"));
        aux.setDni(request.getParameter("dni"));
        aux.setEdad(request.getParameter("edad"));
        aux.setEmail(request.getParameter("email"));
        aux.setContra(request.getParameter("password"));
        
        String sexo = request.getParameter("sexo");
        if (sexo.equals("Hombre")) {
            int genero = 0;
            aux.setSexo(genero);
        } else {
            int genero = 1;
            aux.setSexo(genero);
        }
        
        String esAdmin = request.getParameter("admin");
        if (esAdmin.equals("si")) {
            int admin = 1;
            aux.setEsAdmin(admin);
        } else {
            int admin = 0;
            aux.setEsAdmin(admin);
        }
        
        String estaActivado = request.getParameter("onoff");
        if (estaActivado.equals("si")) {
            int activado = 1;
            aux.setActivado(activado);
        } else {
            int activado = 0;
            aux.setActivado(activado);
        }
        
        if (botonPulsado.equals("eliminarUsuario")) {
            if (ConexionEstatica.existeUsuario(aux.getEmail(), aux.getContra()) == 0) {
                if (ConexionEstatica.eliminarUsuario(aux.getEmail(), aux.getContra())) {
                    response.sendRedirect("Vista/panelAdministracion.jsp");
                }
            }
        }
        if (botonPulsado.equals("editarUsuario")) {
            if (ConexionEstatica.existeUsuario(aux.getEmail(), aux.getContra()) == 0) {
                if (ConexionEstatica.modificarUsuario(aux)) {
                    response.sendRedirect("Vista/panelAdministracion.jsp");
                }
            }
        }
        
    }

    //-------------------------------------------------------------------------
    //----------------------- Ventana registro --------------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("registro") != null) {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String dni = request.getParameter("dni");
        String email = request.getParameter("email");
        String contra = request.getParameter("password");
        String edad = request.getParameter("edad");
        String foto = request.getParameter("foto");
        int sexo;
        
        if (request.getParameter("sexo").equals("hombre")) {
            sexo = 0;
        } else {
            sexo = 1;
        }
        
        Persona aux = new Persona();
        aux.setNombre(nombre);
        aux.setApellidos(apellidos);
        aux.setDni(dni);
        aux.setEmail(email);
        aux.setContra(contra);
        aux.setEdad(edad);
        aux.setFoto(foto);
        aux.setSexo(sexo);
        aux.setActivado(1);
        aux.setEsAdmin(0);
        
        if (ConexionEstatica.existeUsuario(email, contra) != 0) {
            if (ConexionEstatica.addUsuario(aux)) {
                response.sendRedirect("Vista/login.jsp");
            }
        } else {
            response.sendRedirect("Vista/registro.jsp");
        }
        
    }
    //-------------------------------------------------------------------------
    //----------------------- Ventana enviar mensaje --------------------------
    //-------------------------------------------------------------------------

    if (request.getParameter("mensaje") != null) {
        String emisor = request.getParameter("de");
        String receptor = request.getParameter("para");
        String asunto = request.getParameter("asunto");
        String cuerpo = request.getParameter("cuerpo");
        
        if (ConexionEstatica.existeUsuarioMensaje(receptor) == 0) {
            if (ConexionEstatica.enviarMensaje(emisor, receptor, asunto, cuerpo)) {
                response.sendRedirect("Vista/usuarioPrincipal.jsp");
            }
        }
        
    }

    //-------------------------------------------------------------------------
    //----------------------- Ventana contacto --------------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("enviar") != null) {
        
        Email email = new Email();
        
        String de = request.getParameter("email");
        String clave = "Chubaca20";
        String para = "alejandro.martin.perez.99@gmail.com";
        String mensaje = request.getParameter("textarea");
        String asunto = request.getParameter("nombre");
        
        email.enviarCorreo(de, clave, para, mensaje, asunto);
        response.sendRedirect("Vista/contacto.jsp");
    }

    //-------------------------------------------------------------------------
    //-------------------------- Recuperar ------------------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("recuperar") != null) {
        
        Email email = new Email();
        
        String de = "auxiliardaw2@gmail.com";
        String clave = "Chubaca20";
        String para = request.getParameter("email");
        String mensaje = "Contarseña cambiada a --> 1234";
        String asunto = "(>_<) Contraseña olvidada (>_<)";
        
        email.enviarCorreo(de, clave, para, mensaje, asunto);
        out.println("Correo enviado");
        response.sendRedirect("Vista/resetPasswd.jsp");
    }

    //-------------------------------------------------------------------------
    //-------------------------- Gente cercana --------------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("perfil") != null) {
        Persona p = (Persona) session.getAttribute("UsuarioLogin");
        String btPulsado = request.getParameter("perfil");
        
        if (btPulsado.equals("genteCercana")) {
            LinkedList genteCercana = ConexionEstatica.getGenteCercana(p);
            session.setAttribute("genteCercana", genteCercana);
            response.sendRedirect("Vista/usuarioPrincipal.jsp");
        }
        
        if (btPulsado.equals("enviarMensajes")) {
            response.sendRedirect("Vista/enviarMensaje.jsp");
        }
        
    }

    //-------------------------------------------------------------------------
    //----------------------- Boton Cerrar Sesion -----------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("cerrarSesion") != null) {
        response.sendRedirect("index.jsp");

        //Elimino al usuario de la sesion
        session.removeAttribute("UsuarioLogin");

        //Elimino 1 usuario de la aplicacion
        if (application.getAttribute("usuariosOnline") != null) {
            Integer usuariosOnline = (Integer) application.getAttribute("usuariosOnline");
            if (usuariosOnline > 1) {
                usuariosOnline -= 1;
            } else {
                usuariosOnline = 0;
            }
            application.setAttribute("usuariosOnline", usuariosOnline);
        }
        
    }
%>
