import { Component } from '@angular/core';

import { User } from '@app/_models';
import { Cuenta } from '@app/_models/Cuenta';
import { Usuario } from '@app/_models/Usuario';
import { AccountService } from '@app/_services';
import { CuentaService } from '@app/_services/cuenta/cuenta.service';
import { LoginService } from '@app/_services/login/login.service';
import { UsuarioService } from '@app/_services/usuario/usuario.service';

@Component({ templateUrl: 'home.component.html' })
export class HomeComponent {
    usuarioActual : Usuario;
    cuentas : Cuenta[];

    constructor(private usuarioServicio : UsuarioService,
        private cuentaSerivicio : CuentaService,
        private loginServicio : LoginService) {}

    ngOnInit() {
        this.usuarioServicio.obtenerUsuarioPorNick(this.loginServicio.loginResponseValue).subscribe(u => this.usuarioActual = u);
        this.cuentaSerivicio.obtenerCuentasPorNickUsuario(this.loginServicio.loginResponseValue).subscribe(c => this.cuentas = c);
    }
}