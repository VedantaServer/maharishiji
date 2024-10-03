import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage';
import { OpenWebUrlPage } from '../open-web-url/open-web-url';
import { ApiService } from '../../app/services/api.services';
import { HttpHeaders } from '@angular/common/http';
@IonicPage()
@Component({
  selector: 'page-dashboard',
  templateUrl: 'dashboard.html',
})


export class DashboardPage {
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  
  fullName: any;
  email : any;
  contactNumber : any;
  cityName : any;
  stateName : any;
  subscriptionStartDate : any;
  subscriptionEndDate : any;
  image:any;
  showstaffdetail:boolean=false;
  lblMessage: string = '';
  showLoginForm:boolean=false;
  
  private authHeader: HttpHeaders;
  account: { password: string, username: string } = {
    password: '',
    username: ''
  };
  constructor(public navCtrl: NavController, public navParams: NavParams, private storage: Storage, private apiService: ApiService) {
  }
  
  

  passwordType: string = 'password';
  passwordIcon: string = 'eye-off';

  hideShowPassword() {
    this.passwordType = this.passwordType === 'text' ? 'password' : 'text';
    this.passwordIcon = this.passwordIcon === 'eye-off' ? 'eye' : 'eye-off';
  }

  ionViewDidLoad() {
    this.loaddata();
    this.storage.get('userDetail').then((userDetailValue) => {
      if (userDetailValue != null) {
        this.showstaffdetail = true;
        this.fullName = userDetailValue.data.fullName;
        this.email = userDetailValue.data.email;
        this.contactNumber = userDetailValue.data.contactNumber;
        this.cityName = userDetailValue.data.cityName;
        this.stateName = userDetailValue.data.stateName;
        this.image = userDetailValue.data.image== null? "https://ionicframework.com/docs/img/demos/avatar.svg" :userDetailValue.data.image;
        console.log(userDetailValue.data.subscriptionPayment[0].subscriptionStartDate);
        console.log(userDetailValue.data.subscriptionPayment[0].subscriptionEndDate);
        this.subscriptionStartDate =userDetailValue.data.subscriptionPayment[0].subscriptionStartDate[2]+"-"+userDetailValue.data.subscriptionPayment[0].subscriptionStartDate[1] +"-"+userDetailValue.data.subscriptionPayment[0].subscriptionStartDate[0];
        this.subscriptionEndDate =userDetailValue.data.subscriptionPayment[0].subscriptionEndDate[2]+"-"+userDetailValue.data.subscriptionPayment[0].subscriptionEndDate[1] +"-"+userDetailValue.data.subscriptionPayment[0].subscriptionEndDate[0];
        this.showstaffdetail = true;
        this.showLoginForm = false;
      }
      else{
        this.showstaffdetail = false;
        this.showLoginForm = true;

      }
      
    });
  }

  loaddata()
  {
    this.storage.get('userDetail').then((userDetailValue) => {
      if (userDetailValue != null) {
        this.showstaffdetail = true;
        this.fullName = userDetailValue.data.fullName;
        this.email = userDetailValue.data.email;
        this.contactNumber = userDetailValue.data.contactNumber;
        this.cityName = userDetailValue.data.cityName;
        this.stateName = userDetailValue.data.stateName;
        this.image = userDetailValue.data.image== null? "https://ionicframework.com/docs/img/demos/avatar.svg" :userDetailValue.data.image;
        console.log(userDetailValue.data.subscriptionPayment[0].subscriptionStartDate);
        console.log(userDetailValue.data.subscriptionPayment[0].subscriptionEndDate);
        this.subscriptionStartDate =userDetailValue.data.subscriptionPayment[0].subscriptionStartDate[2]+"-"+userDetailValue.data.subscriptionPayment[0].subscriptionStartDate[1] +"-"+userDetailValue.data.subscriptionPayment[0].subscriptionStartDate[0];
        this.subscriptionEndDate =userDetailValue.data.subscriptionPayment[0].subscriptionEndDate[2]+"-"+userDetailValue.data.subscriptionPayment[0].subscriptionEndDate[1] +"-"+userDetailValue.data.subscriptionPayment[0].subscriptionEndDate[0];
        this.showstaffdetail = true;
        this.showLoginForm = false;
      }
      else{
        this.showstaffdetail = false;
        this.showLoginForm = true;

      }
      
    });
  }

  logout()
  {

    this.storage.clear();
    this.showstaffdetail = false;
    this.ionViewDidLoad();
  }
  
  loaduserprofile()
  {
    this.loadurl('https://maharishiji.net/profile-mobile?user='+this.email);

  }


  loadurl(curl: any) {
    //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
    //sending this data to the broswer widnows.
    this.navCtrl.push(OpenWebUrlPage, { url: curl, Title: "", imagePath: "",webtype:"weburl"});
  }

  doLogin() {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    this.apiService.postServerData('user/json/login', null, this.authHeader).subscribe((response: any) => {
      if (response != null) {
       this.showLoginForm = false;
        this.storage.set("userDetail", response);
        this.storage.set("password", this.account.password);
        console.log(response);
        this.showLoginForm = false;
        this.showstaffdetail = true;
        this.fullName = response.data.fullName;
        this.email = response.data.email;
        this.contactNumber = response.data.contactNumber; 
        this.cityName = response.data.cityName;
        this.stateName = response.data.stateName;
        this.image = response.data.image== null? "https://ionicframework.com/docs/img/demos/avatar.svg" :response[0].image;
        this.subscriptionStartDate =response.data.subscriptionPayment[0].subscriptionStartDate[2]+"-"+response.data.subscriptionPayment[0].subscriptionStartDate[1] +"-"+response.data.subscriptionPayment[0].subscriptionStartDate[0];
        this.subscriptionEndDate =response.data.subscriptionPayment[0].subscriptionEndDate[2]+"-"+response.data.subscriptionPayment[0].subscriptionEndDate[1] +"-"+response.data.subscriptionPayment[0].subscriptionEndDate[0];
        this.showstaffdetail = true;
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

}
