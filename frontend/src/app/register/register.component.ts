import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [ FormsModule, CommonModule ],
  templateUrl: './register.component.html',
})
export class RegisterComponent {
  username = '';
  password = '';
  errorMessage = '';

  constructor(private authService: AuthService, private router: Router) {}

  onRegister() {
    this.authService.register(this.username, this.password).subscribe({
      next: () => {
        alert('¡Usuario registrado!');
        this.router.navigate(['/login']);
      },
      error: (err) => {
        this.errorMessage = 'Error al registrar: ' + err.error?.message || 'Verifica los datos';
      },
    });
  }
}
