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
  state:any[]=[];
  statetype:any;
  city:any[]=[];
  citytype:any;
  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService) { }

  ngOnInit() {
    this.loadState();
  } 

  loadState(){
    this.apiService.getServerData('/tm-city/json/state-list').subscribe((response: any) => {
      this.state = response.data;
    });
  }

  loadCity(){
    this.tmTeachers = [];
    this.apiService.getServerData('tm-city/json/bystate/'+this.statetype).subscribe((response: any) => {
      this.city = response.data;
    });
  }

  loadTMTeachers() {
    //https://maharishiji.net/tm-info/json/bycity/86/TM Teacher
    this.apiService.getServerData('tm-info/json/bycity/'+this.citytype+'/TM Teacher').subscribe((response: any) => {
      this.tmTeachers = response.data;

    });
  }
}
