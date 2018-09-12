/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.metodosCrud;
import java.util.List;
import modelo.dto.Equipo;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Artiko1
 */
public class equipoDAO implements metodosCrud<Equipo>{
    
    //Declaramos variables
    private Session sesion; // la que contiene todos los query
    private Transaction tx; // que ejecuta los querys
    
    
    //Metodo para inciar la sesion con la BD
    public void iniOperacion(){
     sesion = HibernateUtil.getSessionFactory().openSession();
     tx = sesion.beginTransaction();
    }

    @Override
    public boolean agregar(Equipo g) {
        try {
            iniOperacion();
            sesion.save(g);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo almacenar el Equipo");
        }
   
    }

    @Override
    public boolean actualizar(Equipo g) {
        try {
            iniOperacion();
            Equipo eq = buscar(g.getIdEquipo());
            eq.setNombreEquipo(g.getNombreEquipo());
            eq.setLiga(g.getLiga());
            eq.setLogoEquipo(g.getLogoEquipo());
            eq.setUsuario(g.getUsuario());
            sesion.update(eq);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo actualizar el Equipo");
        }
    }

    @Override
    public boolean eliminar(Object o) {
         try {
            iniOperacion();
            Equipo eq = buscar(o);
            sesion.delete(eq);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo eliminar el Equipo");
        }
    
    }

    @Override
    public Equipo buscar(Object o) {
        try {
            iniOperacion();
            List<Equipo> lista = sesion.createQuery("from Equipo where id="+o).list();
            for(Equipo eq : lista){
               return eq;
            }
        } catch (Exception e) {
             tx.rollback();
             sesion.close();
             throw new RuntimeException("No se pudo buscar el Equipo");
        }
        return null;
    }

    @Override
    public List<Equipo> listarTodo() {
        try {
            iniOperacion();
            List<Equipo> lista = sesion.createQuery("from Equipo").list();
            return lista;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo listar los Equipos");
        }
    
    }

    @Override
    public boolean actualizarEstado(Equipo g) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
