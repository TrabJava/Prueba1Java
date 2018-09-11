/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.UsuarioDAO;
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

        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }
        if (opcion.equals("Listar")) {
            listar(request, response);
        }
        /*if (opcion.equals("Eliminar")) {
            eliminar(request, response);
        }
        
        if (opcion.equals("Modificar")) {
            modificar(request, response);
        }
         */
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            //Recibimos los datos del formulario
            String nombre = request.getParameter("txtNombreUsuario");
            String contra = request.getParameter("txtPassword");
            int tipoUsuario = 2;
            int estadoUsuario = 1;

            //Validamos a nivel de modelo (DTO)
            Usuario usuario = new Usuario(nombre, contra);

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
            request.getSession().setAttribute("msjNO", "Error:" + e.getMessage());

        } finally {
            response.sendRedirect("Administrador_Agregar.jsp"
                    + "");
        }

    }

    private void listar(HttpServletRequest request, HttpServletResponse response) {
     
        
        
        
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

}
