'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"manifest.json": "08a3c4c4bbee927fd50374ce03e316a7",
"version.json": "558098d7171f96373d1a6a48a390cbc9",
"profile.png": "055a91979264664a1ee12b9453610d82",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"assets/FontManifest.json": "f1f80d900c76bd88612e57507f067436",
"assets/AssetManifest.json": "59764c8d51419e5b6b9981b6437c582e",
"assets/NOTICES": "03142bb45440ccad4cb6a622c66b4064",
"assets/assets/images/Mashhad.png": "9963a34a66336e2cb161bd004c40fa41",
"assets/assets/images/hasanm108.jpg": "96913781dbfe0c63042285c18e71b103",
"assets/assets/images/profile.png": "055a91979264664a1ee12b9453610d82",
"assets/assets/images/whatsapp.png": "fc601ba58f923366416bd69b8be6cca4",
"assets/assets/images/myicon.png": "2140553e56d3ca62dd493c5ca501d744",
"assets/assets/images/hasanm208.jpg": "e420e4829b6f973f2a6643f005039b60",
"assets/assets/images/telegram.png": "eb1fa44bd3e279f3f0b7c05df3bee9b9",
"assets/assets/images/instagram.png": "26631a4043b14dff84180bdf51c3cacb",
"assets/assets/images/hasanm08.jpg": "2e22b0a1510db6bd2c2e9f423b11e802",
"assets/assets/images/gmail.png": "e79bcec8e3b333c4b242080a6dd40b48",
"assets/assets/images/coding.png": "53ba28d748db5eb33c277888d3879c08",
"assets/assets/images/Tehran.png": "08b00e5a3491128fd83275a7a1d4a04f",
"assets/assets/images/Kerman.png": "6400cf65752e411c49d98f4741d5d4c5",
"assets/assets/fonts/Exo2-Medium.ttf": "654449e291aeca104593a0c2ad4b99a8",
"assets/assets/fonts/kalame-regular.ttf": "316348edf97c8ed502942c7145d4d37f",
"assets/assets/fonts/Pacifico-Regular.ttf": "9b94499ccea3bd82b24cb210733c4b5e",
"assets/assets/fonts/kalame-light.ttf": "f882831c2377efcadab6b2e95f14034b",
"assets/assets/fonts/kalame-bold.ttf": "4adac053a51601662b30a7c588245d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"main.dart.js": "2d7d1ccf14fc32204263f4cbac51a965",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"splash/style.css": "b78354eb2b5660c45ba5780a7bb861f9",
"splash/img/light-3x.png": "2035dad262cbd754269730b3ac68cd83",
"splash/img/light-2x.png": "12673fc95048eadefdb4d108941a6b3f",
"splash/img/light-4x.png": "1d0753457c4c9dab55c05a8b44e2d906",
"splash/img/dark-2x.png": "12673fc95048eadefdb4d108941a6b3f",
"splash/img/light-1x.png": "d813fb19f92b5a3ead83f7444e4e2cb2",
"splash/img/dark-3x.png": "2035dad262cbd754269730b3ac68cd83",
"splash/img/dark-1x.png": "d813fb19f92b5a3ead83f7444e4e2cb2",
"splash/img/dark-4x.png": "1d0753457c4c9dab55c05a8b44e2d906",
"splash/splash.js": "c6a271349a0cd249bdb6d3c4d12f5dcf",
"index.html": "ff0c43a279faae8b7367c5cd117cb55d",
"/": "ff0c43a279faae8b7367c5cd117cb55d"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
