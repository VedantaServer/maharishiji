import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { TeachersPage } from './teachers';

@NgModule({
  declarations: [
    TeachersPage,
  ],
  imports: [
    IonicPageModule.forChild(TeachersPage),
  ],
})
export class TeachersPageModule {}
