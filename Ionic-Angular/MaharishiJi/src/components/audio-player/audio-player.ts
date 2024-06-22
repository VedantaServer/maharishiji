import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Media, MediaObject } from '@ionic-native/media';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'audio-player',
  templateUrl: './audio-player.html'
})
export class AudioPlayerComponent implements OnInit {
  @ViewChild('myAudioElement') audioElement: ElementRef;

  // Base64 encode the username and password
  base64Encode(username: string, password: string): string {
    return btoa(`${username}:${password}`);
  }

  private mediaObject: MediaObject;
  private audioUrl: string = 'https://maharishiji.net/stream/AUDIO/202406/e6fy_Dainik_Faladesh_20_June_2024_Mapp_Audio.mp3';
  private username: string = 'awdhesh@mssmail.org';
  private password: string = '123456';
  error: string = '';

  constructor(private media: Media, private http: HttpClient) { }

  ngOnInit() {
    //this.playAudio();
  } 
  

  // Method to fetch and play audio
  fetchAndPlayAudio() {

    const headers = new Headers({
      'Authorization': 'Basic ' + this.base64Encode(this.username, this.password)
    });

    fetch(this.audioUrl, { headers })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.blob();
      })
      .then(blob => {
        const audio = this.audioElement.nativeElement;
        const objectUrl = URL.createObjectURL(blob);
        audio.src = objectUrl;
        audio.play().catch(error => {
          console.error('Playback failed:', error);
        });
      })
      .catch(error => {
        console.error('Fetch error:', error);
      });
  }

}
