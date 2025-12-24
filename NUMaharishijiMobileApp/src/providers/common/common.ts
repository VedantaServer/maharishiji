import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Api } from '../../providers';
import { LoadingController, Platform, ToastController } from '@ionic/angular';
import { ActionSheetController } from '@ionic/angular';

// Capacitor Plugins
import { Camera, CameraResultType, CameraSource } from '@capacitor/camera';
import { Filesystem, Directory } from '@capacitor/filesystem';
import { Share } from '@capacitor/share';
import { Preferences } from '@capacitor/preferences';
import { FileTransfer } from '@capacitor/file-transfer';
import { FileOpener, FileOpenerOptions } from '@capacitor-community/file-opener';
import { Capacitor } from '@capacitor/core';


@Injectable({
  providedIn: 'root'
})
export class CommonProvider {
  previewImage: string | null = null;
  socialSharing: any;
  setImage: any;
  loading: any;
  SMSAPI: any;

  constructor(private http: HttpClient, private api: Api, public platform: Platform, private actionSheetCtrl: ActionSheetController,
    private loadingCtrl: LoadingController,
    private toastCtrl: ToastController) { }

  isValidFileName(mediaURL: any): boolean {
    var Extension = mediaURL.substring(mediaURL.lastIndexOf('.') + 1).toLowerCase();
    // console.log(mediaURL);
    if (Extension == "gif" || Extension == "png"
      || Extension == "jpg" || Extension == "jpeg"
      || Extension == "pdf" || Extension == "doc")
      return true
    else
      return false
  }

  generateOTP() {
    return (Math.floor(1000 + Math.random() * 9000)).toString()
  }

  public createFileName() {
    var d = new Date(),
      n = d.getTime(),
      newFileName = n + ".jpg";
    return newFileName;
  }


  async uploadImage(DestinationURL: string, base64Image: string, filename: string, filetype: string = 'others'): Promise<boolean> {
    const loading = await this.loadingCtrl.create({
      message: 'Uploading...'
    });
    await loading.present();

    try {
      // Build multipart form data
      const blob = this.base64toBlob(base64Image, 'image/jpeg'); // adjust mimeType if needed
      const formData = new FormData();
      formData.append('file', blob, filename);
      formData.append('fileName', filename);
      formData.append('fileType', filetype);

      await this.http.post(DestinationURL, formData, {
        headers: new HttpHeaders({
          // 'Authorization': 'Bearer <token>'  <-- add if your API needs it
        }),
        responseType: 'json'
      }).toPromise();

      await loading.dismiss();
      this.presentToast('Image successfully uploaded..');
      return true;
    } catch (err: any) {
      await loading.dismiss();
      this.presentToast('Error while uploading file: ' + (err.message || err));
      return false;
    }
  }

  private base64toBlob(base64Data: string, contentType: string): Blob {
    const byteCharacters = atob(base64Data.split(',')[1]); // strip "data:image/jpeg;base64,"
    const byteArrays = [];

    for (let offset = 0; offset < byteCharacters.length; offset += 512) {
      const slice = byteCharacters.slice(offset, offset + 512);
      const byteNumbers = new Array(slice.length);
      for (let i = 0; i < slice.length; i++) {
        byteNumbers[i] = slice.charCodeAt(i);
      }
      const byteArray = new Uint8Array(byteNumbers);
      byteArrays.push(byteArray);
    }

    return new Blob(byteArrays, { type: contentType });
  }

  public async presentToast(message: string) {
    const toast = await this.toastCtrl.create({
      message,
      duration: 2000,
      position: 'bottom'
    });
    await toast.present();
  }


  async presentActionSheet(newFileName: string, previewImage: any) {
    const actionSheet = await this.actionSheetCtrl.create({
      header: 'Select Image Source',
      buttons: [
        {
          text: 'Load from Library',
          icon: 'image',
          handler: async () => {
            await this.takePicture(CameraSource.Photos, newFileName, previewImage);
          }
        },
        {
          text: 'Use Camera',
          icon: 'camera',
          handler: async () => {
            await this.takePicture(CameraSource.Camera, newFileName, previewImage);
          }
        },
        {
          text: 'Cancel',
          role: 'cancel',
          icon: 'close'
        }
      ]
    });

    await actionSheet.present();
  }



  // 📷 Capture Image from Camera or Gallery

  async takePicture(source: CameraSource, newFileName: string, previewImage: any) {
    const image = await Camera.getPhoto({
      quality: 90,
      resultType: CameraResultType.DataUrl, // base64 string
      source: source
    });

    if (image && image.dataUrl) {
      previewImage.src = image.dataUrl;   // show preview in img tag
      this.setImage = {
        uploadedImage: image.dataUrl,
        fileName: newFileName
      };
    }
  }




