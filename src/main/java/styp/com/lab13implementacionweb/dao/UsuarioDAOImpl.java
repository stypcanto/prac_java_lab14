package styp.com.lab13implementacionweb.dao;

import styp.com.lab13implementacionweb.dto.UsuarioDTO;

import java.sql.*;
import java.util.List;

public class UsuarioDAOImpl implements IUsuarioDAO {

    @Override
    public boolean insertar(UsuarioDTO usuario) {
        return false;
    }

    @Override
    public List<UsuarioDTO> listar() {
        return List.of();
    }

    @Override
    public UsuarioDTO obtenerPorId(int idUsuario) {
        return null;
    }

    @Override
    public UsuarioDTO obtenerPorUsername(String username) {
        return null;
    }

    @Override
    public UsuarioDTO login(String username, String password) {
        String sql = "SELECT id, usuario, CAST(AES_DECRYPT(clave, 'cibertec') AS CHAR) AS clave " +
                "FROM usuario WHERE usuario = ?";
        try (Connection conexion = ConnectionDB.getConnection();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String claveBD = rs.getString("clave"); // Contraseña desencriptada
                if (claveBD != null && claveBD.equals(password)) {
                    return new UsuarioDTO(
                            rs.getInt("id"),
                            rs.getString("usuario"),
                            claveBD
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Usuario no encontrado o contraseña incorrecta
    }

    @Override
    public boolean actualizar(UsuarioDTO usuario) {
        return false;
    }

    @Override
    public boolean eliminar(int idUsuario) {
        return false;
    }
}
