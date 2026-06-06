const https = require('https');

const urls = [
  'https://www.google.com/s2/favicons?domain=minecraft.net&sz=128',
  'https://www.google.com/s2/favicons?domain=fabricmc.net&sz=128',
  'https://www.google.com/s2/favicons?domain=minecraftforge.net&sz=128',
  'https://www.google.com/s2/favicons?domain=neoforged.net&sz=128',
  'https://www.google.com/s2/favicons?domain=quiltmc.org&sz=128',
  'https://www.google.com/s2/favicons?domain=java.com&sz=128'
];

urls.forEach(url => {
  https.get(url, res => {
    console.log(`${res.statusCode} - ${url} - Content-Type: ${res.headers['content-type']}`);
  }).on('error', e => {
    console.error(`ERROR ${url}: ${e.message}`);
  });
});
