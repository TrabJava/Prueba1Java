/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.dto.Usuario;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class AccesoDAO {
    
    private Session session; //Contiene los Querys
    private Transaction tx; // Ejecuta los Querys
    
    public void iniOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        tx=session.beginTransaction();
    }
    
    //Metodos para leer el usuario
    public Usuario buscar(String user,String pass){
        try {
           iniOperaciones();
            List<Usuario> lista = session.createQuery("from Usuario where nombre_usuario='"+ user +"' and contrasenia='"+ pass +"'").list();
            for (Usuario aux : lista) {
                if (aux.getNombreUsuario().equals(user) && aux.getContrasenia().equals(pass)) {
                    return aux;
                }
            }
            
        } catch (Exception e) {
           tx.rollback();
           session.close();
           throw new RuntimeException("Error :  " );
        }
        return null;
    }
    
}
