import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { Body } from '@angular/http/src/body';

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

  
  gethtmlrequestData(endpoint:any,auHeader:HttpHeaders) :any {
    const username = "awdhesh@mssmail.org";
    const password = "123456";
    const myHeaders = new Headers();
    myHeaders.append("Content-Type", "text/html"); // Expect HTML
    myHeaders.append("Authorization", "Basic " + btoa(username + ":" + password)); // Basic authentication
    
    const requestOptions: RequestInit = {
      method: "GET",
      headers: myHeaders,
      redirect: "follow"
    };
    fetch(this.baseUrl+endpoint, requestOptions)
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok ' + response.statusText);
    }
    return response.text(); // Parse response as text (HTML)
  })
  .then(result => console.log(result))
  .catch(error => console.error('Error:', error));
  }

  
  

  getImageUrl(imagePath: string): string {
    // Logic to construct the full image URL
    //console.log(`${this.baseUrl}/${imagePath}`);
    return `${this.baseUrl}${imagePath}`;
  }

}
