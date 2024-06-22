import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';


@Injectable()


export class ApiService {

  public baseUrl = 'https://maharishiji.net/';; // replace with your backend API base URL
  private authHeader: HttpHeaders;
  private base64Credentials = btoa(`${'awdhesh@mssmail.org'}:${'123456'}`);

  constructor(private http: HttpClient) {
    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${this.base64Credentials}`
    });

  }

  postServerData(endpoint: any, body: any, auHeader: HttpHeaders): Observable<any> {
    return this.http.post(this.baseUrl + endpoint, body, { headers: auHeader });
  }


  getServerData(endpoint: any): Observable<any> {
    return this.http.get(this.baseUrl + endpoint, { headers: this.authHeader });
  }

  getServeData(endpoint: any, auHeader: HttpHeaders): Observable<any> {
    var aa = this.http.get(this.baseUrl + endpoint, { headers: auHeader });
    return aa;
  }

  getImageUrl(imagePath: string): string {
    return `${this.baseUrl}${imagePath}`;
  }

  fetchServerUrl(endpoint: any): Promise<any> {
    const headers = new Headers({ 'Authorization': `Basic ${this.base64Credentials}` }); //need to send the userid and password
    return fetch(endpoint, { headers })
  }

}
