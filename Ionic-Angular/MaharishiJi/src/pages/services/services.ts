import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'
@IonicPage()
@Component({
  selector: 'page-services',
  templateUrl: 'services.html',
})

export class ServicesPage {
  showLoginForm: boolean = false;
  showIcon :boolean = true;
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService) {
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
    this.showLoginForm=true;
    this.showIcon = false;
  }
  doLogin()
  {
    console.log(this.account);
    this.apiService.postServerData('user/json/login?Username='+this.account.username+'&password='+this.account.password,null).subscribe((response: any) => {
     console.log(response);
    });
  }
}
