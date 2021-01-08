package ProgramaClip.ClipMoneyAPI.repositorio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ProgramaClip.ClipMoneyAPI.entidad.Usuario;

@Repository
public interface UsuarioRepositorio extends JpaRepository<Usuario, Long> {
	public Optional<Usuario> findByNick(String nick);
}
