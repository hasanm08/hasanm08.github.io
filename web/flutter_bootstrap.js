{{flutter_js}}
{{flutter_build_config}}

// Replaced at build time with a version string when offline-first SW is enabled.
const serviceWorkerVersion = null;

_flutter.loader.load({
  serviceWorkerSettings: {
    serviceWorkerVersion: serviceWorkerVersion,
  },
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();
    if (typeof removeSplashFromWeb === "function") {
      removeSplashFromWeb();
    }
  },
});
