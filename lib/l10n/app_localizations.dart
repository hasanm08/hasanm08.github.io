import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  bool get isFa => locale.languageCode == 'fa';

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('fa'),
  ];

  // —— Shell ——
  String get navAbout => isFa ? 'درباره' : 'About';
  String get navContact => isFa ? 'تماس' : 'Contact';
  String get navProjects => isFa ? 'پروژه‌ها' : 'Projects';
  String get navPackages => isFa ? 'پکیج‌ها' : 'Packages';
  String get navMore => isFa ? 'بیشتر' : 'More';
  String get madeWith => isFa ? 'ساخته‌شده با' : 'Made with';
  String get themeTooltip => isFa ? 'حالت نمایش' : 'Appearance';
  String get languageTooltip => isFa ? 'زبان' : 'Language';

  // —— Showcase (flow_showcase) ——
  String get showcaseNext => isFa ? 'بعدی' : 'Next';
  String get showcaseSkip => isFa ? 'رد کردن همه' : 'Skip All';
  String get showcaseDefaultTitle => isFa ? 'راهنما' : 'Tour';
  String get showcaseDefaultContent =>
      isFa ? 'بخشی از نمونه‌کار' : 'Part of the portfolio';

  String get showcaseNavAboutTitle => isFa ? 'درباره من' : 'About me';
  String get showcaseNavAboutContent => isFa
      ? 'بیو، تجربه و مهارت‌ها — از اینجا شروع کنید.'
      : 'Bio, experience, and skills — start here.';

  String get showcaseNavContactTitle => isFa ? 'تماس' : 'Get in touch';
  String get showcaseNavContactContent => isFa
      ? 'تلفن، ایمیل و شبکه‌های اجتماعی در یک جا.'
      : 'Phone, email, and social links in one place.';

  String get showcaseNavProjectsTitle => isFa ? 'پروژه‌ها' : 'Projects';
  String get showcaseNavProjectsContent => isFa
      ? 'اپ‌ها و پروژه‌هایی که ساخته‌ام.'
      : 'Apps and side projects I have built.';

  String get showcaseNavPackagesTitle => isFa ? 'پکیج‌ها' : 'Packages';
  String get showcaseNavPackagesContent => isFa
      ? 'پکیج‌های فلاتر و دارت منتشرشده در pub.dev.'
      : 'Flutter and Dart packages published on pub.dev.';

  String get showcaseNavMoreTitle => isFa ? 'بیشتر' : 'More';
  String get showcaseNavMoreContent => isFa
      ? 'رزومه، کد منبع و لینک‌های مفید برای توسعه‌دهندگان.'
      : 'Resume, source code, and handy developer links.';

  String get showcaseThemeTitle => isFa ? 'حالت نمایش' : 'Appearance';
  String get showcaseThemeContent => isFa
      ? 'بین حالت روشن، تاریک و هماهنگ با سیستم جابه‌جا شوید.'
      : 'Switch between light, dark, and system theme.';

  String get showcaseLanguageTitle => isFa ? 'زبان' : 'Language';
  String get showcaseLanguageContent => isFa
      ? 'بین انگلیسی و فارسی تغییر دهید.'
      : 'Toggle between English and فارسی.';

  String get showcaseContentTitle => isFa ? 'محتوای اصلی' : 'Main view';
  String get showcaseContentContent => isFa
      ? 'بخشی که از منو انتخاب می‌کنید اینجا نمایش داده می‌شود.'
      : 'The section you pick from the menu appears here.';
  String get themeSystem => isFa ? 'هماهنگ با سیستم' : 'Match system';
  String get themeLight => isFa ? 'روشن' : 'Light';
  String get themeDark => isFa ? 'تاریک' : 'Dark';

  // —— Not found (flow_routing) ——
  String get notFoundTitle => isFa ? 'صفحه پیدا نشد' : 'Page not found';
  String get notFoundSubtitle => isFa
      ? 'این مسیر در نمونه‌کار من تعریف نشده است؛ شاید لینک قدیمی باشد یا اشتباه تایپ شده باشد.'
      : 'This path is not part of my portfolio — the link may be outdated or mistyped.';
  String get notFoundPathLabel => isFa ? 'آدرس درخواستی' : 'Requested path';
  String get notFoundHomeCta => isFa ? 'رفتن به خانه' : 'Back to home';
  String get notFoundGoBack => isFa ? 'برگشت' : 'Go back';

  // —— About ——
  String get yearsSuffix => isFa ? 'سال' : 'years';
  String get ageLabel => isFa ? 'سن' : 'Age';
  String get countryLabel => isFa ? 'کشور' : 'Country';
  String get cityLabel => isFa ? 'شهر' : 'City';
  String get educationLabel => isFa ? 'تحصیلات' : 'Education';
  String get juliaAgeLabel => isFa ? 'تجربه جولیا' : 'Julia experience';
  String get flutterAgeLabel => isFa ? 'تجربه فلاتر' : 'Flutter experience';
  String get arduinoAgeLabel => isFa ? 'تجربه آردوینو' : 'Arduino experience';
  String get pythonAgeLabel => isFa ? 'تجربه پایتون' : 'Python experience';
  String get csharpAgeLabel => isFa ? 'تجربه سی‌شارپ' : 'C# experience';

  String get countryValue => isFa ? 'ایران' : 'Iran';
  String get cityValue => isFa ? 'کرمان' : 'Kerman';
  String get educationValue => isFa
      ? 'کارشناسی ارشد هوش مصنوعی و رباتیک، دانشگاه شیراز'
      : 'M.Sc. Artificial Intelligence & Robotics, Shiraz University';

  // —— Contact ——
  String get contactCall => isFa ? 'تماس تلفنی' : 'Make a call';
  String get contactGmail => 'Gmail';
  String get contactInstagram => isFa ? 'اینستاگرام' : 'Instagram';
  String get contactTelegram => isFa ? 'تلگرام' : 'Telegram';
  String get contactTwitter => 'Twitter';
  String get contactWhatsapp => 'WhatsApp';
  String get contactGithub => 'GitHub';
  String get contactGitlab => 'GitLab';
  String get contactLinkedin => 'LinkedIn';
  String get contactStackoverflow => 'Stack Overflow';

  // —— More ——
  String get moreTitle => isFa ? 'بیشتر' : 'More';
  String get moreSubtitle => isFa
      ? 'میان‌برها، کد منبع و چند لینک مفید برای توسعه‌دهندگان.'
      : 'Jump around the site, open the source, or grab a few dev links.';
  String get moreResume => isFa ? 'رزومه' : 'Resume';
  String get moreViewCv => isFa ? 'مشاهدهٔ رزومه' : 'View CV';
  String get moreDownloadCv => isFa ? 'دانلود رزومه' : 'Download CV';
  String get moreJumpTo => isFa ? 'پرش به' : 'Jump to';
  String get moreThisSite => isFa ? 'این وب‌سایت' : 'This site';
  String get moreDevPicks => isFa ? 'پیشنهادهای توسعه' : 'Developer picks';
  String get moreSource => isFa ? 'کد منبع' : 'Source code';
  String get moreReportIssue => isFa ? 'گزارش مشکل' : 'Report issue';
  String get moreLiveSite => isFa ? 'نسخهٔ زنده' : 'Live site';
  String get moreFlutterDocs => isFa ? 'مستندات فلاتر' : 'Flutter docs';
  String get morePubDev => 'pub.dev';
  String get moreDartGuides => isFa ? 'راهنمای Dart' : 'Dart guides';
  String get moreFooter => isFa
      ? 'نسخهٔ نمونه‌کار ۲.۱.۰ · ساخته‌شده با Flutter'
      : 'Portfolio v2.1.0 · Built with Flutter';

  // —— Projects ——
  String get projectsTitle => isFa ? 'پروژه‌ها' : 'Projects';

  // —— Packages ——
  String get packagesTitle => isFa ? 'پکیج‌ها' : 'Packages';
  String get packagesWhatItDoes =>
      isFa ? 'قابلیت‌ها' : 'What it does';
  String get packagesUnderTheHood =>
      isFa ? 'زیرساخت' : 'Under the hood';
  String get associatedWithPrefix =>
      isFa ? 'همکاری با' : 'Associated with';
  String get skillsPrefix => isFa ? 'مهارت‌ها' : 'Skills';

  String linkLabel(String en) {
    if (!isFa) return en;
    return switch (en) {
      'Website' => 'وب‌سایت',
      'Google Play' => 'گوگل‌پلی',
      'App Store' => 'اپ‌استور',
      'GitHub' => 'گیت‌هاب',
      'PWA' => 'وب‌اپلیکیشن',
      'Cafe Bazaar' => 'کافه‌بازار',
      'Myket' => 'مایکت',
      'Sibapp' => 'سیب‌اپ',
      'Zaban.com' => 'Zaban.com',
      'pub.dev' => 'pub.dev',
      'Source' => 'سورس',
      _ => en,
    };
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales
          .any((l) => l.languageCode == locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final code = locale.languageCode == 'fa' ? 'fa' : 'en';
    return AppLocalizations(Locale(code));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
