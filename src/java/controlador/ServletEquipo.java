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
import modelo.dao.equipoDAO;
import modelo.dto.Equipo;
import modelo.dto.Liga;
import modelo.dto.Usuario;

/**
 *
 * @author Artiko1
 */
public class ServletEquipo extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        //Recibimos el boton del formulario
        String opcion = request.getParameter("btnAccion");
        //Cual accion se ejecuta
        if(opcion.equals("Agregar")) {
            agregar(request, response);
        }
        if(opcion.equals("Ekiminar")){
           eliminar(request, response);
        }
        if(opcion.equals("Listar")){
           listar(request, response);
        }
        if(opcion.equals("Modificar")){
           modificar(request, response);
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

    private void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       try {
            //Recibimos el formulario
            String nombreEquipo = request.getParameter("txtNombreEquipo");
            int id_liga = Integer.parseInt(request.getParameter("cboLiga"));
            String logotipo = request.getParameter("fileLogo");
            int id_Usuario = Integer.parseInt(request.getParameter("txtIdEquipo"));
            //Validamos a nivel de modelo(DTO)
            Liga liga = new Liga(id_liga);
            Usuario usuario = new Usuario(id_Usuario);
            
            Equipo equipo = new Equipo(liga, usuario, nombreEquipo, logotipo);
            //llamamos al dao que tiene los metodos
            equipoDAO dao = new equipoDAO();
            
            //agregamos al equipo a la base de datos
            if(dao.agregar(equipo)){
             //Variable de sesion (nombre de la variable, contenido )
             request.getSession().setAttribute("msjOK", "Equipo Agregado");
            }else{
            //Variable de session(nombre de la variable, contenido)
            request.getSession().setAttribute("msjNO", "Equipo no Agregado");
            }
         } catch (Exception e) {
            request.getSession().setAttribute("msjNO", "Error: " +e.getMessage());
         }finally{
           response.sendRedirect("index.jsp");
         }
    
    }
    

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        
    
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
