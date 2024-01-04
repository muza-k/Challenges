import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `<table>
  <tbody>
    <tr>
      <td *ngFor="let item of items; let  i = index" (click)="toggle(i)" style="width: 100px; height: 100px; border: 1px solid black; background-color: green">
          <div *ngIf="item">
            up
          </div>
          <div *ngIf="!item">
            down
          </div>
      </td>
    </tr>
  </tbody>
</table>`
})
export class Cards implements OnInit {
  @Input() count: number = 5;
  items : boolean[] = [];
  
  ngOnInit() {
    for(let i=0; i<this.count; i++){
      this.items.push(false);
    }
  }

  toggle(cardNumber: number){
    for(let i=0; i<this.items.length; i++){
      this.items[i] = false;
    }
    this.items[cardNumber] = true;
  }
}
