import { Component, CUSTOM_ELEMENTS_SCHEMA, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { HttpHeaders } from '@angular/common/http';

import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { Storage } from '@ionic/storage-angular';
import { ApiService } from '../../services/api.services';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.page.html',
  styleUrls: ['./dashboard.page.scss'],
  standalone : false
})
export class DashboardPage implements OnInit {

  headerLogo =
    'https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png';

  fullName: any;
  email: any;
  contactNumber: any;
  cityName: any;
  stateName: any;
  subscriptionStartDate: any;
  subscriptionEndDate: any;
  image: any;

  showstaffdetail = false;
  showLoginForm = false;
  lblMessage = '';

  passwordType = 'password';
  passwordIcon = 'eye-off';

  private authHeader!: HttpHeaders;

  account = {
    username: '',
    password: ''
  };

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private storage: Storage,
    private apiService: ApiService
  ) {}

  /* 🔥 REQUIRED IN IONIC 7 */
  async ngOnInit() {
    await this.storage.create(); // 🔥 FIXES "Database not created"
    this.loadData();
  }

  /* ---------------- PASSWORD TOGGLE ---------------- */
  hideShowPassword() {
    this.passwordType = this.passwordType === 'text' ? 'password' : 'text';
    this.passwordIcon = this.passwordIcon === 'eye-off' ? 'eye' : 'eye-off';
  }

  /* ---------------- LOAD STORED USER ---------------- */
  async loadData() {
    const userDetailValue = await this.storage.get('userDetail');

    if (!userDetailValue) {
      this.showLoginForm = true;
      this.showstaffdetail = false;
      return;
    }

    const data = userDetailValue.data;

    this.email = data.email;
    this.fullName = data.fullName;
    this.contactNumber = data.contactNumber;
    this.cityName = data.cityName;
    this.stateName = data.stateName;

    this.image = data.image
      ? data.image
      : 'https://ionicframework.com/docs/img/demos/avatar.svg';

    const start = data.subscriptionPayment[0].subscriptionStartDate;
    const end = data.subscriptionPayment[0].subscriptionEndDate;

    this.subscriptionStartDate = `${start[2]}-${start[1]}-${start[0]}`;
    this.subscriptionEndDate = `${end[2]}-${end[1]}-${end[0]}`;

    const subEndDate = new Date(end[0], end[1] - 1, end[2]);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (subEndDate <= today) {
      this.loaduserprofile();
    }

    this.showstaffdetail = true;
    this.showLoginForm = false;
  }

  /* ---------------- LOGIN ---------------- */
  doLogin() {
    const base64Credentials = btoa(
      `${this.account.username}:${this.account.password}`
    );

    this.authHeader = new HttpHeaders({
      Authorization: `Basic ${base64Credentials}`
    });

    this.apiService
      .postServerData('user/json/login', null, this.authHeader)
      .subscribe({
        next: async (response: any) => {
          if (!response) {
            this.lblMessage = 'Invalid Username or Password';
            return;
          }

          await this.storage.set('userDetail', response);
          await this.storage.set('password', this.account.password);

          this.loadData();
        },
        error: () => {
          this.lblMessage = 'Invalid Username or Password';
        }
      });
  }

  /* ---------------- LOGOUT ---------------- */
  async logout() {
    await this.storage.clear();
    this.showstaffdetail = false;
    this.showLoginForm = true;
  }

  /* ---------------- DELETE ACCOUNT ---------------- */
  accountdelete() {
    const body = {
      fullName: this.fullName,
      email: this.email,
      contactNumber: this.contactNumber
    };

    this.apiService
      .postServerData('user/json/delete', body)
      .subscribe(() => this.logout());
  }

  /* ---------------- PROFILE ---------------- */
  loaduserprofile() {
    this.loadurl(
      `https://maharishiji.net/profile-mobile?user=${this.email}`
    );
  }

  /* ---------------- OPEN WEB URL ---------------- */
  loadurl(curl: string) {
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
