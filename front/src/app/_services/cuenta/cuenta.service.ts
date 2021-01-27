import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Cuenta } from '@app/_models/Cuenta';
import { LoginResponse } from '@app/_models/LoginResponse';
import { environment } from '@environments/environment.prod';

@Injectable({
    providedIn: 'root'
})
export class CuentaService {

    constructor(private http: HttpClient) { }

    obtenerCuentasPorNickUsuario(loginResponse: LoginResponse) {
        var params: HttpParams = new HttpParams()
            .set('nick', loginResponse.Nick);

        var headers: HttpHeaders = new HttpHeaders({
            'Authorization': `Bearer ${loginResponse.Token}`
        })

        return this.http.get<Cuenta[]>(`${environment.apiUrl}/Cuenta`, { headers: headers, params: params });
    }
}
