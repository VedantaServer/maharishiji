import { Component, OnInit, ViewChild } from '@angular/core';
import { NavController } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'
import { Slides } from 'ionic-angular'; // Import from 'ionic-angular' for older versions


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage implements OnInit {

  @ViewChild(Slides) slides: Slides;
  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  headerTitle = "Maharishi Ji"
  updates: any[] = [];  // Create a property to store the data

  images = [];

  constructor(public navCtrl: NavController, private apiService: ApiService) { }

  ngOnInit() {
    this.loadUpdates();
    this.loadGallery();
  }
  loadGallery() {
    this.apiService.getServerData('photo-gallery/json/min').subscribe((response: any) => {
      this.images = response.data;
      //console.log(this.images);
    });
  }
  ngAfterViewInit() {
    //this.slides.autoplay = 2000; // Example: set autoplay interval
    this.slides.loop = true; // Example: enable looping
    // Adjust other slide properties as needed
  }

  loadUpdates() {
    this.apiService.getServerData('/home-gallery/json/all/true').subscribe((response: any) => {
      this.updates = response.data;
    });
  }

  getImageUrl(imagePath: string): string {

    return this.apiService.getImageUrl('image/' + imagePath);
  }



}



