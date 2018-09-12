/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.UsuarioDAO;
import modelo.dto.EstadoUsuario;
import modelo.dto.TipoUsuario;
import modelo.dto.Usuario;

/**
 *
 * @author Artiko1
 */
public class ServletUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String opcion = request.getParameter("btnAccion");

        if (opcion.equals("Listar")) {
            listar(request, response);
        }

        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }

        if (opcion.equals("Desactivar")) {
            actualizarEstado(request, response);
        }
        if (opcion.equals("Modificar")) {
            modificar(request, response);
        }
       
    }

    

    private void actualizarEstado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Recibimos el formulario
        try {
            int id=Integer.parseInt("txtId");
            int estadoUsuario = 2;
            EstadoUsuario estado = new EstadoUsuario(estadoUsuario);
            // Validamos a nivel de modelo(DTO)
            Usuario usuario = new Usuario(id, estado);
            // LLamamos al dao que tiene los metodos
            UsuarioDAO dao = new UsuarioDAO();

            // Agregamos el alumno a la BD
            if (dao.actualizarEstado(usuario)) {
                // Variable de session (nombre de la variable,contenido)
                request.getSession().setAttribute("msjOK", "Usuario Modificado");
            } else {
                // Variable de session (nombre de la variable,contenido)
                request.getSession().setAttribute("msjNO", "Usuario No Modificado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error: " + e.getMessage());
        } finally {
            response.sendRedirect("Administrador_Listar.jsp");
        }
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            //Recibimos los datos del formulario
            String nombre = request.getParameter("txtNombreUsuario");
            String contra = request.getParameter("txtPassword");
            int tipoUsuario = 2;
            int estadoUsuario = 1;
            TipoUsuario tipo = new TipoUsuario(tipoUsuario);
            EstadoUsuario estado = new EstadoUsuario(estadoUsuario);
            //Validamos a nivel de modelo (DTO)
            Usuario usuario = new Usuario(estado, tipo, nombre, contra);

            //Llamamos al dao que tiene los metodos
            UsuarioDAO dao = new UsuarioDAO();

            //Agregamos el alumno a la BD
            if (dao.agregar(usuario)) {
                //variable de sesion (nombre de la variable,contenido)
                request.getSession().setAttribute("msjOK", "Administrador agregado");
            } else {
                //variable de sesion (nombre de la variable,contendio)
                request.getSession().setAttribute("msjNO", "Administrador no agregado");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error: ");

        } finally {
            response.sendRedirect("Administrador_Agregar.jsp ");
        }
    }
    
    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Recibimos el formulario
            int id = Integer.parseInt(request.getParameter("txtId"));
            String nombre = request.getParameter("txtNombreUsuario");
            String contra = request.getParameter("txtPassword");
            int tipoUsuario =Integer.parseInt(request.getParameter("cboTipoUsuario"));
            int estadoUsuario =Integer.parseInt(request.getParameter("cboEstadoUsuario"));
            
            TipoUsuario tipo = new TipoUsuario(tipoUsuario);
            EstadoUsuario estado = new EstadoUsuario(estadoUsuario);
            
            // Validamos a nivel de modelo(DTO)
            Usuario usuario = new Usuario(id,estado, tipo, nombre, contra);
            // LLamamos al dao que tiene los metodos
            UsuarioDAO dao = new UsuarioDAO();

            // Agregamos el alumno a la BD
            if (dao.actualizar(usuario)) {
                // Variable de session (nombre de la variable,contenido)
                request.getSession().setAttribute("msjOK", "Usuario Modificado");
            } else {
                // Variable de session (nombre de la variable,contenido)
                request.getSession().setAttribute("msjNO", "Usuario No Modificado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error: ");
        } finally {
            response.sendRedirect("Administrador_Listar.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    

    

}
