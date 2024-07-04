import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { ApiService } from '../../app/services/api.services'
import { HttpHeaders } from '@angular/common/http';
import { Storage } from '@ionic/storage';
import { OpenWebUrlPage } from '../open-web-url/open-web-url';
@IonicPage()
@Component({
  selector: 'page-services',
  templateUrl: 'services.html',
})

export class ServicesPage {
  showLoginForm: boolean = false;
  showIcon: boolean = true;
  shownews: boolean = false;
  showvideo: boolean = false;
  showaudio: boolean = false;
  showback: boolean = false;
  showArticles: boolean = false;
  showJyotish: boolean = false;
  showteacher: boolean = false;
  private authHeader: HttpHeaders;
  lblMessage: string = '';
  requesttype: string = '';
  HeaderName: string = 'Our Services';
  public data = [];
  public videodata = [];
  public audiodata = [];
  public articalsdata = [];
  tmTeachers: any[] = [];
  scrollcount: number = 0;
  ccount: number = 0;
  loadingData: boolean = false;
  showCategory : boolean = false;
  category:any[] = [];
  CategoryID: number=0;
  public categorytype: any;
  selectedItem: any;
  state:any[]=[];
  statetype:any='All';
  city:any[]=[];
  citytype:any='All';
  cityName: any='All';
  tracks: Array<{ title: string, path: string, image: string,audioFile:string }> = [];

  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  constructor(public navCtrl: NavController, public navParams: NavParams, private apiService: ApiService, private storage: Storage) {
  }
  account: { password: string, username: string } = {
    password: '',
    username: ''
  };

  passwordType: string = 'password';
  passwordIcon: string = 'eye-off';

  hideShowPassword() {
    this.passwordType = this.passwordType === 'text' ? 'password' : 'text';
    this.passwordIcon = this.passwordIcon === 'eye-off' ? 'eye' : 'eye-off';
  }
  ionViewDidLoad() {

  }

