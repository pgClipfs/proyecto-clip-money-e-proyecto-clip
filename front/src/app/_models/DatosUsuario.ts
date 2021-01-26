import { Localidad } from "./Localidad";

export class DatosUsuario {
    Id : number;
    Dni : number;
    Nombres : string;
    Apellido : string;
    Email : string;
    Telefono : string;
    Direccion : string;
    CodigoPostal : string;
    Localidad : Localidad;
}