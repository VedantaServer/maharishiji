import { Component } from '@angular/core';  
import { HomePage } from '../home/home';
import { MaharishiPage } from '../maharishi/maharishi';
import { ServicesPage } from '../services/services';
//import { TeachersPage } from '../teachers/teachers';
import { DashboardPage } from '../dashboard/dashboard';
import { AboutPage } from '../about/about';
import { ServiceDetailPage } from '../service-detail/service-detail';


@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = MaharishiPage;
  tab3Root = ServicesPage;
  tab4Root = AboutPage;
  tab5Root = DashboardPage;
  ServiceDetailPage = ServiceDetailPage;


  constructor() {

  }
}
