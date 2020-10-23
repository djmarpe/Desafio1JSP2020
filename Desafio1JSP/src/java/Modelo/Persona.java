/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.LinkedList;

/**
 *
 * @author alejandro
 */
public class Persona {

    private String nombre;
    private String apellidos;
    private String dni;
    private String email;
    private String contra;
    private String edad;
    private String foto;
    private int sexo;
    private int activado;
    private int esAdmin;
    private LinkedList rol;

    public Persona(String nombre, String apellidos, String dni, String email, String contra, String edad, int sexo, int activado, int esAdmin) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.dni = dni;
        this.email = email;
        this.contra = contra;
        this.edad = edad;
        this.sexo = sexo;
        this.activado = activado;
        this.esAdmin = esAdmin;
        this.rol = new LinkedList();
    }

    public Persona() {
        this.nombre = "";
        this.apellidos = "";
        this.dni = "";
        this.email = "";
        this.contra = "";
        this.edad = "";
        this.foto = "";
        this.sexo = 0;
        this.activado = 0;
        this.esAdmin = 0;
        this.rol = new LinkedList();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }

    public int getActivado() {
        return activado;
    }

    public void setActivado(int activado) {
        this.activado = activado;
    }

    public int getEsAdmin() {
        return esAdmin;
    }

    public void setEsAdmin(int esAdmin) {
        this.esAdmin = esAdmin;
    }

    public int getRolSize() {
        return this.rol.size();
    }

    public LinkedList getRol() {
        return rol;
    }

    public void addRol(String rol) {
        this.rol.add(rol);
    }

    public String getRol(int i) {
        return (String) this.rol.get(i);
    }

}
