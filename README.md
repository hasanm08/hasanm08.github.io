# hasanm08 — portfolio (Flutter Web)

Personal portfolio and CV site built with **Flutter for the web**. It ships as a static site on **GitHub Pages**, with responsive layouts, smooth routing, and bilingual content.

**Live site:** [https://hasanm08.github.io](https://hasanm08.github.io)

## Highlights

- **Responsive shell** — dedicated mobile and desktop experiences with shared content.
- **Routing** — [`go_router`](https://pub.dev/packages/go_router) with animated page transitions; sections include About, Projects, Contact, and More.
- **Theme** — light, dark, and system appearance, persisted locally.
- **Localization** — English and Persian (Farsi), with locale persistence.
- **Polished UI** — custom typography (Pacifico, Exo 2, Kalame), animations, and interactive components tailored for a portfolio.

## Tech stack

| Area        | Details |
|------------|---------|
| Framework  | Flutter (SDK ≥ 3.3), Material 3 |
| Web        | `flutter build web` (default CanvasKit / JS pipeline; not SkWasm on Pages) |
| State      | `provider` (`AppSettings` for theme and locale) |
| Navigation | `go_router` |
| Storage    | `shared_preferences` for theme and language |
| Other      | `url_launcher`, `intl`, `web` |

## Run locally

Prerequisites: [Flutter](https://docs.flutter.dev/get-started/install) with web support enabled.

```bash
flutter config --enable-web
flutter pub get
flutter run -d chrome
```

Release build (matches CI):

```bash
flutter build web
```

To preview the production build locally, serve `build/web` with any static file server (for example `python3 -m http.server` from that directory).

## Deploy (GitHub Pages)

Deployment is automated in [`.github/workflows/flutter github pages.yml`](.github/workflows/flutter%20github%20pages.yml):

- **Trigger:** push to `source-code`, pull requests against `source-code`, or manual **workflow_dispatch** on `source-code`.
- **Output:** static assets are published to the **`gh-pages`** branch (via [peaceiris/actions-gh-pages](https://github.com/peaceiris/actions-gh-pages)).
- **SPA routing:** `index.html` is copied to `404.html` so deep links work on GitHub Pages.

Ensure GitHub Pages is configured to serve from the **`gh-pages`** branch (root).

## Repository layout (overview)

- `lib/main.dart` — app bootstrap, `GoRouter`, localization delegates, theme wiring.
- `lib/UI/Pages/WebApp/` — section pages and shell (`web_root`, `mobile_page`).
- `lib/theme/` — light and dark `ThemeData`.
- `lib/l10n/` — custom `AppLocalizations` (EN / FA).
- `lib/providers/` — persisted `AppSettings`.
- `assets/` — images, fonts, animations.

## Version

Current package version: **2.1.0** (see `pubspec.yaml`).

---

Built and maintained as an open showcase of Flutter Web for a personal portfolio.
