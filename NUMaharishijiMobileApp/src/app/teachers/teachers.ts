import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { FormsModule } from '@angular/forms';

import { ApiService } from '../../services/api.services';

@Component({
  selector: 'app-teachers',
  standalone: true,
  imports: [IonicModule, CommonModule, FormsModule],
  templateUrl: './teachers.page.html',
  styleUrls: ['./teachers.page.scss']
})
export class TeachersPage implements OnInit {

  headerLogo =
    'https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png';

  tmTeachers: any[] = [];

  state: any[] = [];
  statetype: any = 'All';

  city: any[] = [];
  citytype: any = 'All';

  cityName: any = 'All';

  constructor(private apiService: ApiService) {}

  ngOnInit() {
    this.loadState();
    this.loadTMTeachers();
  }

  loadState() {
    this.apiService
      .getServerData('/tm-city/json/state-list')
      .subscribe((response: any) => {
        this.state = response.data;
      });
  }

  loadCity() {
    this.tmTeachers = [];

    this.apiService
      .getServerData('tm-city/json/bystate/' + this.statetype)
      .subscribe((response: any) => {
        this.city = response.data;
      });
  }

  loadTMTeachers() {
    let sqlQueryData = '';

    if (this.citytype !== 'All') {
      this.cityName = this.citytype.name;
      sqlQueryData = `/bycity/${this.citytype.id}/TM Teacher`;
    }

    this.apiService
      .getServerData('tm-info/json' + sqlQueryData)
      .subscribe((response: any) => {
        this.tmTeachers = response.data;
      });
  }
}
