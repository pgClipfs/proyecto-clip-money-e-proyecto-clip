using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyecto_clip_money_e_proyecto_clip.Models
{
    public class DatosUsuarioModelo
    {
        private long id;
        private int dni;
        private string nombres;
        private string apellidos;
        private string email;
        private string telefono;
        private string direccion;
        private string codigoPostal;
        private LocalidadModelo localidad;

        public DatosUsuarioModelo(long id, int dni, string nombres, string apellidos, string email, string telefono, string direccion, string codigoPostal, LocalidadModelo localidad)
        {
            this.Id = id;
            this.Dni = dni;
            this.Nombres = nombres;
            this.Apellidos = apellidos;
            this.Email = email;
            this.Telefono = telefono;
            this.Direccion = direccion;
            this.CodigoPostal = codigoPostal;
            this.Localidad = localidad;
        }

        public long Id { get => id; set => id = value; }
        public int Dni { get => dni; set => dni = value; }
        public string Nombres { get => nombres; set => nombres = value; }
        public string Apellidos { get => apellidos; set => apellidos = value; }
        public string Email { get => email; set => email = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string CodigoPostal { get => codigoPostal; set => codigoPostal = value; }
        public LocalidadModelo Localidad { get => localidad; set => localidad = value; }
    }
}