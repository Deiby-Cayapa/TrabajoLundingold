import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true, // esto es necesario en componentes standalone
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrls: ['./app.css']  // ← corregido aquí (antes estaba mal escrito)
})
export class App {
  protected readonly title = signal('frontend');
}
