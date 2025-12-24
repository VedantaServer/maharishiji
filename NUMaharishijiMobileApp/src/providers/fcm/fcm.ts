import { Injectable } from '@angular/core';
import { PushNotifications, Token, PushNotificationSchema, ActionPerformed } from '@capacitor/push-notifications';
import { Storage } from '@ionic/storage-angular';
import { Api, User } from '../../providers';
import { Capacitor } from '@capacitor/core';
import { FirebaseMessaging } from '@capacitor-firebase/messaging';

@Injectable({
  providedIn: 'root'
})
export class FcmService {

  constructor(private storage: Storage, public api: Api) { }

  // 📌 Register device for Push Notifications
  async initPush() { 
    
   // console.log('Requesting push notification permission...');

    if (Capacitor.getPlatform() !== 'web') {
      let permStatus = await PushNotifications.checkPermissions();

      if (permStatus.receive !== 'granted') {
        permStatus = await PushNotifications.requestPermissions();
      }

      if (permStatus.receive === 'granted') {
        console.log('Permission granted, registering...');
        await PushNotifications.register();
      } else {
        console.log('Permission not granted for push notifications');
        return;
      }

      // ✅ On successful registration
      PushNotifications.addListener('registration', (token: Token) => {
        console.log('Push registration success, token: ' + token.value);
        this.saveTokenToDatabase(token.value);
        // 👉 Send this token to your backend (for FCM)
      });

      // ❌ On registration error
      PushNotifications.addListener('registrationError', (error: any) => {
        console.error('Push registration error: ', error);
      });

      // 📥 On receiving notification
      PushNotifications.addListener('pushNotificationReceived', (notification: PushNotificationSchema) => {
        console.log('Push received: ', notification);
      });

      // 📤 On notification action
      PushNotifications.addListener('pushNotificationActionPerformed', (notification: ActionPerformed) => {
        console.log('Push action performed: ', notification);
      });
    } else {
      //console.log('Push notifications not available on web.');
    }
  }

  private saveTokenToDatabase(token: string,userid?:any) {
    if (!token) return;

    this.storage.get('account').then((accountValue: { TenantID: any; SchoolID: any; UserID: any; }) => {
      if (!accountValue) return;

      this.api.get('App_UserUpdate', {
        TenantID: accountValue.TenantID,
        SchoolID: accountValue.SchoolID,
        UserID: accountValue.UserID,
        ColumnName: 'IMEI',
        Value: token,
        secureCode: '1'
      }).subscribe((resp: any) => {
        if (resp && resp.Status === 'Success') {
          this.storage.set("FCMToken", token);
        }
      });
    });
  }

  

  public async getToken(userid: string) {
  if (!userid) return;

  try {
    // ✅ Request notification permission (iOS + Android 13+)
    const permStatus = await PushNotifications.requestPermissions();
    if (permStatus.receive !== 'granted') {
      console.log('Push permission not granted');
      return;
    }

    // ✅ Register with APNS/FCM
    await PushNotifications.register();

    // ✅ Get current FCM token
    const token = await FirebaseMessaging.getToken();
    if (token.token) {
      console.log('Got FCM token:', token.token);
      this.saveTokenToDatabase(token.token, userid);
    }

    // ✅ Listen for token refresh
    FirebaseMessaging.addListener('tokenReceived', (newToken) => {
      console.log('FCM token refreshed:', newToken.token);
      this.saveTokenToDatabase(newToken.token, userid);
    });

    // ✅ Foreground notification listener
    PushNotifications.addListener('pushNotificationReceived',
      (notification: PushNotificationSchema) => {
        console.log('Notification received in foreground:', notification);
        // handle in-app notification UI
      }
    );

    // ✅ Background/tapped notification listener
    PushNotifications.addListener('pushNotificationActionPerformed',
      (action: ActionPerformed) => {
        console.log('Notification tapped:', action.notification);
        // handle navigation or logic
      }
    );

  } catch (err) {
    console.error('Error in getToken:', err);
  }
}
}
