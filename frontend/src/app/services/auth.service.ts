// src/app/services/auth.service.ts

import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private API_URL = 'http://localhost:8000/api';

  constructor(private http: HttpClient) {}

  // Registro de usuario
  register(username: string, password: string): Observable<any> {
    return this.http.post(`${this.API_URL}/register/`, {
      username,
      password,
    });
  }

  // Login (JWT)
  login(username: string, password: string): Observable<{ access: string; refresh: string }> {
    return this.http.post<{ access: string; refresh: string }>(
      `${this.API_URL}/login/`,
      { username, password }
    );
  }

  // Obtener perfil del usuario autenticado
  getProfile(token: string): Observable<any> {
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);
    return this.http.get(`${this.API_URL}/me/`, { headers });
  }

  // Guardar token en localStorage
  saveToken(token: string): void {
    localStorage.setItem('access_token', token);
  }

  // Obtener token
  getToken(): string | null {
    return localStorage.getItem('access_token');
  }

  // Cerrar sesión
  logout(): void {
    localStorage.removeItem('access_token');
  }

  // Verificar si está logueado
  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }
}