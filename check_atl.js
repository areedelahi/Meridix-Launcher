const https = require('https');

const urls = [
  'https://raw.githubusercontent.com/ATLauncher/ATLauncher/master/src/main/resources/assets/image/Icon.png',
  'https://raw.githubusercontent.com/ATLauncher/ATLauncher/master/src/main/resources/assets/image/FabricLogo.png',
  'https://raw.githubusercontent.com/ATLauncher/ATLauncher/master/src/main/resources/assets/image/ForgeLogo.png',
  'https://raw.githubusercontent.com/ATLauncher/ATLauncher/master/src/main/resources/assets/image/QuiltLogo.png',
  'https://raw.githubusercontent.com/ATLauncher/ATLauncher/master/src/main/resources/assets/image/NeoForgeLogo.png',
  'https://raw.githubusercontent.com/ATLauncher/ATLauncher/master/src/main/resources/assets/image/JavaLogo.png'
];

urls.forEach(url => {
  https.get(url, res => {
    console.log(`${res.statusCode} - ${url}`);
  }).on('error', e => {
    console.error(`ERROR ${url}: ${e.message}`);
  });
});
