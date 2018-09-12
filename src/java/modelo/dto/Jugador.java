package modelo.dto;
// Generated 04-sep-2018 14:31:52 by Hibernate Tools 4.3.1



/**
 * Jugador generated by hbm2java
 */
public class Jugador  implements java.io.Serializable {


     private String rutJugador;
     private Equipo equipo;
     private Titular titular;
     private String nombreJugador;
     private String apellidoJugador;

    public Jugador() {
    }

    public Jugador(String rutJugador) {
        this.rutJugador = rutJugador;
    }

    public Jugador(Equipo equipo, Titular titular, String nombreJugador, String apellidoJugador) {
        this.equipo = equipo;
        this.titular = titular;
        this.nombreJugador = nombreJugador;
        this.apellidoJugador = apellidoJugador;
    }

    public Jugador(String rutJugador, Equipo equipo, Titular titular, String nombreJugador, String apellidoJugador) {
        this.rutJugador = rutJugador;
        this.equipo = equipo;
        this.titular = titular;
        this.nombreJugador = nombreJugador;
        this.apellidoJugador = apellidoJugador;
    }

    

    public String getRutJugador() {
        return this.rutJugador;
    }
    
    public void setRutJugador(String rutJugador) {
        this.rutJugador = rutJugador;
    }
    public Equipo getEquipo() {
        return this.equipo;
    }
    
    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }
    public Titular getTitular() {
        return this.titular;
    }
    
    public void setTitular(Titular titular) {
        this.titular = titular;
    }
    public String getNombreJugador() {
        return this.nombreJugador;
    }
    
    public void setNombreJugador(String nombreJugador) {
        this.nombreJugador = nombreJugador;
    }
    public String getApellidoJugador() {
        return this.apellidoJugador;
    }
    
    public void setApellidoJugador(String apellidoJugador) {
        this.apellidoJugador = apellidoJugador;
    }

    @Override
    public String toString() {
        return "Jugador{" + "rutJugador=" + rutJugador + ", equipo=" + equipo + ", titular=" + titular + ", nombreJugador=" + nombreJugador + ", apellidoJugador=" + apellidoJugador + '}';
    }
    
    
    


}


