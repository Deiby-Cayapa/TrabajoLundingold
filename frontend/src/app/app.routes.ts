import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
 import { RegisterComponent } from './register/register.component';
// import { DashboardComponent } from './dashboard/dashboard.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: '', redirectTo: 'login', pathMatch: 'full' },
   { path: 'register', component: RegisterComponent },
//   { path: 'dashboard', component: DashboardComponent },
];
