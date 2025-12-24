import { Injectable } from '@angular/core';
import { Api } from '../api/api';
import { firstValueFrom } from 'rxjs';  // replaces toPromise()

@Injectable({
  providedIn: 'root'   // modern Angular way
})
export class User {
  private _user: any;

  constructor(public api: Api) {}

  logout() {
    this._user = null;
  }

  _loggedIn(resp: { user: any }) {
    this._user = resp.user;
  }

  // Example: modern replacement for toPromise
  async getUserProfile() {
    try {
      const result = await firstValueFrom(this.api.get('profile'));
      return result;
    } catch (err) {
      console.error('Error fetching profile', err);
      throw err;
    }
  }
}
