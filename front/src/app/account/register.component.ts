import { Component, OnInit, ɵALLOW_MULTIPLE_PLATFORMS } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AbstractControl, FormBuilder, FormGroup, ValidatorFn, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';

import { AccountService, AlertService } from '@app/_services';
import { LoginService } from '@app/_services/login/login.service';
import { UsuarioService } from '@app/_services/usuario/usuario.service';
import { Localidad } from '@app/_models/Localidad';
import { Usuario } from '@app/_models/Usuario';

@Component({ templateUrl: 'register.component.html' })
export class RegisterComponent implements OnInit {
    form: FormGroup;
    loading = false;
    submitted = false;

    constructor(
        private formBuilder: FormBuilder,
        private route: ActivatedRoute,
        private router: Router,
        private loginServicio : LoginService,
        private usuarioServicio : UsuarioService,
        private alertService: AlertService
    ) { }

    ngOnInit() {
        if (this.loginServicio.loginResponseValue)  {
            this.router.navigate(["/"]);
        } else {
            this.form = this.formBuilder.group({
                nick: ['', [Validators.required]],
                contrasena: ['', [Validators.required, Validators.minLength(8)]],
                contrasena2: ['', [Validators.required, Validators.minLength(8)]],
                dni: ['', Validators.required, Validators.minLength(8), Validators.maxLength(8)],
                nombres: ['', Validators.required],
                apellidos: ['', Validators.required],
                email: ['', Validators.required, Validators.email],
                fechaNacimiento: ['', Validators.required],
                telefono: ['', ],
                direccion: ['', ],
                codigoPostal: ['', Validators.required],
                localidad: ['', Validators.required],
            });
        }
    }

    // convenience getter for easy access to form fields
    get f() { return this.form.controls; }

    onSubmit() {
        this.submitted = true;

        // reset alerts on submit
        this.alertService.clear();

        // stop here if form is invalid
        if (this.form.invalid) {
            return;
        }

        this.loading = true;

        var nuevoUsuario : Usuario = {
            id : null,
            nick : this.form.get("nick").value,
            contrasena : this.form.get("contrasena").value,
            datosUsuario : {
                Id : null,
                Dni : this.form.get("dni").value,
                Nombres : this.form.get("nombres").value,
                Apellidos : this.form.get("apellidos").value,
                Email : this.form.get("email").value,
                Telefono : this.form.get("telefono").value,
                Direccion : this.form.get("direccion").value,
                CodigoPostal : this.form.get("codigoPostal").value,
                Localidad : {
                    Id : 1,
                    Nombre : null
                }
            }
        }
        this.usuarioServicio.registrar(nuevoUsuario)
            .pipe(first())
            .subscribe(
                data => {
                    this.alertService.success('Registration successful', { keepAfterRouteChange: true });
                    this.router.navigate(['/login'], { relativeTo: this.route });
                },
                error => {
                    this.alertService.error(error);
                    this.loading = false;
                });
    }
}