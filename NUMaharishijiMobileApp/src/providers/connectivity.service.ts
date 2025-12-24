import { Injectable } from '@angular/core';
import { Observable, of, fromEvent, merge } from 'rxjs';
import { map, startWith, shareReplay } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ConnectivityService {
  /** Emits true/false when online/offline */
  public appIsOnline$: Observable<boolean>;

  constructor() {
    this.appIsOnline$ = merge(
      fromEvent(window, 'online').pipe(map(() => true)),
      fromEvent(window, 'offline').pipe(map(() => false))
    ).pipe(
      startWith(navigator.onLine), // emit current status immediately
      shareReplay(1) // cache last value so late subscribers get it
    );
  }

  /** Snapshot: returns true if currently online */
  public isOnline(): boolean {
    return navigator.onLine;
  }
}
