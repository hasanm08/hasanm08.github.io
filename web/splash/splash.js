function removeSplashFromWeb() {
  const elem = document.getElementById("splash");
  if (!elem) {
    document.body.style.background = "transparent";
    return;
  }

  const prefersReducedMotion = window.matchMedia(
    "(prefers-reduced-motion: reduce)"
  ).matches;

  if (prefersReducedMotion) {
    elem.remove();
    document.body.style.background = "transparent";
    return;
  }

  elem.classList.add("splash-exit");
  elem.addEventListener(
    "transitionend",
    () => {
      elem.remove();
      document.body.style.background = "transparent";
    },
    { once: true }
  );

  // Fallback if transitionend never fires.
  window.setTimeout(() => {
    if (document.getElementById("splash")) {
      elem.remove();
      document.body.style.background = "transparent";
    }
  }, 700);
}
