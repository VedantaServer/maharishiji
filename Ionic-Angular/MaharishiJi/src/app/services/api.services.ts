import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';

@Injectable()


export class ApiService {

  public baseUrl = 'https://maharishiji.net/';; // replace with your backend API base URL
  private authHeader: HttpHeaders;

  constructor(private http: HttpClient) {

    const base64Credentials = btoa(`${'awdhesh@mssmail.org'}:${'123456'}`);
    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });

  }

  getServerData(endpoint:any): Observable<any> {
    return this.http.get(this.baseUrl+endpoint,{ headers: this.authHeader });
  }

  getImageUrl(imagePath: string): string {
    // Logic to construct the full image URL
    //console.log(`${this.baseUrl}/${imagePath}`);
    return `${this.baseUrl}/${imagePath}`;
  }

}
