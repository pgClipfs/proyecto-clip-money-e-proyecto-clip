import { Component } from '@angular/core';

import { AccountService } from './_services';
import { User } from './_models';
import { Usuario } from './_models/Usuario';
import { UsuarioService } from './_services/usuario/usuario.service';
import { LoginService } from './_services/login/login.service';
import { Router } from '@angular/router';
import { LoginResponse } from './_models/LoginResponse';

@Component({ selector: 'app-root', templateUrl: 'app.component.html' })
export class AppComponent {
    loginResponse : LoginResponse;

    constructor(private router : Router,
        private loginServicio : LoginService) {
            this.loginServicio.loginResponse.subscribe(lr => this.loginResponse = lr);
    }

    logout() {
        this.loginServicio.logout();
        this.router.navigate(['/login']);
    }
}