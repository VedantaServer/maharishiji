import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';

import { AboutPage } from '../pages/about/about';
import { ContactPage } from '../pages/contact/contact';
import { HomePage } from '../pages/home/home';
import { TabsPage } from '../pages/tabs/tabs';
import { MaharishiPage } from '../pages/maharishi/maharishi';
import { ServicesPage } from '../pages/services/services';
import { TeachersPage } from '../pages/teachers/teachers';
import { DashboardPage } from '../pages/dashboard/dashboard'; 
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen'; 
import { ApiService } from './services/api.services'; 
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    MaharishiPage,
    ServicesPage,
    TeachersPage,
    DashboardPage
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    MaharishiPage,
    ServicesPage,
    TeachersPage,
    DashboardPage

  ],
  providers: [
    StatusBar,
    HttpClientModule,
    ApiService,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}, 
  ]
})
export class AppModule {}
