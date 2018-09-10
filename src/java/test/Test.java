/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import modelo.dao.UsuarioDAO;
import modelo.dto.Usuario;

/**
 *
 * @author Artiko1
 */
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.buscar("artiko", "12345");
        System.out.println(usuario.toString());
    }
    
}