  Back() {
    this.showCategory = false;
    this.showback = false;
    this.showIcon = true;
    this.shownews = false;
    this.showvideo = false;
    this.showaudio = false;
    this.showArticles = false;
    this.showJyotish = false;
    this.CategoryID=0;
    this.categorytype =[];
    this.videodata = [];
    this.audiodata = [];
    this.articalsdata = [];
    this.audiodata = [];
    this.tmTeachers =[];
    this.data=[];
    this.requesttype = "";
  }
  callservice(ctype) {

    this.requesttype = ctype;
    this.showIcon = false;
    this.storage.get('password').then((passValue) => {
      if (passValue != null)
        this.account.password = passValue;
    });


    this.storage.get('userDetail').then((userDetailValue) => {
      if (userDetailValue != null) {
        this.account.username = userDetailValue.data.email;
        this.doLogin();
      }
      else {
        this.showLoginForm = true;   //if nothing in storage then show the form.
      }
    });

  }
  doLogin() {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    this.apiService.postServerData('user/json/login', null, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        this.showback = true;
        this.showLoginForm = false;
        this.storage.set("userDetail", response);
        this.storage.set("password", this.account.password);
        if (this.requesttype == "news") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.HeaderName = "News & Events";
          this.showJyotish = false;
          this.scrollcount = 0;
         this.bindCategory(3,"News");
         this.showCategory = true;
         this.news();
         this.showteacher = false;
        }
        else if (this.requesttype == "audio") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.showJyotish = false;
          this.HeaderName = "Audio";
          this.scrollcount = 0;
          this.bindCategory(2,"Audio");
          this.showCategory = true;
          this.audio();
          this.showteacher = false;
        }
        else if (this.requesttype == "video") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.HeaderName = "Video";
          this.showJyotish = false;
          this.scrollcount = 0;
          this.bindCategory(1,"Video");
          this.showCategory = true;
          this.showteacher = false;
          this.video();
        }
        else if (this.requesttype == "article") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.HeaderName = "Articles";
          this.showJyotish = false;
          this.scrollcount = 0;
          this.bindCategory(4,"Articles");
          this.showCategory = true;
          this.showteacher = false;
          this.article();
        }
        else if (this.requesttype == "TM") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.HeaderName = "TM Teacher";
          this.showJyotish = false;
          this.scrollcount = 0;
          this.showCategory = false;
          this.loadState();
          this.loadCity();
          this.showteacher = true;
        }
        else if (this.requesttype == "Jyotish") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.HeaderName = "Jyotish Consultation";
          this.showJyotish = false;
          this.scrollcount = 0;
          this.showCategory = false;
          this.loadState();
          this.loadCity();
          this.showteacher = true;
        }

      }
      else {
        this.lblMessage = "Invalid Username and password..";
      }
    },
      error => {
        // Handle login error here
        this.lblMessage = "Invalid Username and password..";
      });
  }

  handleCancel() {
    console.log('ionCancel fired');
  }

  handleDismiss() {
    console.log('ionDismiss fired');
  }

  bindCategory(CategoryID,Type){
    this.category = [];
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });

    this.apiService.getServeData('main-category/json/min/'+CategoryID, this.authHeader).subscribe((response: any) => {
      if (response != null) {
       
        for (let newdata of response.data.subCategory) {
        
          if (this.category.find(item => item.id == newdata.id) == null) {
            this.ccount++;
            this.category.push({
              id: newdata.id,
              title: newdata.name,
              ctype:Type
            });
          }
        }
        this.loadingData = false;

      }     
    }
    );

  }
  loaddata()
  {
    console.log(this.categorytype);
    const selectedId = this.categorytype;
     this.selectedItem= this.category.find(item => item.id === selectedId);
    this.CategoryID=this.selectedItem.id;
    this.requesttype ==this.selectedItem.ctype;

    if (this.requesttype == "news") {
      this.news();
    }
    else if (this.requesttype == "audio") {
      this.audio();
    }
    else if (this.requesttype == "video") {
      this.video();
    }
    else if (this.requesttype == "article") {
      this.article();
    }

  }
  loadMore(infiniteScroll) {
    this.scrollcount += 1;
    if (this.requesttype == "news") {
      this.news(infiniteScroll);
    }
    else if (this.requesttype == "audio") {
      this.audio();
    }
    else if (this.requesttype == "video") {
      this.video();
    }
    else if (this.requesttype == "article") {
      this.article(infiniteScroll);
    }
    else {
      infiniteScroll.complete();
    }

  }
  news(infiniteScroll?) {
    this.data = [];
    this.loadingData = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    var sqlQueryData ='';
    if(this.CategoryID != 0)
       sqlQueryData  = '/'+this.CategoryID+'/' + this.scrollcount + '/20';

    console.log(sqlQueryData);


    this.apiService.getServeData('news-and-events/json/min'+sqlQueryData, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        for (let newdata of response.data) {

          if (this.data.find(item => item.id == newdata.id) == null) {
            this.ccount++;
            this.data.push({
              id: newdata.id,
              description: newdata.description,
              urlToImage: newdata.image,
              title: newdata.name,
              updationDate: newdata.updationDate,
              shareCount: newdata.shareCount,
              viewCount: newdata.viewCount,
              pagenumber: this.scrollcount,
              recordcount: this.ccount
            });
          }
        }
        this.shownews= true;
        this.loadingData = false;

      }
      if (infiniteScroll) {
        infiniteScroll.complete();
      }
    }
    );
  }
  getImageUrl(imagePath: string): string {
    return this.apiService.getImageUrl('image/' + imagePath);
  }
  audio(infiniteScroll?) {
    this.loadingData = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });

    var sqlQueryData ='';
    if(this.CategoryID != 0)
       sqlQueryData  = '/'+this.CategoryID+'/' + this.scrollcount + '/20';

    this.apiService.getServeData('audio/json/min'+sqlQueryData, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        for (let newdata of response.data) {
          if (this.tracks.find(item => item.title == newdata.name) == null) {
            this.ccount++;
            this.tracks.push({
              title: newdata.name,
              path: this.apiService.baseUrl + newdata.audioFile,
              image: this.apiService.getImageUrl('image/' + newdata.image),
              audioFile:this.apiService.baseUrl + 'stream/' + newdata.audioFile

            });
          }
        }
        this.loadingData = false;
        this.showaudio=true;
      }
      if (infiniteScroll) {
        infiniteScroll.complete();
      }
    }
    );
  }


  video() {
   this.loadingData = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    var sqlQueryData ='/min';
    if(this.CategoryID != 0)
       sqlQueryData  = '/category-wise/'+this.CategoryID;


    this.apiService.getServeData('video/json'+sqlQueryData, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        for (let newdata of response.data) {
          this.videodata.push({
            description: newdata.hindiDescription,
            id: newdata.id,
            title: newdata.name,
            updationDate: newdata.updationDate,
            shareCount: newdata.shareCount,
            viewCount: newdata.viewCount,
            urlToImage: newdata.image

          });
        }

      }
      this.loadingData = false;
      this.showvideo=true;
    }
    );
  }

  article(infiniteScroll?) {
    this.loadingData = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });

    var sqlQueryData ='';
    if(this.CategoryID != 0)
       sqlQueryData  = '/'+this.CategoryID+'/' + this.scrollcount + '/20';


    this.apiService.getServeData('article/json/min'+sqlQueryData, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        for (let newdata of response.data) {
          if (this.articalsdata.find(item => item.id == newdata.id) == null) {
            this.ccount++;
            this.articalsdata.push({
              id: newdata.id,
              description: newdata.description,
              urlToImage: newdata.image,
              title: newdata.name,
              updationDate: newdata.updationDate,
              shareCount: newdata.shareCount,
              viewCount: newdata.viewCount,
              pagenumber: this.scrollcount,
              recordcount: this.ccount
            });
          }
        }

      }
      this.loadingData = false;
      this.showArticles=true;
      if (infiniteScroll) {
        infiniteScroll.complete();
      }
    }
    );


  }
  

  loadAudio(audio: any) {
    //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
    //sending this data to the broswer widnows.
    console.log(audio);
    this.navCtrl.push(OpenWebUrlPage, { url: audio.audioFile, Title: audio.title, imagePath: audio.image });
  }


  Loadvideo(id: any, title: any) {

    this.storage.get('password').then((passValue) => {
      if (passValue != null)
        this.account.password = passValue;
    });

    this.storage.get('userDetail').then((userDetailValue) => {
      if (userDetailValue != null) {
        this.account.username = userDetailValue.data.email;
      }
    });


    const username = this.account.username;
    const password = this.account.password;
    const myHeaders = new Headers();
    myHeaders.append("Content-Type", "text/html"); // Expect HTML
    myHeaders.append("Authorization", "Basic " + btoa(username + ":" + password)); // Basic authentication

    const requestOptions: RequestInit = {
      method: "GET",
      headers: myHeaders,
      redirect: "follow"
    };
    fetch(this.apiService.baseUrl + 'video/play/' + id, requestOptions)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok ' + response.statusText);
        }
        response.text().then((htmldata) => {
          this.navCtrl.push(OpenWebUrlPage, { urldata: "", Title: title, htmldata: htmldata });
        });


      })
      .then(result => result)
      .catch(error => console.error('Error:', error));
  }

  
  loadurl(curl: any) {
    //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
    //sending this data to the broswer widnows.
    this.navCtrl.push(OpenWebUrlPage, { url: curl, Title: "", imagePath: "",webtype:"weburl"});
  }

  loadState(){
    this.apiService.getServerData('/tm-city/json/state-list').subscribe((response: any) => {
      this.state = response.data;
    });
  }

  loadCity(){
    this.tmTeachers = [];
    this.apiService.getServerData('tm-city/json/bystate/'+this.statetype).subscribe((response: any) => {
      this.city = response.data;
    });
  }

  loadTMTeachers() {
    var sqlQueryData=""; 
    if(this.citytype !='All'){
      this.cityName = this.citytype.name;
      sqlQueryData='/bycity/'+this.citytype.id+'/'+ (this.requesttype=='TM' ?'TM Teacher': "Jyotish Consultant");
    }
  console.log(sqlQueryData);
    //https://maharishiji.net/tm-info/json/bycity/86/TM Teacher
    this.apiService.getServerData('tm-info/json'+sqlQueryData).subscribe((response: any) => {
      this.tmTeachers = response.data;

    });
  }
}


