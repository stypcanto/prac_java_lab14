package styp.com.lab13implementacionweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

    private static Connection connection;

    private static final String URL = "jdbc:mysql://mysql-db:3306/web?useSSL=false&serverTimezone=UTC";
    private static final String USER = "usuario";
    private static final String PASSWORD = "root";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Error cargando el driver MySQL", e);
        }
    }
}

