/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.metodosCrud;
import java.util.List;
import modelo.dto.Usuario;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Artiko1
 */
public class UsuarioDAO implements metodosCrud<Usuario>{
    
    //declaramos variables
    private Session sesion;// la que contiene todos los querys
    private Transaction tx; // que ejecuta los querys
    
    
//Metodo para iniciar la sesion co la BD
    public void iniOperacion(){
    sesion = HibernateUtil.getSessionFactory().openSession();
    tx = sesion.beginTransaction();
    
    }
    @Override
    public boolean agregar(Usuario g) {
        try {
            iniOperacion();
            sesion.save(g);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo almacenar el usuario");
        }
    }

    @Override
    public boolean actualizar(Usuario g) {
        try {
            iniOperacion();
            Usuario usu = buscar(g.getIdUsuario());
            usu.setNombreUsuario(g.getNombreUsuario());
            usu.setContrasenia(g.getContrasenia());
            usu.setTipoUsuario(g.getTipoUsuario());
            usu.setEstadoUsuario(g.getEstadoUsuario());
            sesion.update(usu);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo actualizar el Usuario");
        }
    }

    @Override
    public boolean eliminar(Object o) {
        try {
            iniOperacion();
            Usuario usu = buscar(o);
            sesion.delete(usu);
            tx.commit();
            sesion.close();
            return true;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw new RuntimeException("No se pudo eliminar el usuario");
        }
    }

    @Override
    public Usuario buscar(Object o) {
         try {
            iniOperacion();
            List<Usuario> lista = sesion.createQuery("from Usuario where id="+o).list();
             for (Usuario usu : lista) {
                 return usu;
             }
         } catch (Exception e) {
             tx.rollback();
             sesion.close();
             throw new RuntimeException("No se pudo buscar el Usuario");
         }
         return null;
    }

    @Override
    public List<Usuario> listarTodo(Object g) {
        try {
            iniOperacion();
            List<Usuario> list = sesion.createQuery("from Usuario").list();
            return list;
        } catch (Exception e) {
            tx.rollback();
            sesion.close();
            throw  new RuntimeException("No se pudo listar los Usuario: " + e.getMessage());
        }
    }
}
