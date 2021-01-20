using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class Moneda
    {
        private int id;
        private string nombre;
        private float valorDolares;

        public Moneda(int id, string nombre, float valorDolares)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.ValorDolares = valorDolares;
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public float ValorDolares { get => valorDolares; set => valorDolares = value; }
    }
}