import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { OpenWebUrlPage } from './open-web-url';

@NgModule({
  declarations: [
    OpenWebUrlPage,
  ],
  imports: [
    IonicPageModule.forChild(OpenWebUrlPage),
  ],
})
export class OpenWebUrlPageModule {}
