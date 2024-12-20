package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Base {

    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;

    public Base() {
        this.usrBD = "root";
        this.passBD = "n0m3l0";
        this.urlBD = "jdbc:mysql://127.0.0.1:3306/castorway";
        this.driverClassName = "com.mysql.cj.jdbc.Driver";
    }

    public String getUsrBD() {
        return usrBD;
    }

    public void setUsrBD(String usrBD) {
        this.usrBD = usrBD;
    }

    public String getPassBD() {
        return passBD;
    }

    public void setPassBD(String passBD) {
        this.passBD = passBD;
    }

    public String getUrlBD() {
        return urlBD;
    }

    public void setUrlBD(String urlBD) {
        this.urlBD = urlBD;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void conectar() {
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
        } catch (Exception err) {
            System.out.println("Error " + err.getMessage());
        }
    }

    //cerrar conexión a BD
    public void cierraConexion() throws SQLException {
        this.conn.close();
    }

    public int insertar(String inserta) throws SQLException {

        Statement st = (Statement) this.conn.createStatement();

        return st.executeUpdate(inserta);
    }

    public ResultSet consulta(String consulta) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeQuery(consulta);
    }

}
