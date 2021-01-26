import { Component } from '@angular/core';

import { User } from '@app/_models';
import { Usuario } from '@app/_models/Usuario';
import { AccountService } from '@app/_services';
import { LoginService } from '@app/_services/login/login.service';
import { UsuarioService } from '@app/_services/usuario/usuario.service';

@Component({ templateUrl: 'home.component.html' })
export class HomeComponent {
    usuarioActual : Usuario;

    constructor(private usuarioServicio : UsuarioService,
        private loginServicio : LoginService) {}

    ngOnInit() {
        this.usuarioServicio.obtenerUsuarioPorNick(this.loginServicio.loginResponseValue).subscribe(u => this.usuarioActual = u);
    }
}