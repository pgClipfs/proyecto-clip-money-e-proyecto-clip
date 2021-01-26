import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { LoginResponse } from '@app/_models/LoginResponse';
import { environment } from '@environments/environment.prod';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { UsuarioService } from '../usuario/usuario.service';

@Injectable({
    providedIn: 'root'
})
export class LoginService {
    public loginResponse : Observable<LoginResponse>;
    public loginResponseSubject : BehaviorSubject<LoginResponse>;

    constructor(private http: HttpClient) {
            this.loginResponseSubject = new BehaviorSubject<LoginResponse>(JSON.parse(localStorage.getItem('loginResponse')));
            this.loginResponse = this.loginResponseSubject.asObservable();
    }

    public get loginResponseValue(): LoginResponse {
        return this.loginResponseSubject.value;
      }

    login(Nick, Contrasena) : Observable<LoginResponse>{
        return this.http.post<LoginResponse>(`${environment.apiUrl}/login/authenticate`, { Nick, Contrasena })
            .pipe(map(loginResponse => {
                localStorage.setItem('loginResponse', JSON.stringify(loginResponse));
                this.loginResponseSubject.next(loginResponse);
                return loginResponse;
            }));
    }
    
    logout() {
        localStorage.removeItem('loginResponse');
        this.loginResponseSubject.next(null);
    }
}
