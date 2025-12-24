import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router'; 
import { IonicModule, IonicRouteStrategy } from '@ionic/angular'; 
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component'; 
import { IonicStorageModule } from '@ionic/storage-angular'; 
import { ComponentsModule } from 'src/components/components.module';
import { HttpClientModule } from '@angular/common/http';
 

@NgModule({
  declarations: [AppComponent],
  imports: 
  [
    BrowserModule, 
    ComponentsModule,
    IonicModule.forRoot(), 
    AppRoutingModule, 
    HttpClientModule,
    IonicStorageModule.forRoot()
  ],
  providers: [{ provide: RouteReuseStrategy, useClass: IonicRouteStrategy}],
  bootstrap: [AppComponent],
})
export class AppModule {}
