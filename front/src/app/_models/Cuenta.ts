import { Moneda } from "./Moneda";
import { Usuario } from "./Usuario";

export class Cuenta{
    cvu : string;
    saldo : number;
    moneda : Moneda;
    usuario : Usuario;
}