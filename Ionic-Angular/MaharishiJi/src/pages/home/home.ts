import { Component, OnInit, ViewChild } from '@angular/core';
import { NavController } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'
import { Slides } from 'ionic-angular'; // Import from 'ionic-angular' for older versions
import { OpenWebUrlPage } from '../open-web-url/open-web-url';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html' 
})
export class HomePage implements OnInit {

  @ViewChild(Slides) slides: Slides;
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  headerTitle = "Maharishi Ji";
  updates: any[] = [];  
  images = [];
  loadingData: boolean=false;
  loadingData1: boolean=false;
  showInfo: boolean=false;

  constructor(public navCtrl: NavController, private apiService: ApiService) { }

  ngOnInit() {
    this.loadUpdates();
    this.loadGallery();
  }
  loadGallery() {
    this.loadingData = true
    this.apiService.getServerData('photo-gallery/json/min').subscribe((response: any) => {
      this.images = response.data;
       this.slides.autoplay = 1000; // Example: set autoplay interval
      this.slides.loop = true; // Example: enable looping
      this.loadingData = false;
    });
  }
  ngAfterViewInit() {
    // Adjust other slide properties as needed
  }

  loadUpdates() {
    this.loadingData1 = true;
    this.apiService.getServerData('/home-gallery/json/all/true').subscribe((response: any) => {
      this.updates = response.data;
      this.loadingData1=false;
    });
  }

  getImageUrl(imagePath: string): string {

    return this.apiService.getImageUrl('image/' + imagePath);
  }

  toggleInfo() {
    this.showInfo = !this.showInfo;
  } 

  loadurl(curl: any) {
    //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
    //sending this data to the broswer widnows.
    this.navCtrl.push(OpenWebUrlPage, { url: curl, Title: "", imagePath: "",webtype:"weburl"});
  }
}



