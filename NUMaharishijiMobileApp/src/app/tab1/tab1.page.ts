import { Component, CUSTOM_ELEMENTS_SCHEMA, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { Router } from '@angular/router';


import { ApiService } from '../../services/api.services';

@Component({
   selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss'],
  standalone : false,
})
export class Tab1Page implements OnInit {

  headerLogo =
    'https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png';

  headerTitle = 'Maharishi Ji';

  updates: any[] = [];
  images: any[] = [];

  loadingData = false;
  loadingData1 = false;
  showInfo = false;

  // ✅ Swiper config
  swiperConfig = {
    loop: true,
    autoplay: {
      delay: 1000,
      disableOnInteraction: false
    }
  };

  constructor(
    private apiService: ApiService,
    private router: Router
  ) {}

  ngOnInit() {
    this.loadUpdates();
    this.loadGallery();
  }

  loadGallery() {
    this.loadingData = true;

    this.apiService
      .getServerData('photo-gallery/json/min/all/0/10')
      .subscribe((response: any) => {
        this.images = response.data;
        this.loadingData = false;
      });
  }

  loadUpdates() {
    this.loadingData1 = true;

    this.apiService
      .getServerData('/home-gallery/json/all/true')
      .subscribe((response: any) => {
        this.updates = response.data;
        this.loadingData1 = false;
      });
  }

  getImageUrl(imagePath: string): string {
    return this.apiService.getImageUrl('image/' + imagePath);
  }

  toggleInfo() {
    this.showInfo = !this.showInfo;
  }

  loadurl(curl: any) {
    this.router.navigate(['/open-web-url'], {
      queryParams: {
        url: curl,
        title: '',
        imagePath: '',
        webtype: 'weburl'
      }
    });
  }
}
