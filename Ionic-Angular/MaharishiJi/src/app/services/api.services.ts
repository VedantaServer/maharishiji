import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { Body } from '@angular/http/src/body';
import { Media, MediaObject } from '@ionic-native/media/ngx';
import { File } from '@ionic-native/file/ngx';

@Injectable()


export class ApiService {

  public baseUrl = 'https://maharishiji.net/';; // replace with your backend API base URL
  private authHeader: HttpHeaders;
  private base64Credentials = btoa(`${'awdhesh@mssmail.org'}:${'123456'}`);
  private currentTrack: MediaObject;
  private isPlaying: boolean = false;
  private currentIndex: number = -1;
  constructor(private http: HttpClient,private media: Media, private file: File) {

    
    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${this.base64Credentials}`
    });

  }
  
  postServerData(endpoint:any,body :any,auHeader:HttpHeaders): Observable<any> {
    return this.http.post(this.baseUrl+endpoint,body,{headers:auHeader});
  }

  
  getServerData(endpoint:any): Observable<any> {
    return this.http.get(this.baseUrl+endpoint,{ headers:  this.authHeader });
  }

  getServeData(endpoint:any,auHeader:HttpHeaders): Observable<any> {
    var aa = this.http.get(this.baseUrl+endpoint,{ headers: auHeader });
    console.log(aa)
    return aa ;
  }

  getImageUrl(imagePath: string): string {
    // Logic to construct the full image URL
    //console.log(`${this.baseUrl}/${imagePath}`);
    return `${this.baseUrl}${imagePath}`;
  }

  playTrack(index: number) {
    if (this.isPlaying && this.currentIndex === index) {
      this.currentTrack.stop();
      this.isPlaying = false;
      return;
    }

    if (this.currentTrack) {
      this.currentTrack.stop();
    }

    this.currentIndex = index;
    //this.currentTrack = this.media.create(this.tracks[index].path);
    this.currentTrack.play();
    this.isPlaying = true;
  }

  stopTrack() {
    if (this.currentTrack) {
      this.currentTrack.stop();
      this.isPlaying = false;
    }
  }
  

}
