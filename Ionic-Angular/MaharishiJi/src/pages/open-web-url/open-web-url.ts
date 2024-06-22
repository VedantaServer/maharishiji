import { Component, Renderer2 } from '@angular/core';
import { IonicPage, NavController, NavParams, Platform } from 'ionic-angular';


@IonicPage()
@Component({
  selector: 'page-open-web-url',
  templateUrl: 'open-web-url.html',
})
export class OpenWebUrlPage {
  Title: any;
  loadingData: boolean = true;
  screenWidth: number;
  screenHeight: number;
  constructor(public navCtrl: NavController, public navParams: NavParams, private renderer: Renderer2, private platform: Platform) {
    this.platform.ready().then(() => {
      this.screenWidth = platform.width();
      this.screenHeight = platform.height();
    });
  }

  ionViewWillEnter() {
    var TitleData = this.navParams.get("Title");
    var htmldata = this.navParams.get("htmldata");
    var url = this.navParams.get("url");
    this.Title = TitleData;
    this.loadingData = false;
    const iframe = this.renderer.createElement('iframe');
    if(htmldata) //when html data coming.
      iframe.srcdoc = htmldata;
    else
      iframe.src = url;
    iframe.width = this.screenWidth-10;
    iframe.height = this.screenHeight/2;
    console.log(JSON.stringify(iframe));
    const iframeContainer = this.renderer.selectRootElement('#iframeContainer');
    this.renderer.appendChild(iframeContainer, iframe);
  }

}
