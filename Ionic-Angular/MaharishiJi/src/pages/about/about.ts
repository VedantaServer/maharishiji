import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { OpenWebUrlPage } from '../open-web-url/open-web-url';
 

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  headerTitle = "Maharishi Ji"
  
  constructor(public navCtrl: NavController) {
     
    
  }

}
