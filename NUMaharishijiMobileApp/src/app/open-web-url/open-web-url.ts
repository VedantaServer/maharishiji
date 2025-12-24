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
  @ViewChild('webIframe') webIframe!: ElementRef<HTMLIFrameElement>;
  @ViewChild('myAudioElement') audioElement!: ElementRef<HTMLAudioElement>;

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
    this.route.queryParams.subscribe(params => {
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
    if (this.webtype === 'weburl') {
      this.showweburl = true;
      this.showContinue = true;

      setTimeout(() => {
        if (this.webIframe?.nativeElement) {
          this.webIframe.nativeElement.src = this.url;
          this.loadingData = false;
        }
      });

      return;
    }


    this.showweburl = false;
    this.showContinue = false;

    // HTML video
    if (this.htmldata) {
      this.showVideo = true;

      const iframe = this.renderer.createElement('iframe');
      iframe.srcdoc = this.htmldata;
      iframe.width = this.screenWidth;
      iframe.height = this.screenHeight;
      iframe.frameBorder = '0';

      const container =
        this.renderer.selectRootElement('#iframeContainer');

      while (container.firstChild) {
        this.renderer.removeChild(container, container.firstChild);
      }

      this.renderer.appendChild(container, iframe);
      this.loadingData = false;
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
