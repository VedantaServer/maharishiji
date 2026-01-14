import { Component, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { ApiService } from '../../services/api.services'
import { HttpHeaders } from '@angular/common/http';
import { Storage } from '@ionic/storage';
import { OpenWebUrlPage } from '../open-web-url/open-web-url';
import { ServiceDetailPage } from '../service-detail/service-detail';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';
import { Platform, NavController } from '@ionic/angular';
import {  ActivatedRoute, Router } from '@angular/router';
import { Browser } from '@capacitor/browser';


@Component({
  selector: 'app-service',
  templateUrl: './service.page.html',
  styleUrls: ['./service.page.scss'],
  standalone: false
})

export class ServicePage {
  showLoginForm: boolean = false;
  showIcon: boolean = true;
  shownews: boolean = false;
  showvideo: boolean = false;
  showlivevideo: boolean = false;
  showaudio: boolean = false;
  showback: boolean = false;
  showArticles: boolean = false;
  showJyotish: boolean = false;
  showteacher: boolean = false;
  private authHeader!: HttpHeaders;
  lblMessage: string = '';
  requesttype: string = '';
  HeaderName: string = 'Our Services';
  public data: any[] = [];
  public videodata: any[] = [];
  public livevideodata: any[] = [];
  public audiodata: any[] = [];
  public articalsdata: any[] = [];
  tmTeachers: any[] = [];
  scrollcount: number = 0;
  ccount: number = 0;
  loadingData: boolean = false;
  showCategory: boolean = false;
  category: any[] = [];
  CategoryID: number = 0;
  public categorytype: any;
  selectedItem: any;
  state: any[] = [];
  statetype: any = 'All';
  city: any[] = [];
  citytype: any = 'All';
  cityName: any = 'All';
  found: any = '';
  tracks: Array<{ title: string, path: string, image: string, audioFile: string, viewcount: string }> = [];

  headerLogo = "https://maharishiji.net/ui-design/templates/news24/images/presets/preset1/logo-footer.png";
  constructor(private router: Router, public navCtrl: NavController, public navParams: ActivatedRoute, private apiService: ApiService,
    private storage: Storage) {
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

    this.showlivevideo = false;
    this.showCategory = false;
    this.showLoginForm = false;
    this.showback = false;
    this.showIcon = true;
    this.shownews = false;
    this.showvideo = false;
    this.showaudio = false;
    this.showArticles = false;
    this.showJyotish = false;
    this.showteacher = false;
    this.CategoryID = 0;
    this.categorytype = [];
    this.videodata = [];
    this.audiodata = [];
    this.articalsdata = [];
    this.audiodata = [];
    this.tmTeachers = [];
    this.livevideodata = [];
    this.data = [];
    this.requesttype = "";
  }
  callservice(ctype: any) {

    this.requesttype = ctype;
    //alert(this.requesttype + '1')
    this.showIcon = false;
    this.storage.get('password').then((passValue) => {
      if (passValue != null)
        this.account.password = passValue;
    });

    this.storage.get('userDetail').then((userDetailValue) => {

      if (!userDetailValue) {
        this.HeaderName = "Login";
        this.showLoginForm = true;
        this.showback = true;
        return;
      }

      this.account.username = userDetailValue.data.email;

      const payment = userDetailValue.data.subscriptionPayment?.[0];
      if (!payment) {
        console.error('Subscription missing');
        return;
      }

      const [year, month, day] = payment.subscriptionEndDate;
      const subEndDate = new Date(year, month - 1, day);

      const currentDate = new Date();
      currentDate.setHours(0, 0, 0, 0);

      if (subEndDate < currentDate) {
        this.loaduserprofile();
        this.storage.clear();
        return;
      }


      // ✅ NOW IT WILL ALWAYS HIT
      this.doLogin();
      this.showback = false;

    });

  }


  loaduserprofile() {
    this.loadurl('https://maharishiji.net/profile-mobile?user=' + this.account.username);

  }

  async ngOnInit() {
    await this.storage.create();

    this.storage.get('userDetail').then((userDetailValue) => {
      this.account.username = userDetailValue.data.email;
    })
  }

  doLogin() {
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);
    // alert(this.requesttype + '2')
    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    this.apiService.postServerData('user/json/login', null, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        //   alert(this.requesttype + '3')
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
          this.bindCategory(3, "News");
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
          this.bindCategory(2, "Audio");
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
          this.bindCategory(1, "Video");
          this.showCategory = true;
          this.showteacher = false;
          this.video();
        }
        else if (this.requesttype == "livevideo") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.HeaderName = "Live Video";
          this.showJyotish = false;
          this.scrollcount = 0;
          this.showCategory = false;
          this.showteacher = false;
          this.livevideo();

          this.showlivevideo = true;
        }
        else if (this.requesttype == "article") {
          this.shownews = false;
          this.showvideo = false;
          this.showaudio = false;
          this.showArticles = false;
          this.HeaderName = "Articles";
          this.showJyotish = false;
          this.scrollcount = 0;
          this.bindCategory(4, "Articles");
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
        else if (this.requesttype == "stotras") {
          // alert('stotras')
          this.router.navigate(['/open-web-url'], {
            queryParams: {
              url: 'https://maharishiji.net/stotras-mobile?user=' + this.account.username,
              title: '',
              imagePath: '',
              webtype: 'weburl'
            }
          });
          // this.loadurl('https://maharishiji.net/stotras-mobile?user=' + this.account.username);
        }

      }
      else {
        this.lblMessage = "Invalid Username and password..";
      }
    },
      (error: any) => {
        // Handle login error here
        this.lblMessage = "Invalid Username and password..";
      });
  }

  handleCancel() {
    //console.log('ionCancel fired');
  }

  handleDismiss() {
    //console.log('ionDismiss fired');
  }

  bindCategory(CategoryID: any, Type: any) {
    this.loadingData = true;
    this.category = [];
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });

    this.apiService.getServeData('main-category/json/min/' + CategoryID, this.authHeader).subscribe((response: any) => {
      if (response != null) {

        for (let newdata of response.data.subCategory) {

          if (this.category.find(item => item.id == newdata.id) == null) {
            this.ccount++;
            this.category.push({
              id: newdata.id,
              title: newdata.name,
              ctype: Type
            });
          }
        }
        this.loadingData = false;

      }
    }
    );

  }

  openWebUrl() {

    const rawUrl = `https://maharishiji.net/stotras-mobile?user=${this.account.username}`;
    
    this.router.navigate(['/open-web-url'], {
      queryParams: {
        url:  `https://maharishiji.net/stotras-mobile`,
        title: '',
        imagePath: '',
        details : this.account.username,
        webtype: 'weburlwithDetail'
      }
    });
    // this.loadurl(`https://maharishiji.net/stotras-mobile?user=${this.account.username}`)

  }
  loaddata() {
    //console.log(this.categorytype);
    const selectedId = this.categorytype;
    this.selectedItem = this.category.find(item => item.id === selectedId);
    this.CategoryID = this.selectedItem.id;
    this.requesttype == this.selectedItem.ctype;
    this.loadingData = true;

    if (this.requesttype == "news") {
      this.news();
    }
    else if (this.requesttype == "audio") {
      this.audio();
    }
    else if (this.requesttype == "video") {
      this.video();
    }
    else if (this.requesttype == "livevideo") {
      this.livevideo();
    }
    else if (this.requesttype == "article") {
      this.article();
    }
    //this.loadingData = false;

  }
  loadMore(event: any) {

    // ⛔ Stop if requesttype is empty
    if (!this.requesttype || this.requesttype.trim() === '') {
      event.target.complete();
      return;
    }

    console.log(this.requesttype);

    this.storage.get('userDetail').then(userDetailValue => {

      if (userDetailValue != null) {

        this.scrollcount += 1;

        if (this.requesttype === 'news') {
          this.news(event);
        }
        else if (this.requesttype === 'audio') {
          this.audio(event);
        }
        else if (this.requesttype === 'video') {
          this.video();
        }
        else if (this.requesttype === 'article') {
          this.article(event);
        } else if (this.requesttype === 'TM') {
          //alert('fsfasf')
          event.target.complete();
          return;
        }

      }

      this.loadingData = false;
      event.target.complete();

    }).catch(() => {
      event.target.complete();
    });
  }


  news(event?: any) {
    this.data = [];
    this.loadingData = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    var sqlQueryData = '';
    if (this.CategoryID != 0)
      sqlQueryData = '/' + this.CategoryID + '/' + this.scrollcount + '/20';

    //console.log(sqlQueryData);


    this.apiService
      .getServeData('news-and-events/json/min' + sqlQueryData, this.authHeader)
      .subscribe((response: any) => {
        console.log(response)
        if (response?.data) {
          for (const newdata of response.data) {
            if (!this.data.find((item: any) => item.id === newdata.id)) {
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

          this.shownews = true;
          this.loadingData = false;
          this.scrollcount++;
        }

        // ✅ Ionic 6/7 safe
        event.target.complete();
        return;
      });
  }
  getImageUrl(imagePath: string): string {
    return this.apiService.getImageUrl('image/' + imagePath);
  }

  audio(event?: any) {
    this.loadingData = true;

    const base64Credentials = btoa(
      `${this.account.username}:${this.account.password}`
    );

    this.authHeader = new HttpHeaders({
      Authorization: `Basic ${base64Credentials}`
    });

    let sqlQueryData = '';

    if (this.CategoryID !== 0) {
      sqlQueryData = `/${this.CategoryID}/${this.scrollcount}/20`;
    }

    this.apiService
      .getServeData('audio/json/min' + sqlQueryData, this.authHeader)
      .subscribe((response: any) => {
        console.log(response);
        if (response?.data) {
          for (const newdata of response.data) {
            if (!this.tracks.find(item => item.title === newdata.name)) {
              this.ccount++;
              this.tracks.push({
                title: `${newdata.name} (${newdata.subCategory.name})`,
                path: this.apiService.baseUrl + newdata.audioFile,
                image: this.apiService.getImageUrl('image/' + newdata.image),
                audioFile: this.apiService.baseUrl + 'play/' + newdata.audioFile,
                viewcount: newdata.viewCount
              });
            }
          }

          this.showaudio = true;
          this.scrollcount++; // ✅ important
        }

        this.loadingData = false;

        // ✅ Ionic 7 correct way
        event?.target?.complete();
      });
  }


  livevideo(event?: any) {
    this.loadingData = true;

    const base64Credentials = btoa(
      `${this.account.username}:${this.account.password}`
    );

    this.authHeader = new HttpHeaders({
      Authorization: `Basic ${base64Credentials}`
    });

    // ✅ clear correct array
    this.livevideodata = [];

    this.apiService
      .getServeData('/video/live_video', this.authHeader)
      .subscribe({
        next: (response: any) => {
          if (response?.data) {
            this.livevideodata.push({
              title: response.data.title,
              description: response.data.description,
              id: 'https://ramrajtv.livebox.co.in/livebox/player/?chnl=Ramrajtv'
            });
          }

          this.showlivevideo = true;
          this.loadingData = false;
          event.target.complete();
          return;
        },
        error: () => {
          this.loadingData = false;
        }
      });
  }


  video() {
    this.videodata = [];
    this.loadingData = true;
    const base64Credentials = btoa(`${this.account.username}:${this.account.password}`);

    this.authHeader = new HttpHeaders({
      'Authorization': `Basic ${base64Credentials}`
    });
    var sqlQueryData = '/min';
    if (this.CategoryID != 0)
      sqlQueryData = '/category-wise/' + this.CategoryID;


    this.apiService.getServeData('video/json' + sqlQueryData, this.authHeader).subscribe((response: any) => {
      if (response != null) {
        for (let newdata of response.data) {
          //console.log(newdata.subCategory.name);
          this.videodata.push({
            description: newdata.hindiDescription,
            id: newdata.id,
            title: newdata.name + '(' + newdata.subCategory.name + ')',
            updationDate: newdata.updationDate,
            shareCount: newdata.shareCount,
            viewCount: newdata.viewCount,
            urlToImage: newdata.image

          });
        }

      }
      this.loadingData = false;
      this.showvideo = true;
    }
    );


  }


  article(event?: any) {
    this.loadingData = true;

    const base64Credentials = btoa(
      `${this.account.username}:${this.account.password}`
    );

    this.authHeader = new HttpHeaders({
      Authorization: `Basic ${base64Credentials}`
    });

    let sqlQueryData = '';

    if (this.CategoryID !== 0) {
      sqlQueryData = `/${this.CategoryID}/${this.scrollcount}/20`;
    }

    this.apiService
      .getServeData('article/json/min' + sqlQueryData, this.authHeader)
      .subscribe((response: any) => {

        if (response?.data?.length) {
          for (const newdata of response.data) {
            if (!this.articalsdata.find(item => item.id === newdata.id)) {
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

          this.scrollcount++; // ✅ important
        } else {
          // ✅ No more data → disable infinite scroll
          event.target.disabled = true;
        }

        this.showArticles = true;
        this.loadingData = false;

        // ✅ Ionic 7 way
        event?.target?.complete();
      });
  }





  loadAudio(audio: any) {
    //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
    //sending this data to the broswer widnows.
    console.log(audio.audioFile);
    console.log(audio)
    console.log(audio.image);
    this.router.navigate(['/open-web-url'], {
      queryParams: {
        url: audio.audioFile,
        title: audio.title,
        imagePath: audio.image,
        webtype: 'audio'
      }
    });
  }



  Loadlivevideo(url: any, title: any) {

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
    fetch(url, requestOptions)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok ' + response.statusText);
        }
        response.text().then((htmldata) => {
          this.router.navigate(['/open-web-url'], {
            queryParams: {
              urldata: '',
              title: title,
              htmldata: htmldata
            }
          });

        });


      })
      .then(result => result)
      .catch(error => console.error('Error:', error));
  }

  


  Loadvideo(id: any, title: any) {
    this.loadingData = true;
    this.showvideo = false;
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
    console.log(username, password);
    const requestOptions: RequestInit = {
      method: "GET",
      headers: myHeaders,
      redirect: "follow"
    };
    console.log(this.apiService.baseUrl + 'video/play/' + id, requestOptions);
    fetch(this.apiService.baseUrl + 'video/play/' + id, requestOptions)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok ' + response.statusText);
        }
        response.text().then((htmldata) => {
          console.log(htmldata)
          this.loadingData = false;
      //    const safeHtml = this.patchVideoHtml(htmldata);
          this.router.navigate(['/open-web-url'], {
            queryParams: {
              url: this.apiService.baseUrl + 'video/play/' + id, requestOptions,
              title: title,
              htmldata: htmldata
            }
          });
        });
      })
      .then(result => result)
      .catch(error => console.error('Error:', error));
  }
  // loadurl(curl: any) {
  //   //fileUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
  //   //sending this data to the broswer widnows.
  //   //console.log(curl);
  //   this.navCtrl.navigateForward('/tabs/open-web-url', {
  //     queryParams: {
  //       url: curl,
  //       title: '',
  //       imagePath: '',
  //       webtype: 'weburl'
  //     }
  //   });

  // }


  async loadurl(curl: string) {
    // await Browser.open({
    //   url: curl
    // });
     this.router.navigate(['/open-web-url'], {
      queryParams: {
        url: curl,
        title: '',
        imagePath: '',
        webtype: 'weburl'
      }
    });
  }

  loadState() {
    this.apiService.getServerData('/tm-city/json/state-list').subscribe((response: any) => {
      this.state = response.data;
    });
  }

  loadCity() {
    this.tmTeachers = [];
    this.apiService.getServerData('tm-city/json/bystate/' + this.statetype).subscribe((response: any) => {
      this.city = response.data;
    });
  }
  servicedetail(objectdata: any, HeaderName: any) {
    console.log(objectdata)
    console.log(HeaderName)
    this.router.navigate(['/service-detail'], {
      queryParams: {
        objectdata: JSON.stringify(objectdata),
        HeaderName: HeaderName
      }
    });


  }

  loadTMTeachers(event: any) {
    var sqlQueryData = "";
    if (this.citytype != 'All') {
      this.cityName = this.citytype.name;
      sqlQueryData = '/bycity/' + this.citytype.id + '/' + (this.requesttype == 'TM' ? 'TM Teacher' : "Jyotish Consultant");
    }

    //https://maharishiji.net/tm-info/json/bycity/86/TM Teacher
    this.apiService.getServerData('tm-info/json' + sqlQueryData).subscribe((response: any) => {
      if (response.data.length != 0) {
        this.tmTeachers = response.data;
        this.found = "";
        event.target.complete();
        return;

      }
      else {
        this.found = "not";
      }
    });
  }
}


