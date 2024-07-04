import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage';
import { OpenWebUrlPage } from '../open-web-url/open-web-url';

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
  constructor(public navCtrl: NavController, public navParams: NavParams, private storage: Storage) {
  }

  ionViewDidLoad() {
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
      }
      else{
        this.showstaffdetail = false;

      }
      
    });
  }


  logout()
  {

    this.storage.clear();
    this.showstaffdetail = false;
    this.ionViewDidLoad();
  }
  
  loadurl(curl: any) {
    //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
    //sending this data to the broswer widnows.
    this.navCtrl.push(OpenWebUrlPage, { url: curl, Title: "", imagePath: "",webtype:"weburl"});
  }

}
