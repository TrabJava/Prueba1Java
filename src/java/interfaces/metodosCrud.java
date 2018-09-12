/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author duoc
 */
public interface metodosCrud<Generico> {
    //Metodos CRUD
    public boolean agregar (Generico g);
    public boolean actualizar (Generico g);
    public boolean actualizarEstado (Generico g);
    public boolean eliminar (Object o);
    public Generico buscar (Object o);
    public List<Generico> listarTodo  (Object g);
    
    
    
}
