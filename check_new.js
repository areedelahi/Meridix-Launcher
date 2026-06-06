const https = require('https');

const urls = [
  'https://raw.githubusercontent.com/walkxcode/dashboard-icons/main/png/java.png',
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Minecraft_forge_logo.png',
  'https://raw.githubusercontent.com/FabricMC/fabric/1.20/docs/assets/logo.png',
  'https://raw.githubusercontent.com/neoforged/NeoForge/main/docs/modules/ROOT/assets/images/neoforged-transparent.png',
  'https://quiltmc.org/favicon/apple-touch-icon.png'
];

urls.forEach(url => {
  https.get(url, res => {
    console.log(`${res.statusCode} - ${url}`);
  }).on('error', e => {
    console.error(`ERROR ${url}: ${e.message}`);
  });
});
