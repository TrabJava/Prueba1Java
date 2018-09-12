/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.metodosCrud;
import java.util.List;
import modelo.dto.Jugador;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Artiko1
 */
public class JugadorDAO implements metodosCrud<Jugador>{
    
    //Declaramos variables
    private Session sesion;//la que contiene todo los query
    private Transaction tx;
    
    //Metodo para iniciar la sesion con la BD
    public void iniOperacion(){
      sesion = HibernateUtil.getSessionFactory().openSession();
      tx = sesion.beginTransaction();
    }

    @Override
    public boolean agregar(Jugador g) {
        try {
            iniOperacion();
            sesion.save(g);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo almacenar el jugaador");
        }
  
    }

    @Override
    public boolean actualizar(Jugador g) {
        try {
            iniOperacion();
            Jugador jug = buscar(g.getRutJugador());
            jug.setNombreJugador(g.getNombreJugador());
            jug.setApellidoJugador(g.getApellidoJugador());
            jug.setEquipo(g.getEquipo());
            jug.setTitular(g.getTitular());
            sesion.update(jug);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo actualizar el Jugador");
        }
  
    }

    @Override
    public boolean eliminar(Object o) {
         try {
             iniOperacion();
             Jugador jug = buscar(o);
             sesion.delete(jug);
             tx.commit();
             sesion.close();
             return true;
        } catch (Exception e) {
             tx.rollback();
             sesion.close();
             throw new RuntimeException("No se pudo eliminar el Jugador");
        }
       }

    @Override
    public Jugador buscar(Object o) {
        try {
            iniOperacion();
            List<Jugador> lista = sesion.createQuery("from Jugador where id="+o).list();
            for (Jugador jug : lista){
                return jug;
            }
        } catch (Exception e) {
               tx.rollback();
               sesion.close();
               throw new RuntimeException("No se pudo el Jugador");
        }
          return null;
    }

    @Override
    public List<Jugador> listarTodo() {
        try {
            iniOperacion();
            List<Jugador>lista = sesion.createQuery("from Jugador").list();
            return lista;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo listar los Jugadores");
        }
    }

    @Override
    public boolean actualizarEstado(Jugador g) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
