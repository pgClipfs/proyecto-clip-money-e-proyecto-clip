using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    [Serializable()]
    public class UsuarioModelo
    {
        private long id;
        private string nick;
        private string contrasena;

        public UsuarioModelo(long id, string nick, string contrasena)
        {
            this.Id = id;
            this.Nick = nick;
            this.Contrasena = contrasena;
        }

        public long Id { get => id; set => id = value; }
        public string Nick { get => nick; set => nick = value; }
        public string Contrasena { get => contrasena; set => contrasena = value; }
    }
}