'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "558098d7171f96373d1a6a48a390cbc9",
"manifest.json": "de26242f7d531f8004b2cad3c50ad649",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"main.dart.js": "aed6e6a84411a8eee6402cd4bad23a72",
"assets/NOTICES": "a7456f3689123d7157fd7e6f906eef4a",
"assets/FontManifest.json": "f1f80d900c76bd88612e57507f067436",
"assets/assets/images/telegram.png": "eb1fa44bd3e279f3f0b7c05df3bee9b9",
"assets/assets/images/hasanm108.jpg": "96913781dbfe0c63042285c18e71b103",
"assets/assets/images/hasanm308.png": "5f3a725a53fa4cec327d836f105d07bf",
"assets/assets/images/Tehran.png": "08b00e5a3491128fd83275a7a1d4a04f",
"assets/assets/images/hasanm308.jpeg": "dab607e796cc25a558e82ab5da0d2c7b",
"assets/assets/images/instagram.png": "26631a4043b14dff84180bdf51c3cacb",
"assets/assets/images/whatsapp.png": "fc601ba58f923366416bd69b8be6cca4",
"assets/assets/images/hasanm208.jpg": "e420e4829b6f973f2a6643f005039b60",
"assets/assets/images/profile.png": "055a91979264664a1ee12b9453610d82",
"assets/assets/images/hasanm08.jpg": "2e22b0a1510db6bd2c2e9f423b11e802",
"assets/assets/images/Kerman.png": "6400cf65752e411c49d98f4741d5d4c5",
"assets/assets/images/Mashhad.png": "9963a34a66336e2cb161bd004c40fa41",
"assets/assets/images/myicon.png": "2140553e56d3ca62dd493c5ca501d744",
"assets/assets/images/coding.png": "53ba28d748db5eb33c277888d3879c08",
"assets/assets/images/gmail.png": "e79bcec8e3b333c4b242080a6dd40b48",
"assets/assets/fonts/kalame-light.ttf": "f882831c2377efcadab6b2e95f14034b",
"assets/assets/fonts/kalame-regular.ttf": "316348edf97c8ed502942c7145d4d37f",
"assets/assets/fonts/Pacifico-Regular.ttf": "9b94499ccea3bd82b24cb210733c4b5e",
"assets/assets/fonts/Exo2-Medium.ttf": "654449e291aeca104593a0c2ad4b99a8",
"assets/assets/fonts/kalame-bold.ttf": "4adac053a51601662b30a7c588245d57",
"assets/AssetManifest.bin": "d0fc795c599b59fc5d9ca7911e828ee3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "0a83b2eb0f24a3c149bcd744ea57ced3",
"assets/fonts/MaterialIcons-Regular.otf": "c40e1f5ff73746e67bc930a5da95cbe5",
"assets/AssetManifest.json": "4928801a6b497598d523c32f36599b73",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"profile.png": "055a91979264664a1ee12b9453610d82",
"index.html": "07fd3aefee8070159c0e72d8c54757b0",
"/": "07fd3aefee8070159c0e72d8c54757b0",
"splash/splash.js": "f6ee10f0a11f96089a97623ece9a1367",
"splash/img/light-1x.png": "d813fb19f92b5a3ead83f7444e4e2cb2",
"splash/img/light-2x.png": "12673fc95048eadefdb4d108941a6b3f",
"splash/img/dark-2x.png": "12673fc95048eadefdb4d108941a6b3f",
"splash/img/dark-1x.png": "d813fb19f92b5a3ead83f7444e4e2cb2",
"splash/img/dark-4x.png": "1d0753457c4c9dab55c05a8b44e2d906",
"splash/img/light-3x.png": "2035dad262cbd754269730b3ac68cd83",
"splash/img/light-4x.png": "1d0753457c4c9dab55c05a8b44e2d906",
"splash/img/dark-3x.png": "2035dad262cbd754269730b3ac68cd83",
"splash/style.css": "59d66af6467e267ed2e58873f28cdb24"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
