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
import modelo.dao.AccesoDAO;
import modelo.dto.Usuario;

/**
 *
 * @author Artiko1
 */
public class ServletAcceso extends HttpServlet {

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
        try {
            //Recibimos los parametros del formulario
            String user= request.getParameter("txtNombreUsuario");
            String pass= request.getParameter("txtPassword");
            
            //Validamos DTO
            Usuario usuario = new Usuario(user, pass);
            
            //Validadmos el Usuario
            AccesoDAO dao= new AccesoDAO();
            Usuario aux = dao.buscar(usuario.getNombreUsuario(), usuario.getContrasenia());
            
            //validamos el tipo de usuario
            if (aux.getTipoUsuario().getDescripcionTipoUsuario().equals("superusuario")){
              //redireccion
              request.getSession().setAttribute("usuario", usuario.getNombreUsuario());
              request.getSession().setAttribute("tipo", aux.getTipoUsuario().getIdTipoUsuario());
              request.getSession().setAttribute("estado", aux.getEstadoUsuario().getIdEstadoUsuario());
              response.sendRedirect("Administrador_index.jsp");
            }else if(aux.getTipoUsuario().getDescripcionTipoUsuario().equals("administrador")){
              request.getSession().setAttribute("usuario", usuario.getNombreUsuario());
              request.getSession().setAttribute("tipo", aux.getTipoUsuario().getIdTipoUsuario());
              request.getSession().setAttribute("estado", aux.getEstadoUsuario().getIdEstadoUsuario());
              response.sendRedirect("Coach_Index.jsp");
            }else if(aux.getTipoUsuario().getDescripcionTipoUsuario().equals("usuario")){
                request.getSession().setAttribute("idUsuario", usuario.getIdUsuario());
              request.getSession().setAttribute("usuario", usuario.getNombreUsuario());
              request.getSession().setAttribute("tipo", aux.getTipoUsuario().getIdTipoUsuario());
              response.sendRedirect("Usuario_Index.jsp");
            }else{
                request.getSession().setAttribute("mensaje", "Error");
                response.sendRedirect("login.jsp");
            }
            
        } catch (Exception ex) {
            response.sendRedirect("login.jsp");
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

}
