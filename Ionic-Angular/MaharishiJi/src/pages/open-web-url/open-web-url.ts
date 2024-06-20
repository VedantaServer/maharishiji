import { Component, ElementRef } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-open-web-url',
  templateUrl: 'open-web-url.html',
})
export class OpenWebUrlPage {
  Title: any;
  loadingData: boolean=true;
  constructor(public navCtrl: NavController, public navParams: NavParams, private hostElement: ElementRef) {
  }

  ionViewWillEnter() {
    console.log(urldata);
    var urldata = this.navParams.get("urldata");
    console.log(urldata);
    var TitleData = this.navParams.get("Title");    ;
    const iframe = this.hostElement.nativeElement.querySelector('iframe');
    iframe.src = urldata; 
    this.Title = TitleData;
    this.loadingData=false;
  }

}
