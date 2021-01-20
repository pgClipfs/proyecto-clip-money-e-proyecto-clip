using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class TipoPlazoFijo
    {
        private int id;
        private string nombre;
        private int plazoMinimoDias;
        private float interesAnual;
        private float montoMinimo;
        private Moneda moneda;

        public TipoPlazoFijo(int id, string nombre, int plazoMinimoDias, float interesAnual, float montoMinimo, Moneda moneda)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.PlazoMinimoDias = plazoMinimoDias;
            this.InteresAnual = interesAnual;
            this.MontoMinimo = montoMinimo;
            this.Moneda = moneda;
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int PlazoMinimoDias { get => plazoMinimoDias; set => plazoMinimoDias = value; }
        public float InteresAnual { get => interesAnual; set => interesAnual = value; }
        public float MontoMinimo { get => montoMinimo; set => montoMinimo = value; }
        public Moneda Moneda { get => moneda; set => moneda = value; }
    }
}