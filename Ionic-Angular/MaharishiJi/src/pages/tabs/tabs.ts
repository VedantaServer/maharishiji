import { Component } from '@angular/core';  
import { HomePage } from '../home/home';
import { MaharishiPage } from '../maharishi/maharishi';
import { ServicesPage } from '../services/services';
import { TeachersPage } from '../teachers/teachers';
import { DashboardPage } from '../dashboard/dashboard';



@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = MaharishiPage;
  tab3Root = ServicesPage;
  tab4Root = TeachersPage;
  tab5Root = DashboardPage;


  constructor() {

  }
}
