import { Component, ElementRef, Renderer2, ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams, Platform } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'

@IonicPage()
@Component({
  selector: 'page-open-web-url',
  templateUrl: 'open-web-url.html',
})
export class OpenWebUrlPage {
  @ViewChild('myAudioElement') audioElement: ElementRef;

  isAudio: any = false;
  Title: any;
  loadingData: boolean = true;
  screenWidth: number;
  screenHeight: number;
  imagePath: any;
  showAudio: any;
  showVideo: boolean;
  webtype: any;
  showvurl:boolean=false;
  showweburl:boolean=false;
  constructor(public navCtrl: NavController, public navParams: NavParams,
    private renderer: Renderer2, private platform: Platform, private apiService: ApiService, private hostElement: ElementRef) {
    this.platform.ready().then(() => {
      this.screenWidth = platform.width();
      this.screenHeight = platform.height();
    });
  }

  ngAfterViewInit() {
    this.Title = this.navParams.get("Title");
    this.imagePath = this.navParams.get("imagePath");
    this.webtype = this.navParams.get("webtype");
    var url = this.navParams.get("url");
    
    if (this.webtype = "weburl") {
      this.showweburl = true;
      this.showvurl= false;
      var TitleData = this.navParams.get("Title");    ;
      const iframe = this.hostElement.nativeElement.querySelector('iframe');
      iframe.src = url; 
      this.Title = TitleData;
      this.loadingData=false;
    }
    else
    {
      this.showweburl = false;
      this.showvurl= true;
      this.showAudio = this.showVideo = false;
      this.loadingData = true;
      var htmldata = this.navParams.get("htmldata"); //this is coming as html chunk.
      if (htmldata) //when html data coming.
      {
        this.showVideo = true;
        const iframe = this.renderer.createElement('iframe');
        iframe.srcdoc = htmldata;
        iframe.width = this.screenWidth;
        iframe.height = this.screenHeight;
        iframe.frameBorder = '0';
        const iframeContainer = this.renderer.selectRootElement('#iframeContainer');
        while (iframeContainer.firstChild) {
          this.renderer.removeChild(iframeContainer, iframeContainer.firstChild);
        }
        this.renderer.appendChild(iframeContainer, iframe);
        this.loadingData = false;
      }
      else {
        this.showAudio = true;
        this.apiService.fetchServerUrl(url).then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
          }
          return response.blob();
        }).then(blob => {
          const audio = this.audioElement.nativeElement;
          const objectUrl = URL.createObjectURL(blob);
          audio.src = objectUrl;
          this.loadingData = false;
          audio.play().catch(error => {
            console.error('Playback failed:', error);
          });
        });
      }
    }
    
      
    
  }


}


