using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    [Serializable()]
    public class MonedaModelo
    {
        private int id;
        private string nombre;
        private double valorDolares;

        public MonedaModelo(int id, string nombre, double valorDolares)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.ValorDolares = valorDolares;
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public double ValorDolares { get => valorDolares; set => valorDolares = value; }
    }
}