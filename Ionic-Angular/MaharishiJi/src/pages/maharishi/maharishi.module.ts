import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { MaharishiPage } from './maharishi';

@NgModule({
  declarations: [
    MaharishiPage,
  ],
  imports: [
    IonicPageModule.forChild(MaharishiPage),
  ],
})
export class MaharishiPageModule {}
