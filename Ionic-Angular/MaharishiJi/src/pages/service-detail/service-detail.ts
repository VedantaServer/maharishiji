import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'


/**
 * Generated class for the ServiceDetailPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-service-detail',
  templateUrl: 'service-detail.html',
})
export class ServiceDetailPage {

  urlToImage: string = '';
  viewCount: string = '';
  shareCount: string = '';
  description: string = '';
  HeaderName :string='';
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
 
  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService) {
  }

  ionViewDidLoad() {
    var objectdata = this.navParams.get("objectdata");
this.HeaderName =  this.navParams.get("HeaderName");
    this.urlToImage =objectdata.urlToImage;
    this.viewCount =objectdata.viewCount;
    this.shareCount =objectdata.shareCount;
    this.description =objectdata.description;
  }

  getImageUrl(imagePath: string): string {
    return this.apiService.getImageUrl('image/' + imagePath);
  }
}
