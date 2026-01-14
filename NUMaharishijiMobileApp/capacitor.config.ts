import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.mit.maharishiji',
  appName: 'Maharishi ji',
  webDir: 'www',

  server: {
    cleartext: true,
    allowNavigation: [
      'maharishiji.net',
      'www.maharishiji.net'
    ]
  }
};

export default config;