  // 💾 Save a file
  async saveFile(fileName: string, data: string) {
    await Filesystem.writeFile({
      path: fileName,
      data: data,
      directory: Directory.Documents
    });
  }

  // 📂 Read a file
  async readFile(fileName: string) {
    const contents = await Filesystem.readFile({
      path: fileName,
      directory: Directory.Documents
    });
    return contents.data;
  }

  // 📤 Share a file or link
  async shareFile(url?: string) {
    await Share.share({
      title: 'Share',
      text: 'Shared from App',
      url: url || this.previewImage || undefined,
      dialogTitle: 'Share with friends'
    });
  }

  // 🔑 Store data securely
  async setStorage(key: string, value: string) {
    await Preferences.set({ key, value });
  }

  // 🔑 Get stored data
  async getStorage(key: string) {
    const { value } = await Preferences.get({ key });
    return value;
  }

  // ❌ Remove stored data
  async removeStorage(key: string) {
    await Preferences.remove({ key });
  }



async download(fileURL: string, isSharing: boolean) {
  try {
    // Encode URL and extract file name
    const encodedUrl = encodeURI(fileURL);
    const fileName = new URL(encodedUrl).pathname.split('/').pop() || 'downloaded_file';

    const isNative = Capacitor.isNativePlatform();

    // --- Web download ---
    if (!isNative) {
      const response = await fetch(encodedUrl);
      const blob = await response.blob();
      const a = document.createElement("a");
      a.href = URL.createObjectURL(blob);
      a.download = fileName;
      document.body.appendChild(a);
      a.click();
      a.remove();
      URL.revokeObjectURL(a.href);
      return;
    }

    // --- Native (Android/iOS) ---
    // Request runtime permissions for Android
    if (Capacitor.getPlatform() === 'android') {
      const permStatus = await Filesystem.requestPermissions();
      if (permStatus.publicStorage !== 'granted') {
        alert("Storage permission is required to download files.");
        return;
      }
    }

    // Fetch file as blob
    const response = await fetch(encodedUrl);
    const blob = await response.blob();
    const base64Data = await this.convertBlobToBase64(blob);

    // Save file to External folder (user-accessible)
    const result = await Filesystem.writeFile({
      path: fileName,
      data: base64Data as string,
      directory: Directory.External,
    });

    console.log("File saved at:", result.uri);

    // --- Share if requested ---
    if (isSharing) {
      await Share.share({
        title: fileName,
        text: 'Sharing file from Vedanta ERP App',
        url: result.uri,
      });
      return;
    }

    // --- Open the file using FileOpener ---
    const mimeType = this.getMimeType(fileName);
    await FileOpener.open({
      filePath: result.uri,
      contentType: mimeType
    });

  } catch (err: any) {
    console.error('Download failed:', err);
    alert("Download failed: " + (err?.message || err));
  }
}

// Helper: convert Blob -> Base64
private convertBlobToBase64(blob: Blob): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onerror = reject;
    reader.onload = () => {
      resolve((reader.result as string).split(',')[1]); // remove metadata
    };
    reader.readAsDataURL(blob);
  });
}

