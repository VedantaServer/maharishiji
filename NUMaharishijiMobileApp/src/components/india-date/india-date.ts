import { Component, Input } from '@angular/core';

/**
 * Generated class for the IndiaDateComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */
@Component({
  selector: 'india-date',
  templateUrl: 'india-date.html'
})
export class IndiaDateComponent {

  text!: string;  
  @Input() dateString: any;
  constructor() {
   
  }

  ngOnInit() { 
 
    var d = this.dateString;
    
    if(d==null) return;
   // console.log(d);

    var date = new Date(Number(d.match(/-?\d+/)[0]));
    var day = ("0" + date.getDate()).slice(-2);//date.getDate();
    //day = day = (day < 10) ? ("0" + day) : day;
    var month = ("0" + (date.getMonth() + 1)).slice(-2);//date.getMonth() + 1;
    //month = (month < 10) ? ("0" + month) : month;
    var dateStr = (day) + "-" + (month) + "-" + date.getFullYear();
    // var houre = date.getHours() + ":" + date.getMinutes() + ":"  + date.getSeconds();
    // console.log("New ="+ dateStr + " " + houre);   
    this.text = dateStr;

  }
}
