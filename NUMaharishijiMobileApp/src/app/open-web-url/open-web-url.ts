import {
  Component,
  ElementRef,
  Renderer2,
  ViewChild,
  AfterViewInit
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule, Platform } from '@ionic/angular';
import { ActivatedRoute, Router } from '@angular/router';
import { take } from 'rxjs/operators';

import { ApiService } from '../../services/api.services';

@Component({
  selector: 'app-open-web-url',
  standalone: true,
  imports: [IonicModule, CommonModule],
  templateUrl: './open-web-url.html',
  styleUrls: ['./open-web-url.scss']
})
export class OpenWebUrlPage implements AfterViewInit {



  isAudio = false;
  title: any;
  imagePath: any;
  webtype: any;

  loadingData = true;
  showAudio = false;
  showVideo = false;
  showContinue = false;
  showweburl = false;

  screenWidth!: number;
  screenHeight!: number;

  private url!: string;
  private htmldata: any;
  @ViewChild('webIframe', { static: false })
  webIframe!: ElementRef<HTMLIFrameElement>;

  @ViewChild('iframeContainer', { static: false })
  iframeContainer!: ElementRef<HTMLDivElement>;

  @ViewChild('myAudioElement', { static: false })
  audioElement!: ElementRef<HTMLAudioElement>;



  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private renderer: Renderer2,
    private platform: Platform,
    private apiService: ApiService,
    private hostElement: ElementRef
  ) {
    this.platform.ready().then(() => {
      this.screenWidth = this.platform.width();
      this.screenHeight = this.platform.height();
    });
  }

  ngAfterViewInit() {
    this.route.queryParams
      .pipe(take(1)) // 🔥 VERY IMPORTANT
      .subscribe(params => {
        this.title = params['title'];
        this.imagePath = params['imagePath'];
        this.webtype = params['webtype'];
        this.url = params['url'];
        this.htmldata = params['htmldata'];

        this.handleContent();
      });
  }

  // 🔥 Core logic moved here
  handleContent() {

    if (!this.webtype) {
      alert('sdfsd')
      console.warn('webtype missing, ignoring second trigger');
      return;
    }


    if (this.webtype === 'weburl') {
      this.showweburl = true;
      this.showContinue = true;

      setTimeout(() => {
        if (!this.webIframe || !this.webIframe.nativeElement) {
          return; // 🛑 prevent null crash
        }

        this.webIframe.nativeElement.src = this.url;
        this.loadingData = false;
      }, 0);

      return;
    }




    this.showweburl = false;
    this.showContinue = false;

    // HTML video
    if (this.htmldata) {


      this.showVideo = true;

      setTimeout(() => {
        if (!this.iframeContainer?.nativeElement) return;

        const iframe = this.renderer.createElement('iframe');
        iframe.srcdoc = this.htmldata;
        iframe.width = this.screenWidth;
        iframe.height = this.screenHeight;
        iframe.frameBorder = '0';

        const container = this.iframeContainer.nativeElement;

        while (container.firstChild) {
          this.renderer.removeChild(container, container.firstChild);
        }

        this.renderer.appendChild(container, iframe);
        this.loadingData = false;
      });

      // this.showVideo = true;

      // const iframe = this.renderer.createElement('iframe');
      // iframe.srcdoc = this.htmldata;
      // iframe.width = this.screenWidth;
      // iframe.height = this.screenHeight;
      // iframe.frameBorder = '0';

      // const container =
      //   this.renderer.selectRootElement('#iframeContainer');

      // while (container.firstChild) {
      //   this.renderer.removeChild(container, container.firstChild);
      // }

      // this.renderer.appendChild(container, iframe);
      // this.loadingData = false;
    }
    // 🎧 Audio
    else {
      this.showAudio = true;

      this.apiService.fetchServerUrl(this.url)
        .then(response => response.blob())
        .then(blob => {
          const audio = this.audioElement.nativeElement;
          audio.src = URL.createObjectURL(blob);
          this.loadingData = false;
          audio.play().catch(() => { });
        });
    }
  }

  // ⬅ Back to dashboard
  goToDashboard() {
    this.router.navigate(['/tabs/tab1']);
  }
}
