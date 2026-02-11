'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "6cebe8812d6f42005440583a19dee14c",
"/": "6cebe8812d6f42005440583a19dee14c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/AssetManifest.bin": "2b05a9288a8fc113e0eda6dbf800492b",
"assets/AssetManifest.json": "4d5c53eac81cc7967a673a7ddd179bb5",
"assets/assets/categoria.json": "84bd717bf29527028b44809782575ef0",
"assets/assets/PUNTA_DE_ANCA.png": "7156b15ce96fe72f69ef9b170ba82427",
"assets/assets/hamburguesa.png": "c0e0b0186695a4c307bcab8d103e2aa6",
"assets/assets/places2.json": "3bfe25452e51428894cbc2e7905e49c0",
"assets/assets/afegym.png": "e165b80e0585aa2eaa04300d0c5866f1",
"assets/assets/hitFitness.jpg": "892096a9dc930c9ce0032062851466fb",
"assets/assets/PANADERIAS.png": "a6e884cf2df46ccb72115d1b4ac17134",
"assets/assets/coctel-daiquiri.jpg": "deb4ddd296b21a9f9f97109b1206f417",
"assets/assets/santanderplacess.png": "38066f4ddd14f9453ef037efaa7a3874",
"assets/assets/Captura.JPG": "01a144f4131c5dcf5e1e36a79d8ae72a",
"assets/assets/alitas.jpg": "0bd90a9a3bf5b4a4abcd84bd067ef315",
"assets/assets/hamburgesas.json": "a502fcb59d0bec8366ba96327c9b6a7d",
"assets/assets/TENTEMPIE.png": "6ea72ab7de15a3f698dac88a83deea16",
"assets/assets/barraca.JPG": "b4726cb60e1d7dff6c4432c5feda3dec",
"assets/assets/milo.png": "992f6d2ac51bdad731d06f992804f559",
"assets/assets/BPG.png": "24ff1ea911acfc79d340851478404e76",
"assets/assets/coctel-cuba-libre.jpg": "34fae28bc87dac4e34d7dfa282ccc6b7",
"assets/assets/comidasrapidaslogos.jpg": "8f7d3e6edec51e196c89bd4faca1181f",
"assets/assets/buscar.png": "c4decc08163ac335ed283a873c7d0dfd",
"assets/assets/coctel-sex-on-the-beach.jpg": "a00ba3d0de85d300940c6cd9afac1f57",
"assets/assets/salchipapas.jpg": "ccc2b51e3942546573b1db34d8d249e0",
"assets/assets/aqui.JPG": "eefe683d50892ab975351cbf8714dc07",
"assets/assets/gyms.jpg": "a8ab4543ff03a1a754178fe0429fcfac",
"assets/assets/triologia-de-carnes.jpg": "7b860b237baadca5199c0a86addf68e6",
"assets/assets/2.JPG": "2de257d54133e72756d37f1e629bfa2b",
"assets/assets/Imagen%2520pegada.png": "685eb3e41d6c114438a5c1430494f86d",
"assets/assets/comidasRapidas.json": "2e26a73b73e09f6e8fe7be2d07797420",
"assets/assets/elsabor.jpg": "dc236e37075cb0729b512f03a52dcaa2",
"assets/assets/coctel-tekila-sunrise.jpg": "b80f5071e1e664bd81d79fd8e484ef26",
"assets/assets/empanada.png": "2b3f28845fc3b3de18e84e00d64dc44a",
"assets/assets/quilialitas.jpeg": "01da18224af3f76a5dcba4d1c0b1d6d2",
"assets/assets/santanderplacesimg.png": "44fb8d8f9c65a419d8425585a8a24f02",
"assets/assets/hamburgesasDobleCarne.jpg": "eb1ddb263e0046421150ef26912b7a48",
"assets/assets/pastelbanano.png": "a14eeae72d5139e244ae55443d6007ee",
"assets/assets/calabozo.jpg": "35aefdc5c763e255d918225099804f84",
"assets/assets/restaurante.json": "c5307a7cdf2949adaca2841e954333cb",
"assets/assets/pizza.jpeg": "3910a8ddacf29c2e95e6d24efb9713dd",
"assets/assets/places3.json": "8e596502b52e5ec7d203d425566e98c3",
"assets/assets/maderosyparrilla.jpg": "7ec33f4adaeb2446ebfbeb093acbc239",
"assets/assets/MORRILLO.png": "8c44420bb8260ff04b166d2d3aa07f0e",
"assets/assets/comidaRestaurantes.json": "21ad88c2f30da7af040a7a6b020a8a79",
"assets/assets/ambriosa.jpg": "927f4df8adfbda69d972e0b3807d8eda",
"assets/assets/hotel.png": "98cded889057a16e9441e917f6200e77",
"assets/assets/lugar.jpg": "4d701a6b5d07dda6f4e332276a7dbc7a",
"assets/assets/limonada-de-coco.jpg": "d6c58dfe449dc15b2cb0f9c75a11f272",
"assets/assets/gym.json": "86339265ccbff84294db26a70c7052d9",
"assets/assets/coctel-margarita-maracuya.jpg": "af91bc1c98a46274426a3169b1445f83",
"assets/assets/hamburgesaSencilla.jpg": "6c3f53108b272538b0772fb2c192dc75",
"assets/assets/menu.jpeg": "e0dc38b9ae50b6c70ab98ee8d5e54577",
"assets/assets/empanadas.png": "6ea72ab7de15a3f698dac88a83deea16",
"assets/assets/plazacentral.jpeg": "8dff5c3f28e35e14a6f3bc5f78d54690",
"assets/assets/delicioso-lomo-viche.jpg": "354d639db53424778281445fc72d5aec",
"assets/assets/santanderPlaces.jpeg": "b750692788d77b4bcad020819e797f79",
"assets/assets/gimnasio.png": "2e50e04470e29384b4d4e9a3b6e4f1dd",
"assets/assets/coctel-el-solar.jpg": "954918ab15ebd1d1287aba23d72a1beb",
"assets/assets/oreo.png": "2873654f03becd2d4c553ec7193923e9",
"assets/assets/brasa.jpg": "8f87c4a1b3be87a093338e5cfe048c94",
"assets/assets/salchiking.png": "022405ca5619d14756bbbbe80f201a10",
"assets/assets/pacos.jpg": "a747c8c814ea430e996307dd3641f5cc",
"assets/assets/restaurante.png": "70b23fa46048741358373107df0e2b7c",
"assets/assets/placesrestaurante.json": "1516d04ecee4242d7ba752105196e0fb",
"assets/assets/alitas.json": "5f59a682f31a135fe08447523c9be979",
"assets/assets/sazonpacifico.jpg": "d0308c5d5a0340ff42be4110f730320b",
"assets/assets/PREFERIDO_DE_NOE.png": "91792c2722b6653b9ac8d13a607cefa6",
"assets/assets/no_image.jpeg": "abcae94d543f1ddcc418317b979f6354",
"assets/assets/comida_rapida.jpeg": "ed17626d00285cb0cccdc373f657ccc1",
"assets/assets/casape.png": "ea50ecaeb951e1e430b74f2ff21258c3",
"assets/assets/jitos.png": "c2f682a157d0558366e7d8dd3d7a0d92",
"assets/assets/comer-unscreen.gif": "8a61c8cc5b88e85c866acf6fffae1dc9",
"assets/assets/SALCHIKING.json": "276630a63d77de1195652f005266ac04",
"assets/assets/tresLeches.png": "aad7c04f3c6d8a65c22b97648bb70b47",
"assets/assets/senderopicnic.png": "6b71123430dbe632f52aff79bddfedfe",
"assets/assets/delicisas.JPG": "d9dfe09682916b0c18695eb0dd769d42",
"assets/assets/hamburgesaConCrema.jpg": "7dcdf976f20b68bdb3ff0917bb4736fd",
"assets/assets/cumplea%25C3%25B1os": "b21ecf684e9c224559c023f06f6a383e",
"assets/assets/shot-medusa.jpg": "5819afc5d0dbe42f1ebb346f3a76120f",
"assets/assets/postres.json": "9654250282371b4aff97f5dec1623a7b",
"assets/assets/hamburguesaCebollaCaramelizada.jpeg": "4516dcc07e7075fcd31a771e5bb525a1",
"assets/assets/micomia.jpg": "b5b23a5e5a61e1de7359e60b9db02c19",
"assets/assets/pastel2.png": "cb382ec2286d4301568abeff7d85460c",
"assets/assets/luiya_gym.jpg": "c7b2c6bbdfea13f028e3fcc4292491e4",
"assets/assets/cargando.gif": "22c5d157973656189720714aa7b49faf",
"assets/assets/pasteal1.png": "baaf5b39d43bfa60fe1f63732bc09bd1",
"assets/assets/ARROZ_ATOLLADO.png": "6bbadde8beb63615c1590c86009d1e11",
"assets/assets/placesrestaurantes.json": "664eb39faeeec435da2472bf0b25e8c1",
"assets/assets/MARINEROS.png": "655415540dd9744754fd36670ce1ba9c",
"assets/assets/rubymar.jpg": "ac87cdffc1ba872a7a2685c64e5a9374",
"assets/assets/hamburges.png": "cf1919f1a87ec2bda6e556da2a637ddd",
"assets/assets/proximamente.jpg": "2b1ba25121c81ba4052c4885b23c2ead",
"assets/assets/patacos.jfif": "285496d219e6cc55273eedbc6542da1a",
"assets/assets/pastel4.png": "b4fe07044d088165e9f9f0cff028a73c",
"assets/assets/PARRILLADA.png": "9e70352a722cdcf1d9688478a40d7ffa",
"assets/assets/TORBELLINO_DE_POLLO.png": "8d87da3d790f3bc26db7a68d0cdbc2cf",
"assets/assets/mora.png": "29d24b71aa7be11eab13855bc7da65f3",
"assets/assets/logoBody.png": "b28b90eda9c6dd031ee889fee92c6520",
"assets/assets/maracuya.jpg": "f34208a4e824a456a2e8f6b2a3ea699d",
"assets/assets/resta.jpeg": "df9cee58a93affd89f9255de80adc65f",
"assets/assets/parrilla.jpg": "d1ac959d94a08419e8b3090aee97fa0b",
"assets/assets/pina-colada.jpg": "0a03d8cdbaf428dd0f419b4ce6ad142c",
"assets/assets/aborrajados.png": "f127f86f04958a2082b97676bc47c349",
"assets/assets/hamburguesaConTocino.jpg": "ebe9b2e7f0ada155f09dd3c26172493e",
"assets/assets/comer.gif": "a998369b8bafce7f22ece478fc3e87b1",
"assets/assets/fenixgym.png": "65f0b03727f110e6312bda382e74523b",
"assets/assets/solar.jpeg": "e7367d28264bcc51fbbc93af2b95f61a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "a5520ab2b6bb9e07c9c5e68be3e9550e",
"assets/AssetManifest.bin.json": "ed6c6f1749b569942e83f01bc7500dae",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/NOTICES": "8a9e6dd6f211c3cdc10c81781517e410",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"main.dart.js": "a2e07d9caced5f0eb65c0321b7fb9450",
"version.json": "9d64830b9787f9a65e71da39fb9a5e85",
"manifest.json": "36f20b7e838d50b330f8a77eeef18d50",
"flutter_bootstrap.js": "c052ddd639097a6a91449b4235c6f00e",
"flutter.js": "f393d3c16b631f36852323de8e583132"};
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
