import { Component } from '@angular/core';
import { Header, IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'
import {HttpHeaders } from '@angular/common/http';
import { Storage } from '@ionic/storage';
@IonicPage()
@Component({
  selector: 'page-services',
  templateUrl: 'services.html',
})

export class ServicesPage {
  showLoginForm: boolean = false;
  showIcon :boolean = true;
  shownews:boolean = false;
  private authHeader: HttpHeaders;
  lblMessage: string = '';
  requesttype : string='';
  public data = [];
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService,  private storage: Storage) {
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


  callservice(ctype)
  {
    
    this.requesttype = ctype;
    this.showIcon = false;
    this.storage.get('password').then((passValue) => {
      if(passValue != null)
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
  doLogin()
  {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);
    
    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    console.log(this.account);
    this.apiService.postServerData('user/json/login',null,this.authHeader).subscribe((response: any) => {
    if (response != null) {
      this.lblMessage = "login Successfully";
      this.storage.set("userDetail", response);
      this.storage.set("password", this.account.password);
      if(this.requesttype=="news")
        {
            this.news();
        }
        else  if(this.requesttype=="audio")
          {
            this.audio();
          }
          else  if(this.requesttype=="video")
            {
              this.video();
            }
            else  if(this.requesttype=="article")
              {
                this.article();
              }
              else  if(this.requesttype=="jyotish")
                {
                  this.jyotish();
                }


     }
     else{
      this.lblMessage = "Invalid Username and password..";
    }
    },
    error => {
      // Handle login error here
      this.lblMessage = "Invalid Username and password..";
    });
  }
  news()
  {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);
    
    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    console.log(this.authHeader);
    console.log("aa");
    this.apiService.getServeData('news-and-events/json/min/20/0/20',this.authHeader).subscribe((response: any) => {
     if (response != null) {
      this.shownews = true;
      this.lblMessage = "login Successfully";
      console.log(response.data);
      for(let newdata of response.data) {
         
          this.data.push({
            description: newdata.description,
            urlToImage:newdata.image,
            title:newdata.name,
            updationDate :newdata.updationDate,
            shareCount :newdata.shareCount,
            viewCount :newdata.viewCount,
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
  audio()
  {

  }
  video(){

  }
  article(){}
  jyotish(){}
}
