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
import modelo.dto.Equipo;
import modelo.dto.Jugador;

/**
 *
 * @author Artiko1
 */
public class ServletJugador extends HttpServlet {

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
        
        //Recibimos el boton del formulario
        String opcion = request.getParameter("btnAccion");
        //Cual accion se ejecuta
        if(opcion.equals("Agregar")){
          agregar(request, response);
        }
        if(opcion.equals("Eliminar")) {
            eliminar(request, response);
        }
        if(opcion.equals("Listar")){
           listar(request, response);
        }
        if(opcion.equals("Modificar")){
          modificar(request, response);
        }
        
    }
    protected void agregar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
            //recibimos el formulario
            String rutJugador = request.getParameter("txtRutJugador");
            String nombreJugador = request.getParameter("txtNombreJugador");
            String apellidoJugador = request.getParameter("txtApellidoJugador");
            int idEquipo = Integer.parseInt(request.getParameter("cboEquipo"));
            int idTitular = Integer.parseInt(request.getParameter("cboTitular"));
            //Validamos a nivel de modelo(DTO)
            
            Jugador jug = new Jugador(rutJugador, equipo, titular, nombreJugador, apellidoJugador);
        } catch (Exception e) {
        }
    }
    
    private void eliminar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private void modificar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
