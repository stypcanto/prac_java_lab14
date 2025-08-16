package styp.com.lab13implementacionweb.dao;

import styp.com.lab13implementacionweb.dto.UsuarioDTO;
import java.util.List;

public interface IUsuarioDAO {
    boolean insertar(UsuarioDTO usuario);
    List<UsuarioDTO> listar();
    UsuarioDTO obtenerPorId(int idUsuario);
    UsuarioDTO obtenerPorUsername(String username);
    UsuarioDTO login(String username, String password);
    boolean actualizar(UsuarioDTO usuario);
    boolean eliminar(int idUsuario);
}
