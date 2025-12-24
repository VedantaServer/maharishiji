import { NgModule } from '@angular/core';
import { ValueLookUpComponent } from './value-look-up/value-look-up';
import { IndiaDateComponent } from './india-date/india-date';
//import { VedantaCalenderComponent } from './vedanta-calender/vedanta-calender';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';

 

@NgModule({ 
    imports: [
        CommonModule,
        IonicModule,
       // VedantaCalenderComponent,
        IndiaDateComponent,
        ValueLookUpComponent
    ],
    exports: [ValueLookUpComponent,
        IndiaDateComponent,
       // VedantaCalenderComponent,
    ]
})
export class ComponentsModule { }
