import { Component, Input } from '@angular/core';
import { NavController, Platform } from 'ionic-angular';
import { Media, MediaObject } from '@ionic-native/media';

@Component({
  selector: 'audio-player',
  templateUrl: 'audio-player.html'
})
export class AudioPlayerComponent {
  @Input() audioUrl: string;
  audioFile: MediaObject;
  isPlaying: boolean = false;
  //audioUrl = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';

  constructor(public navCtrl: NavController, private platform: Platform, private media: Media) {
    console.log(this.audioUrl)
    this.platform.ready().then(() => {
      if (this.platform.is('cordova')) {
        this.audioFile = this.media.create(this.audioUrl);
        console.log('mediacreated'+JSON.stringify(this.audioFile));
      }
    });
     
  }

  playAudio() {
    console.log(this.audioUrl);
    if (this.platform.is('cordova')) {
      this.audioFile.play();
    } else {
      let audio = new Audio(this.audioUrl);
      audio.play();
    }
    this.isPlaying = true;
  }

  pauseAudio() {
    if (this.platform.is('cordova')) {
      this.audioFile.pause();
    } else {
      // Implement pause functionality for web audio
    }
    this.isPlaying = false;
  }

  stopAudio() {
    if (this.platform.is('cordova')) {
      this.audioFile.stop();
      this.audioFile.release();
    } else {
      // Implement stop functionality for web audio
    }
    this.isPlaying = false;
  }
}
