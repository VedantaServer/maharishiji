import { Component, OnInit } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services';

@IonicPage()
@Component({
  selector: 'page-teachers',
  templateUrl: 'teachers.html',
})
export class TeachersPage implements OnInit {

  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  tmTeachers: any[] = [];

  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService) { }

  ngOnInit() {
    this.loadTMTeachers();
  } 
  loadTMTeachers() {
    //https://maharishiji.net/tm-info/json/bycity/86/TM Teacher
    this.apiService.getServerData('/tm-info/json').subscribe((response: any) => {
      this.tmTeachers = response.data;

    });
  }
}
