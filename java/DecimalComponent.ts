import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-decimal',
  template: `<p>{{ amount | number: '3.2-5' }}</p>`
})
export class DecimalComponent {
  @Input() amount: number;
}
