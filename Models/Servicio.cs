using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class Servicio
    {
        private long id;
        private string razonSocial;
        private long cuit;

        public Servicio(long id, string razonSocial, long cuit)
        {
            this.Id = id;
            this.RazonSocial = razonSocial;
            this.Cuit = cuit;
        }

        public long Id { get => id; set => id = value; }
        public string RazonSocial { get => razonSocial; set => razonSocial = value; }
        public long Cuit { get => cuit; set => cuit = value; }
    }
}