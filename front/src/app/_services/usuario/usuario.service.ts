import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Usuario } from '@app/_models/Usuario';
import { environment } from '@environments/environment.prod';
import { BehaviorSubject, Observable } from 'rxjs';
import { LoginService } from '../login/login.service';
import { map } from 'rxjs/operators';
import { LoginResponse } from '@app/_models/LoginResponse';

@Injectable({
    providedIn: 'root'
})
export class UsuarioService {
    constructor(private http: HttpClient) {}

    obtenerUsuarioPorNick(loginResponse : LoginResponse) : Observable<Usuario> {
        var params : HttpParams = new HttpParams()
            .set('nick', loginResponse.Nick);
        
        var headers : HttpHeaders = new HttpHeaders({
            'Authorization': `Bearer ${loginResponse.Token}`
        })

        return this.http.get<Usuario>(`${environment.apiUrl}/Usuario`, { headers : headers, params : params });
    }

    registrar(usuarioNuevo : Usuario) {
        return this.http.post<Usuario>(`${environment.apiUrl}/Usuario`, usuarioNuevo);
    }
}
