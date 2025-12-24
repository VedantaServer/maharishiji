import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-tab3',
  templateUrl: 'tab3.page.html',
  styleUrls: ['tab3.page.scss'],
  standalone: false,
})
export class Tab3Page {

  headerLogo =
    'https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png';

  headerTitle = 'Maharishi Ji';

  constructor(private router: Router) {}

  // ✅ Ionic 7 lifecycle not needed here

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

