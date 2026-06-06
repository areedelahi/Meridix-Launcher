const https = require('https');

function fetchJson(url) {
  return new Promise((resolve, reject) => {
    https.get(url, res => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(JSON.parse(data)));
    }).on('error', reject);
  });
}

async function run() {
  const manifest = await fetchJson('https://piston-meta.mojang.com/mc/game/version_manifest_v2.json');
  const v1_20_1 = manifest.versions.find(v => v.id === '1.20.1');
  const vData = await fetchJson(v1_20_1.url);
  const assetIndexUrl = vData.assetIndex.url;
  const assets = await fetchJson(assetIndexUrl);
  
  const iconKeys = Object.keys(assets.objects).filter(k => k.includes('icon') && k.includes('.png'));
  console.log(iconKeys);
}

run();
