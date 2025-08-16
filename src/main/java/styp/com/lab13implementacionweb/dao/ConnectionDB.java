package styp.com.lab13implementacionweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

    private static Connection connection; // única conexión
    private static final String URL = "jdbc:mysql://mysql-db:3306/web?useSSL=false&serverTimezone=UTC";
    private static final String USER = "usuario";
    private static final String PASSWORD = "root";

    private ConnectionDB() {} // constructor privado

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) { // se crea solo una vez
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (ClassNotFoundException e) {
                throw new SQLException("Error cargando el driver MySQL", e);
            }
        }
        return connection;
    }
}


