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
import modelo.dao.JugadorDAO;
import modelo.dto.Equipo;
import modelo.dto.Jugador;
import modelo.dto.Titular;

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
        response.setContentType("text/html;charset=UTF-8");
        
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
            //recibimos el formulario
            String rutJugador = request.getParameter("txtRutJugador");
            String nombreJugador = request.getParameter("txtNombreJugador");
            String apellidoJugador = request.getParameter("txtApellidoJugador");
            int idEquipo = Integer.parseInt(request.getParameter("txtIdEquipo"));
            int idTitular = Integer.parseInt(request.getParameter("cboTitular"));
            //Validamos a nivel de modelo(DTO)
            Equipo equipo = new Equipo(idEquipo);
            Titular titular = new Titular(idTitular);
            Jugador jugador = new Jugador(rutJugador, equipo, titular, nombreJugador, apellidoJugador);
            
            //llamamos al dao que tiene los metodos
            JugadorDAO dao = new JugadorDAO();
            
            //agregamos al equipo a la base de datos
            if(dao.agregar(jugador)){
             //Variable de sesion (nombre de la variable, contenido)
             request.getSession().setAttribute("msjOK", "Jugador Agregado");
            }else{
             //Variable de session(nombre de la variable, contenido)
             request.getSession().setAttribute("msjNO", "Jugador no Agregado");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msjNo", "Error: "+ e.getMessage());
        }finally{
          response.sendRedirect("index.jsp");
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       try {
            //Recibimos los datos del formulario
            int id = Integer.parseInt(request.getParameter("txtID"));
            //Llamamos al dao que tiene los metodos
            JugadorDAO dao = new JugadorDAO();
            
            //Preguntamos si se elimina
            if (dao.eliminar(dao)) {
               //Variable de session (nombre de la variable, contenido)
               request.getSession().setAttribute("msjOK", "Jugador eliminado");
            }else{
               //Variable de session (nombre de la variable, contenido)
               request.getSession().setAttribute("msjNO", "Jugador no eliminado");
            }
        } catch (Exception e) {
              request.getSession().setAttribute("msjNO", "Error: " +e.getMessage());
        } finally{
              response.sendRedirect("index.jsp");
       }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //Llamamos al dao para poder listar
        JugadorDAO dao = new JugadorDAO();
        request.getSession().setAttribute("jugador", dao.listarTodo());
        response.sendRedirect("index.jsp");
    
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            //Recibimos el formulario
            String rut = request.getParameter("txtRut");
            String nombreJugador = request.getParameter("txtNombreJugador");
            String apellidoJugador = request.getParameter("txtApellidoJugador");
            int id_equipo = Integer.parseInt(request.getParameter("cboEquipo"));
            int id_titular = Integer.parseInt(request.getParameter("cboTitular"));
            //Validamos a nivel que tiene los metodos
            Equipo equipo = new Equipo(id_equipo);
            Titular titular = new Titular(id_titular);
            Jugador jug = new Jugador(nombreJugador, equipo, titular, nombreJugador, apellidoJugador);
            //Agregar el alumno a la Base de datos
            JugadorDAO dao = new JugadorDAO();
            if (dao.actualizar(jug)) {
                //variable de session(nombre de la variable, contenido)
                request.getSession().setAttribute("msjOK", "Jugador Modificado");
            }else{
                //variable de session (nombre de la variable, contenido)
                request.getSession().setAttribute("msjNO", "Jugador No Modificado");
            }
        } catch (Exception e) {
                request.getSession().setAttribute("msjNO", "Error: "+e.getMessage());
        } finally{
                response.sendRedirect("index.jsp");
        }
    
    }

}
