import { Component } from '@angular/core';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss'],
  standalone: false,
})
export class Tab2Page {

  headerLogo =
    'https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png';

  headerTitle = 'Maharishi Ji';

  constructor() {}
}

