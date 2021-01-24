using proyecto_clip_money_e_proyecto_clip.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Gestores
{
    public class UsuarioGestor
    {
        public UsuarioModelo ObetenerUsuarioPorNick(string nick)
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
    }
}