import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { IonicModule, LoadingController, NavController, ToastController } from '@ionic/angular';
import { Storage } from '@ionic/storage-angular';


@Injectable()
export class Api {
  PromotionsURL: any = "http://dashboard.vedantaerpserver.com/api/VedantaAnalytics/";
  schoolID: string = '0'

  secureCode: string = '1'; 
 
 serverUrl: string = 'https://maharishiji.net/';
 loginLogoURL : string='https://vedantaerpserver.com/Resources/SchoolImages/School/638525085664308059.png'
 forgetPassword: string='https://vedantaerpserver.com/Pages/Popup/popup.aspx?action=../../UserControls/ForgetPassword.ascx'
 tenantID = '15';
 root:string = 'https://vedantaerpserver.com/';
 public resourcePath = this.root +'/Resources/SchoolImages'; 
 public OTPUrl = 'https://vedantaerpserver.com/pages/notifications.aspx?';
 public SchoolName = 'BharatPresidium'; 
  //android-versionCode="100000" id="com.mobile.BharatPresidium" version="1.0.0"
  

public feeReceiptPDFPath = this.resourcePath + '/FeePayments/';

  constructor(
    public http: HttpClient,
    private storage: Storage,
    public toastCtrl: ToastController
  ) {

  }

  getForgetPasswordLink() {
    return this.forgetPassword;
  }
  getTenantID() {
    return this.tenantID;
  }
  setTenantID(loginTenantID: string) {
    this.tenantID = loginTenantID;
  }
  getSchoolID() {
    return this.schoolID;
  }
  setSchoolID(loginschoolID: string) {
    // console.log('set schoolID',loginschoolID);
    this.schoolID = loginschoolID;
  }
  get(endpoint: string, params?: any, reqOpts?: any) {

    if (!reqOpts) {
      reqOpts = {
        params: new HttpParams()
      };
    }
    // Support easy query params for GET requests
    if (params) {
      reqOpts.params = new HttpParams();
      for (let k in params) {
        reqOpts.params = reqOpts.params.set(k, params[k]);
      }
    }
     //console.log(this.serverUrl + '/' + endpoint, reqOpts);
    return this.http.get(this.serverUrl + '/' + endpoint, reqOpts);

  }

  getSchoolLogo() {
    return this.loginLogoURL;
  }


  getMediaUploadURL() {
    return this.serverUrl + "/PostFiles";
  }

  getDirectPlainUrl(urlComplete: string) {
    //console.log(this.serverUrl+"/"+urlExtension);
    return this.http.get(urlComplete, { reportProgress: true, responseType: "blob" });
  }
  getOTPPlainUrl(urlComplete: string) {
    //console.log(urlComplete);
    return this.http.get(urlComplete, { responseType: 'text' });
  }

  getVendataPromotionData(webMethod: any) {
    console.log(this.PromotionsURL + webMethod);
    return this.http.get(this.PromotionsURL + webMethod);
  }
  postVendataPromotionActivity(webMethod: any, body: any) {
    console.log(webMethod, body);
    const headers = new HttpHeaders();
    headers.append("Content-Type", "application/json");
    //headers.append('Accept', 'application/json');
    //'Content-Type: application/json'

    return this.http.post(this.PromotionsURL + webMethod, body);
  }


  getExternalURL(urlLink: any, qparams: any) {
    var reqOpts = {
      params: new HttpParams()
    };
    if (qparams) {
      reqOpts.params = new HttpParams();

      for (let k in qparams) {
        reqOpts.params = reqOpts.params.set(k, qparams[k]);
      }
    }
    //console.log(urlLink, reqOpts);
    return this.http.get(urlLink, reqOpts);

  }
  getPlainUrl(urlExtension: string) {
    //console.log(this.serverUrl+"/"+urlExtension); 
    return this.http.get(this.serverUrl + "/" + urlExtension);
  }

  post(endpoint: string, body: any, reqOpts?: any) {
    return this.http.post(this.serverUrl + '/' + endpoint, body, reqOpts);
  }

  put(endpoint: string, body: any, reqOpts?: any) {
    return this.http.put(this.serverUrl + '/' + endpoint, body, reqOpts);
  }

  delete(endpoint: string, reqOpts?: any) {
    return this.http.delete(this.serverUrl + '/' + endpoint, reqOpts);
  }

  patch(endpoint: string, body: any, reqOpts?: any) {
    return this.http.patch(this.serverUrl + '/' + endpoint, body, reqOpts);
  }
  isValidURL(fileURI: any) {

    this.http.get(fileURI) //Make an attempt to the file.. 
      .subscribe(resp => {
        return true; //file does exists can be shown..
      },
        error => { return false });
  }


  deleteAppNotification(PersonID: any, Type: string) {

    this.storage.get("FCMToken").then((token:any) => {
      console.log(this.serverUrl + '/' + 'DeleteAppNotification?PersonID=' + PersonID + '&Title=' + Type + '&IMEIKey=' + token + '&secureCode=1')
      this.http.get(this.serverUrl + '/' + 'DeleteAppNotification?PersonID=' + PersonID + '&Title=' + Type + '&IMEIKey=' + token + '&secureCode=1')
        .subscribe((resp: any) => {
          //console.log(resp);
        });
    });

  }

async presentToast(msgText: any) {
  const toast = await this.toastCtrl.create({
    message: msgText,
    duration: 3000,
    position: 'bottom'
  });
  await toast.present();
}


  getIndiaDate(JSONDate: any) {
    var d = JSONDate;
    var date = new Date(Number(d.match(/\d+/)[0]));
    var day = ("0" + date.getDate()).slice(-2);//date.getDate();
    //day = day = (day < 10) ? ("0" + day) : day;
    var month = ("0" + (date.getMonth() + 1)).slice(-2);//date.getMonth() + 1;
    //month = (month < 10) ? ("0" + month) : month;
    var dateStr = (day) + "-" + (month) + "-" + date.getFullYear();
    // var houre = date.getHours() + ":" + date.getMinutes() + ":"  + date.getSeconds();
    // console.log("New ="+ dateStr + " " + houre);   
    return dateStr;
  }

  getIndiaDateTime(JSONDate: any) {
    var d = JSONDate;
   // console.log(d);
    var date = new Date(Number(d.match(/\d+/)[0]));
    var day = ("0" + date.getDate()).slice(-2);//date.getDate();
    //day = day = (day < 10) ? ("0" + day) : day;
    var month = ("0" + (date.getMonth() + 1)).slice(-2);//date.getMonth() + 1;
    //month = (month < 10) ? ("0" + month) : month;
    var dateStr = (day) + "-" + (month) + "-" + date.getFullYear();
     var houre = date.getHours() + ":" + date.getMinutes() + ":"  + date.getSeconds();
    // console.log("New ="+ dateStr + " " + houre);   
    return dateStr + " " + houre;
  }
  

  public _enableDynamicHyperlinks(Description: any, isReplace: boolean): any {

    let returnUrl = '';
    var regex = new RegExp(/(https?:\/\/[^\s]+)/g);

    if (isReplace) {
      returnUrl = Description.replace(regex, "<a href=$1>$1</>")
    }
    else {
      if (Description.match(regex)) {
        let urls = Description.match(regex);
        urls.forEach((element:any) => {
          returnUrl += "<a href=" + element + ">" + element + "</>";
        });
      }
    }
    return returnUrl;


  }


}
