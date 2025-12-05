'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "386fb8e9715357d5aaf217e3df7b0888",
"version.json": "99f26e06f1f74da65da1b5e5697da27d",
"index.html": "cd1f2d887d3dc71e9bddfc4d6b660481",
"/": "cd1f2d887d3dc71e9bddfc4d6b660481",
"main.dart.js": "9bc24408a3910af45406c06b19d1f70b",
"flutter.js": "baab3b6ad5e74e3f0d43d96274f5fba9",
"favicon.png": "bb7dfb213f3cbafb1a42c65b174607c4",
"icons/favicon-16x16.png": "bb7dfb213f3cbafb1a42c65b174607c4",
"icons/favicon.ico": "a36089ac06091d8216a8a58e248b099d",
"icons/apple-icon.png": "b4a02fa1a757eff2ef62fe0158c60820",
"icons/apple-icon-144x144.png": "3c9d8c599840efb2352b2ad8ca4634b8",
"icons/android-icon-192x192.png": "5f13ad4f594924a6cdec8dcedcd270a4",
"icons/apple-icon-precomposed.png": "b4a02fa1a757eff2ef62fe0158c60820",
"icons/apple-icon-114x114.png": "4e42e2210de83edbe7cf07c73d36e73d",
"icons/ms-icon-310x310.png": "847f272693fab69384410728da628b8a",
"icons/ms-icon-144x144.png": "3c9d8c599840efb2352b2ad8ca4634b8",
"icons/apple-icon-57x57.png": "506268f2e8ccb426f215c3063518b5b8",
"icons/apple-icon-152x152.png": "faa8119a419714f32dad8db549f1fd8c",
"icons/ms-icon-150x150.png": "e3045c2c8943b7130890c8c0ed71cd51",
"icons/android-icon-72x72.png": "bb14396ef72ebf39b1ca13695b8acc0b",
"icons/android-icon-96x96.png": "8e860637b8969e0598878eee023720c0",
"icons/android-icon-36x36.png": "b0bcae7429bc4f0f830f4b18f80cc6a5",
"icons/apple-icon-180x180.png": "f69b6244b42cc48d4f41c0e0af3bbe14",
"icons/favicon-96x96.png": "8e860637b8969e0598878eee023720c0",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-48x48.png": "d0bdc95c401dae2b141284d98bd9d01e",
"icons/apple-icon-76x76.png": "7fdd25bb9652da896941adb9a67243f0",
"icons/apple-icon-60x60.png": "2e2657696196993642fb6ece311a5489",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "3c9d8c599840efb2352b2ad8ca4634b8",
"icons/apple-icon-72x72.png": "bb14396ef72ebf39b1ca13695b8acc0b",
"icons/apple-icon-120x120.png": "8ce116952ae8158fdf5e8f87c21e41f0",
"icons/favicon-32x32.png": "557ed05b217fe9242433bba2b47fbe2d",
"icons/ms-icon-70x70.png": "60bd278f4edb1f0c73d385705d1092dd",
"manifest.json": "c7ad127eb173fd36cac815442c766b89",
"assets/AssetManifest.json": "6ac64ca02af8ce5da83ba5271e7c6db0",
"assets/NOTICES": "b109f8fa8be6a52f0b7d1d1bc20a0357",
"assets/FontManifest.json": "bb04ff8ae747384d33e08d82b11d843f",
"assets/AssetManifest.bin.json": "f85bff1f81da83dd01d06e99474af605",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "bcaf3ba974cf7900b3c158ca593f4971",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "7c6c906a4fbd57ff7b287508c8fac938",
"assets/fonts/MaterialIcons-Regular.otf": "83793066a8f2d855882fda87be9ffabf",
"canvaskit/skwasm.js": "37fdb662bbaa915adeee8461576d69d7",
"canvaskit/skwasm_heavy.js": "f5c1413d222bc68856296fc97ac9fec0",
"canvaskit/skwasm.js.symbols": "021707ff64ac37e2c81850adca34e06f",
"canvaskit/canvaskit.js.symbols": "867d15540d09106a65fd18e4e83408b3",
"canvaskit/skwasm_heavy.js.symbols": "4c6915a46a80eab1f5d7d6d435c117ad",
"canvaskit/skwasm.wasm": "f821008e63e8b0223476af8e7b5e7df7",
"canvaskit/chromium/canvaskit.js.symbols": "56b8de673e91c6624dc16cd0f1f9a838",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "49702d666184f2ea01f8ed6f3cbc2111",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "5070b29729807b44a517ff8ecdb9e31c",
"canvaskit/skwasm_heavy.wasm": "1e8e650beee57cf019dc8aef15f587c4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
