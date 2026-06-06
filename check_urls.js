const https = require('https');

const urls = [
  'https://fabricmc.net/assets/logo.png',
  'https://raw.githubusercontent.com/MinecraftForge/MinecraftForge/1.19.4/src/main/resources/pack.png',
  'https://quiltmc.org/assets/img/logo.svg',
  'https://neoforged.net/img/neo-transparent.png',
  'https://images.curseforge.com/attachments/0/95/minecraft.png',
  'https://www.java.com/favicon.ico',
];

urls.forEach(url => {
  https.get(url, res => {
    console.log(`${res.statusCode} - ${url}`);
  }).on('error', e => {
    console.error(`ERROR ${url}: ${e.message}`);
  });
});
