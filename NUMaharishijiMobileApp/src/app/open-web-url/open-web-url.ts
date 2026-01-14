import {
  Component,
  ElementRef,
  Renderer2,
  ViewChild,
  AfterViewInit,
  OnDestroy
} from '@angular/core';
import { Http } from '@capacitor-community/http';
import { CommonModule } from '@angular/common';
import { IonicModule, Platform } from '@ionic/angular';
import { ActivatedRoute, Router } from '@angular/router';
import { take } from 'rxjs/operators';
import { Browser } from '@capacitor/browser';
import { ApiService } from '../../services/api.services';
import { DomSanitizer, SafeHtml, SafeResourceUrl } from '@angular/platform-browser';
import { Filesystem, Directory } from '@capacitor/filesystem';

@Component({
  selector: 'app-open-web-url',
  standalone: true,
  imports: [IonicModule, CommonModule],
  templateUrl: './open-web-url.html',
  styleUrls: ['./open-web-url.scss']
})
export class OpenWebUrlPage implements AfterViewInit, OnDestroy {



  isAudio = false;
  title: any;
  imagePath: any;
  webtype: any;
  safeUrl!: SafeResourceUrl;
  loadingData = true;
  showAudio = false;
  showVideo = false;
  showContinue = false;
  showweburl = false;
  safeHtml!: SafeHtml;
  screenWidth!: number;
  screenHeight!: number;
  audioUrl = '';
  audioInitialized = false;
  private base64Credentials = btoa(`${'awdhesh@mssmail.org'}:${'123456'}`);


  private url!: string;
  private htmldata: any;
  @ViewChild('webIframe', { static: false })
  webIframe!: ElementRef<HTMLIFrameElement>;

  @ViewChild('videoIframe', { static: false })
  videoIframe!: ElementRef<HTMLIFrameElement>;


  details: any;


  @ViewChild('myAudioElement') audioElement!: ElementRef<HTMLAudioElement>;



  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private renderer: Renderer2,
    private platform: Platform,
    private apiService: ApiService,
    private hostElement: ElementRef,
    private sanitizer: DomSanitizer
  ) {
    this.platform.ready().then(() => {
      this.screenWidth = this.platform.width();
      this.screenHeight = this.platform.height();
    });
  }
  // ngOnDestroy(): void {
  //   throw new Error('Method not implemented.');
  // }

  private destroyAllMedia() {

    // 🧹 Destroy web URL iframe
    if (this.webIframe?.nativeElement) {
      this.webIframe.nativeElement.src = 'about:blank';
      this.webIframe.nativeElement.remove();
    }



    // 🧹 Stop and release audio
    if (this.audioElement?.nativeElement) {
      this.audioElement.nativeElement.pause();
      this.audioElement.nativeElement.src = '';
      this.audioElement.nativeElement.load();
    }

    // Reset flags
    this.showweburl = false;
    this.showVideo = false;
    this.showAudio = false;
    this.loadingData = false;
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
        this.details = params['details'];

        //  alert(this.url + 'inside open web')
        this.handleContent();
      });
  }

  ionViewWillLeave() {
    this.destroyAllMedia();
  }

  ngOnDestroy() {
    this.destroyAllMedia();
  }


  // 🔥 Core logic moved here
  async handleContent() {

    // if (!this.webtype) {
    //   alert('no')
    //   console.warn('webtype missing, ignoring second trigger');
    //   return;
    // }

    if (this.webtype === 'weburl') {
      // alert('gaddsfg')
      //alert(this.url)
      this.showweburl = true;
      this.showContinue = true;

      setTimeout(() => {
        if (!this.webIframe || !this.webIframe.nativeElement) {
          alert('crashing')
          return;
        }
        //  alert(this.url)
        this.webIframe.nativeElement.src = decodeURIComponent(this.url);
        this.loadingData = false;
      }, 0);
    }

    else if (this.webtype === 'weburlwithDetail') {
      //   alert('weburlwithDetail')
      // alert(`${this.url}?user=${this.details}`)


      const finalUrl =
        `${this.url}?user=${encodeURIComponent(this.details)}`;

      console.log('FINAL URL:', finalUrl);

      this.safeUrl = this.sanitizer.bypassSecurityTrustResourceUrl(finalUrl);

      this.loadingData = false;
    }
    // HTML video
    else if (this.htmldata) {
      this.safeHtml = this.sanitizer.bypassSecurityTrustHtml(this.htmldata);
      this.showVideo = true;
    }

    // 🎧 Audio
    else {

      this.showAudio = true;
      this.apiService.fetchServerUrl(this.url).then(response => {
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

  async openaudioinweb() {
    // alert(this.url)
    await Browser.open({
      url: this.url
    });
  }

  // ⬅ Back to dashboard
  goToDashboard() {
    this.router.navigate(['/tabs/tab1']);
  }


  arrayBufferToBase64(buffer: ArrayBuffer): string {
    let binary = '';
    const bytes = new Uint8Array(buffer);
    const len = bytes.byteLength;

    for (let i = 0; i < len; i++) {
      binary += String.fromCharCode(bytes[i]);
    }

    return window.btoa(binary);
  }


  blobToBase64(blob: Blob): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onerror = reject;
      reader.onload = () => {
        const base64 = (reader.result as string).split(',')[1];
        resolve(base64);
      };
      reader.readAsDataURL(blob);
    });
  }

}
