import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  public baseUrl = 'https://maharishiji.net/';

  private base64Credentials = btoa(
    `${'awdhesh@mssmail.org'}:${'123456'}`
  );

  private authHeader: HttpHeaders;

  constructor(private http: HttpClient) {
    this.authHeader = new HttpHeaders({
      Authorization: `Basic ${this.base64Credentials}`
    });
  }

  // ✅ POST with custom headers
  postServerData(
    endpoint: string,
    body: any,
    auHeader?: HttpHeaders
  ): Observable<any> {
    return this.http.post(
      this.baseUrl + endpoint,
      body,
      { headers: auHeader ?? this.authHeader }
    );
  }

  // ✅ GET with default auth header
  getServerData(endpoint: string): Observable<any> {
    return this.http.get(
      this.baseUrl + endpoint,
      { headers: this.authHeader }
    );
  }

  // ✅ GET with provided auth header
  getServeData(
    endpoint: string,
    auHeader: HttpHeaders
  ): Observable<any> {
    return this.http.get(
      this.baseUrl + endpoint,
      { headers: auHeader }
    );
  }

  // ✅ Image helper
  getImageUrl(imagePath: string): string {
    return `${this.baseUrl}${imagePath}`;
  }

  // ✅ Fetch binary/audio/video (used by audio player)
  fetchServerUrl(url: string): Promise<Response> {
    return fetch(url, {
      headers: {
        Authorization: `Basic ${this.base64Credentials}`
      }
    });
  }
}
