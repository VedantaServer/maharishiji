import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { OpenWebUrlPage } from './open-web-url/open-web-url';
import { ServiceDetailPage } from './service-detail/service-detail';

const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./tabs/tabs.module').then(m => m.TabsPageModule)
  },
  {
    path: 'open-web-url',
    component:OpenWebUrlPage
  }, 

   {
    path: 'service-detail',
    component:ServiceDetailPage
  }

];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
