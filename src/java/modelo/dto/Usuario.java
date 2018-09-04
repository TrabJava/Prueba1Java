package modelo.dto;
// Generated 04-sep-2018 14:31:52 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private Integer idUsuario;
     private EstadoUsuario estadoUsuario;
     private TipoUsuario tipoUsuario;
     private String nombreUsuario;
     private String contrasenia;
     private Set<Equipo> equipos = new HashSet<Equipo>(0);

    public Usuario() {
    }

	
    public Usuario(EstadoUsuario estadoUsuario, TipoUsuario tipoUsuario, String nombreUsuario, String contrasenia) {
        this.estadoUsuario = estadoUsuario;
        this.tipoUsuario = tipoUsuario;
        this.nombreUsuario = nombreUsuario;
        this.contrasenia = contrasenia;
    }
    public Usuario(EstadoUsuario estadoUsuario, TipoUsuario tipoUsuario, String nombreUsuario, String contrasenia, Set<Equipo> equipos) {
       this.estadoUsuario = estadoUsuario;
       this.tipoUsuario = tipoUsuario;
       this.nombreUsuario = nombreUsuario;
       this.contrasenia = contrasenia;
       this.equipos = equipos;
    }
   
    public Integer getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
    public EstadoUsuario getEstadoUsuario() {
        return this.estadoUsuario;
    }
    
    public void setEstadoUsuario(EstadoUsuario estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }
    public TipoUsuario getTipoUsuario() {
        return this.tipoUsuario;
    }
    
    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    public String getNombreUsuario() {
        return this.nombreUsuario;
    }
    
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    public String getContrasenia() {
        return this.contrasenia;
    }
    
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }
    public Set<Equipo> getEquipos() {
        return this.equipos;
    }
    
    public void setEquipos(Set<Equipo> equipos) {
        this.equipos = equipos;
    }




}


