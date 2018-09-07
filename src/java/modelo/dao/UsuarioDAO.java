/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @ La vieja del bernal se la re come, !Pero si salio mas puta que la madre!
 */
public class UsuarioDAO {
    
    private Session session; //Contiene los Querys
    private Transaction tx; // Ejecuta los Querys
    
    public void iniOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        tx=session.beginTransaction();
    }
    
    
}
