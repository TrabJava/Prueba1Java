/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.metodosCrud;
import java.util.List;
import modelo.dto.Partido;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Artiko1
 */
public class PartidoDAO implements metodosCrud<Partido>{
    
    private Session sesion;
    private Transaction tx;
    
    public void iniOperaciones(){
     sesion = HibernateUtil.getSessionFactory().openSession();
     tx = sesion.beginTransaction();
    }

    @Override
    public boolean agregar(Partido g) {
        try {
            iniOperaciones();
            sesion.save(g);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
           tx.rollback();
           sesion.close();
           throw new RuntimeException("No se pudo agregar el Partido");
        }
    }

    @Override
    public boolean actualizar(Partido g) {
        try {
            iniOperaciones();
            Partido par = buscar(g.getIdPartido());
            par.setIdLiga(g.getIdPartido());
            par.setEquipoByEquipo1(g.getEquipoByEquipo1());
            par.setEquipoByEquipo2(g.getEquipoByEquipo2());
            par.setEquipoGanador(g.getEquipoGanador());
            par.setEquipoPerdedor(g.getEquipoPerdedor());
            par.setFechaPartido(g.getFechaPartido());
            sesion.update(par);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo actualizar el Partido");
        }
   
    }

    @Override
    public boolean eliminar(Object o) {
        try {
            iniOperaciones();
            Partido par = buscar(o);
            sesion.delete(par);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo eliminar el Partido");
        }
    
    }

    @Override
    public Partido buscar(Object o) {
        try {
            iniOperaciones();
            List<Partido> lista = sesion.createQuery("from Partido where id="+o).list();
            for(Partido par : lista){
              return par;
            }
        } catch (Exception e) {
           tx.rollback();
           sesion.close();
           throw new RuntimeException("No se pudo buscar el Partido");
        }
        return null;
    }

    @Override
    public List<Partido> listarTodo(Object g) {
        try {
            iniOperaciones();
            List<Partido> lista = sesion.createQuery("from Alumno").list();
            return lista;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo listar los Partidos");
        }
   
    }
    
}
