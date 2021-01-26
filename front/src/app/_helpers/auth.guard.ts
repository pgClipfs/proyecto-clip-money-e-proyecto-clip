import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

import { LoginService } from '@app/_services/login/login.service';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate {
    constructor(
        private router: Router,
        private usuarioServicio : LoginService) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) : boolean{
        const loginResponse = this.usuarioServicio.loginResponseValue;

        if (loginResponse) {
            return true;
        }

        this.router.navigate(['/login'], { queryParams: { returnUrl: state.url }});
        return false;
    }
}