using proyecto_clip_money_e_proyecto_clip.Controllers;
using proyecto_clip_money_e_proyecto_clip.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Gestores
{
    public class UsuarioGestor
    {
        public UsuarioModelo ObtenerUsuarioPorNick(string nick)
        {
            using (var db = new ModeloDatos())
            {
                var query = from u in db.Usuarios
                            where u.Nick == nick
                            select u;

                if (query.Count() == 0)
                {
                    return null;
                }

                return query.Single().ToModel();
            }
        }

        public UsuarioModelo CrearUsuario(UsuarioModelo usuario)
        {
            using (var db = new ModeloDatos())
            {
                Usuario entidad = usuario.ToEntity();
                entidad.Contrasena = new PasswordHasher().HashPassword(entidad.Contrasena);

                UsuarioModelo usuarioNuevo = db.Usuarios.Add(entidad).ToModel();
                db.SaveChanges();

                return usuarioNuevo;
            }
        }
    }
}