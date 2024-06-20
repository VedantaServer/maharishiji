import { Component } from '@angular/core';
import { Header, IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'
import { HttpHeaders } from '@angular/common/http';
import { Storage } from '@ionic/storage';
import { OpenWebUrlPage } from '../open-web-url/open-web-url';
@IonicPage()
@Component({
  selector: 'page-services',
  templateUrl: 'services.html',
})

export class ServicesPage {
  showLoginForm: boolean = false;
  showIcon: boolean = true;
  shownews: boolean = false;
  showvideo: boolean = false;
  private authHeader: HttpHeaders;
  lblMessage: string = '';
  requesttype: string = '';
  public data = [];
  public videodata = [];
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService, private storage: Storage) {
  }
  account: { password: string, username: string } = {
    password: '',
    username: ''
  };

  passwordType: string = 'password';
  passwordIcon: string = 'eye-off';

  hideShowPassword() {
    this.passwordType = this.passwordType === 'text' ? 'password' : 'text';
    this.passwordIcon = this.passwordIcon === 'eye-off' ? 'eye' : 'eye-off';
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad ServicesPage');
  }


  callservice(ctype) {

    this.requesttype = ctype;
    this.showIcon = false;
    this.storage.get('password').then((passValue) => {
      if (passValue != null)
        this.account.password = passValue;
    });


    this.storage.get('userDetail').then((userDetailValue) => {
      if (userDetailValue != null) {
        this.account.username = userDetailValue.data.email;
        this.doLogin();
      }
      else {
        this.showLoginForm = true;   //if nothing in storage then show the form.
      }
    });

  }
  doLogin() {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    console.log(this.account);
    this.apiService.postServerData('user/json/login', null, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        this.lblMessage = "login Successfully";
        this.storage.set("userDetail", response);
        this.storage.set("password", this.account.password);
        if (this.requesttype == "news") {
          this.news();
        }
        else if (this.requesttype == "audio") {
          this.audio();
        }
        else if (this.requesttype == "video") {
          this.video();
        }
        else if (this.requesttype == "article") {
          this.article();
        }
        else if (this.requesttype == "jyotish") {
          this.jyotish();
        }


      }
      else {
        this.lblMessage = "Invalid Username and password..";
      }
    },
      error => {
        // Handle login error here
        this.lblMessage = "Invalid Username and password..";
      });
  }
  news() {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    console.log(this.authHeader);
    console.log("aa");
    this.apiService.getServeData('news-and-events/json/min/20/0/20', this.authHeader).subscribe((response: any) => {
      if (response != null) {
        this.shownews = true;
        this.lblMessage = "login Successfully";
        console.log(response.data);
        for (let newdata of response.data) {

          this.data.push({
            description: newdata.description,
            urlToImage: newdata.image,
            title: newdata.name,
            updationDate: newdata.updationDate,
            shareCount: newdata.shareCount,
            viewCount: newdata.viewCount,
          });
        }
        console.log(this.data);
      }
    }
    );
  }
  getImageUrl(imagePath: string): string {

    return this.apiService.getImageUrl('image/' + imagePath);
  }
  audio() {

  }
  video() {
    this.shownews = false;
    this.showvideo = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    console.log(this.authHeader);
    console.log("aa");
    this.apiService.getServeData('video/json/min', this.authHeader).subscribe((response: any) => {
      if (response != null) {
        this.shownews = true;
        console.log(response.data);
        for (let newdata of response.data) {

          this.videodata.push({
            description: newdata.hindiDescription,
            id: newdata.id,
            title: newdata.name,
            updationDate: newdata.updationDate,
            shareCount: newdata.shareCount,
            viewCount: newdata.viewCount,
            urlToImage: newdata.image
          });
        }
        console.log(this.data);
      }
    }
    );
  }
  article() { }
  jyotish() { }

  Loadvideo(id, title) {

    this.storage.get('password').then((passValue) => {
      if (passValue != null)
        this.account.password = passValue;
    });

    this.storage.get('userDetail').then((userDetailValue) => {
      if (userDetailValue != null) {
        this.account.username = userDetailValue.data.email;
      }
    });
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });

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
    fetch(this.apiService.baseUrl + 'video/play/' + id, requestOptions)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok ' + response.statusText);
        }
        var htmlresp= response.text().then((htmldata) => {
          console.log(htmldata);
          this.navCtrl.push(OpenWebUrlPage, { urldata: "", Title: title, htmldata: htmldata });
        });
        
        
      })
      .then(result => console.log(result))
      .catch(error => console.error('Error:', error));


  }
}


