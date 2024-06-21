import { Component, Input } from '@angular/core';

@Component({
  selector: 'audio-player',
  templateUrl: 'audio-player.html' 
})
export class AudioPlayerComponent {
  @Input() audioSrc: string;
  private audio = new Audio();

  isPlaying: boolean = false;

  constructor() {}

  playAudio() {
    if (this.audioSrc) {
      this.audio.src = this.audioSrc;
      this.audio.load();
      this.audio.play();
      this.isPlaying = true;
    }
  }

  pauseAudio() {
    if (this.isPlaying) {
      this.audio.pause();
      this.isPlaying = false;
    }
  }

  togglePlayPause() {
    if (this.isPlaying) {
      this.pauseAudio();
    } else {
      this.playAudio();
    }
  }
}
