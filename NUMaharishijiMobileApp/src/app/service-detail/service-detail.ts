import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { ActivatedRoute } from '@angular/router';

import { ApiService } from '../../services/api.services';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-service-detail',
  standalone: true,
  imports: [IonicModule, CommonModule,FormsModule],
  templateUrl: './service-detail.html',
  styleUrls: ['./service-detail.scss']
})
export class ServiceDetailPage implements OnInit {

   title: string = '';   // ✅ ADD THIS
  headerLogo =
    'https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png';

  HeaderName: string = '';
  urlToImage: string = '';
  viewCount: string = '';
  shareCount: string = '';
  description: string = '';

  constructor(
    private route: ActivatedRoute,
    private apiService: ApiService
  ) {}

  // ✅ Ionic 7 lifecycle
  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      const objectdata = params['objectdata'];
      this.HeaderName = params['HeaderName'];

      if (objectdata) {
        this.urlToImage = objectdata.urlToImage;
        this.viewCount = objectdata.viewCount;
        this.shareCount = objectdata.shareCount;
        this.description = objectdata.description;
      }
    });
  }

  getImageUrl(imagePath: string): string {
    return this.apiService.getImageUrl('image/' + imagePath);
  }
}
