import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { trigger, transition, style, animate } from '@angular/animations';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {

  @ViewChild('passwordInput') passwordInput!: ElementRef;

  username = '';
  password = '';
  errorMessage = '';
  mostrarMensaje: boolean = false;

  constructor(private authService: AuthService, private router: Router) { }

  login() {
    if (this.username === '' || this.password === '') {
      this.errorMessage = 'Por favor complete todos los campos';
      this.mostrarErrorTemporal();
      return;
    }

    this.authService.login(this.username, this.password).subscribe({
      next: (data) => {
        this.authService.saveToken(data.access);
        // this.router.navigate(['/dashboard']);
      },
      error: (err) => {
        this.errorMessage = 'Usuario o contraseña incorrectos';
        this.mostrarErrorTemporal();
        console.error(err);
      }
    });
  }

  mostrarErrorTemporal() {
    this.mostrarMensaje = true;
    setTimeout(() => {
      this.mostrarMensaje = false;
    }, 3000); // 3 segundos
  }

  togglePasswordVisibility() {
    const input = this.passwordInput.nativeElement;
    input.type = input.type === 'password' ? 'text' : 'password';
  }
}
