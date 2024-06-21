import { Component, Renderer2 } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-open-web-url',
  templateUrl: 'open-web-url.html',
})
export class OpenWebUrlPage {
  Title: any;
  loadingData: boolean=true;
  constructor(public navCtrl: NavController, public navParams: NavParams, private renderer: Renderer2) {
  }

  ionViewWillEnter() { 
    var TitleData = this.navParams.get("Title");    
    var htmldata= this.navParams.get("htmldata") ; 
    this.Title = TitleData;
    this.loadingData=false;
    const iframe = this.renderer.createElement('iframe');
    iframe.srcdoc =  htmldata;;
    iframe.width = '100%';
    iframe.height = '500px';

    const iframeContainer = this.renderer.selectRootElement('#iframeContainer');
    this.renderer.appendChild(iframeContainer, iframe);
  }

}