// Helper: auto-detect MIME type by extension
private getMimeType(fileName: string): string {
  const ext = fileName.split('.').pop()?.toLowerCase();
  switch (ext) {
    case 'pdf': return 'application/pdf';
    case 'doc': return 'application/msword';
    case 'docx': return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    case 'xls': return 'application/vnd.ms-excel';
    case 'xlsx': return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    case 'png': return 'image/png';
    case 'jpg':
    case 'jpeg': return 'image/jpeg';
    case 'txt': return 'text/plain';
    default: return 'application/octet-stream';
  }
}


  /*
    async download(fileURL: string, isSharing: boolean) {
  
  
      const encodedUrl = encodeURI(fileURL);
      //alert(encodedUrl);
  
      const fileName = new URL(encodedUrl).pathname.split('/').pop() || '';
  
  
      //console.log(fileName);
  
      const cap = (window as any).Capacitor;
      const plugins = cap?.Plugins;
      const isNative = cap?.isNativePlatform?.();
      //console.log('downlod-native', isNative);
      try {
        if (!isNative) {
          // ---- Web ----
          const response = await fetch(encodedUrl);
          const blob = await response.blob();
          const a = document.createElement("a");
          a.href = URL.createObjectURL(blob);
          a.download = fileName;
          document.body.appendChild(a);
          a.click();
          a.remove();
          URL.revokeObjectURL(a.href);
          //return;
        }
  
        //alert(cap.getPlatform());
        // ---- Android runtime permission ----
        if (cap.getPlatform() === "android") {
          // Capacitor Filesystem has a built-in permission helper
          const permStatus = await plugins.Filesystem.requestPermissions();
          //alert(permStatus);
          if (
            !permStatus ||
            (permStatus.publicStorage && permStatus.publicStorage !== "granted")
          ) {
            alert("Storage permission is required to download files.");
            //return;
          }
        }
        // First get the full file path using Filesystem
        const fileInfo = await Filesystem.getUri({
          directory: Directory.Documents,
          path: fileName
        }); 
  
        // Then use the FileTransfer plugin to download
        await FileTransfer.downloadFile({
          url: encodedUrl,
          path: fileInfo.uri,
          progress: false
        });
  
        if (isSharing) {
          await Share.share({
            title: fileName,
            text: 'Sharing file from Vedanta ERP App',
            url: fileInfo.uri     // <-- actual file, not just path
          });
          return;
        } 
   
        try {
          const fileOpenerOptions: FileOpenerOptions = {
            filePath: fileInfo.uri,
            openWithDefault: true,
          };
  
          await FileOpener.open(fileOpenerOptions); 
  
        } catch (e) {
          console.log('Error opening file', e);
        } 
  
      } catch (err: any) {
        
        alert("File not availableSS");
      }
    }
  */









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

  getDateTimeDisplayIST(isoDateString: string): string {

   // console.log(isoDateString);
    if (!isoDateString) return '';

    // Convert to IST (UTC+5:30)
    const utcDate = new Date(isoDateString);
    const istOffsetMs = 5.5 * 60 * 60 * 1000;
    const istDate = new Date(utcDate.getTime() + istOffsetMs);

    const now = new Date();
    const nowIST = new Date(now.getTime() + istOffsetMs);

    const isSameDay = istDate.toDateString() === nowIST.toDateString();

    const yesterdayIST = new Date(nowIST);
    yesterdayIST.setDate(nowIST.getDate() - 1);
    const isYesterday = istDate.toDateString() === yesterdayIST.toDateString();

    if (isSameDay) {
      // Today: show time only
      return istDate.toLocaleTimeString('en-IN', {
        hour: '2-digit',
        minute: '2-digit',
        hour12: true
      });
    } else if (isYesterday) {
      return 'Yesterday';
    } else if (istDate.getFullYear() === nowIST.getFullYear()) {
      // Same year
      return istDate.toLocaleDateString('en-IN', {
        month: 'short',
        day: 'numeric'
      });
    } else {
      return istDate.toLocaleDateString('en-IN'); // Full date for older years
    }
  }

  public SendSMS(httpApi: any, schoolID: any, tenantID: any, Phone: any, Message: any) {

    // console.log(this.SMSAPI);
    if (!this.SMSAPI || this.SMSAPI == 'undefined') {
      //call http..to get SMS Api details of this schoolID      
      httpApi.get('SchoolSelect', {
        schoolID: schoolID,
        tenantID: tenantID,
        secureCode: '1'
      }).subscribe((resp: any) => {
        //console.log(JSON.stringify(resp));
        if (resp != null) {
          for (let school of resp.Result) {
            //console.log(school);
            this.SendSMSMessage(httpApi, school.SMSAPI, Phone, Message);
            this.SMSAPI = school.SMSAPI;
          }
        }
      });
    }
    else {

      this.SendSMSMessage(httpApi, this.SMSAPI, Phone, Message);
    }
  }

  SendSMSMessage(httpApi: any, SMSAPI: any, Phone: any, Message: any) {

    var URL = SMSAPI.replace('{0}', Phone); //change phone
    var FinalURL = URL.replace('{1}', Message); //change message

    //console.log(FinalURL);

    httpApi.getExternalURL(FinalURL).subscribe((resp: any) => {
      // console.log("SMS Sent")
    })

  }


  UpdateVisitorDB(httpApi: any, TenantID: any, schoolID: any, visitorID: any, UpdateQuery: any) {

    this.loading = this.loadingCtrl.create({
      message: 'DB updating...', // <-- 'content' is now 'message'
      spinner: 'crescent',       // optional
      duration: 0                // optional: 0 = no auto-dismiss
    });
    this.loading.present();
    console.log(UpdateQuery);
    console.log(visitorID);
    console.log(TenantID);
    console.log(schoolID);

    httpApi.get('App_UpdateObject', {
      TenantID: TenantID,
      SchoolID: schoolID,
      ObjectName: "VisitorPass",
      UpdateQuery: UpdateQuery,
      Condition: " where VisitorPassID=" + visitorID,
      secureCode: '1'
    }).subscribe((resp: any) => {
      this.presentToast('Database update was a success..');
      this.loading.dismissAll();
    }, (error: any) => {
      this.presentToast('Error while updating database....');
      this.loading.dismissAll();
    }
    );

  }
}
