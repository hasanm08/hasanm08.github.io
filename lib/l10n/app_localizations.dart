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
  String get navMore => isFa ? 'بیشتر' : 'More';
  String get madeWith => isFa ? 'ساخته‌شده با' : 'Made with';
  String get themeTooltip => isFa ? 'حالت نمایش' : 'Appearance';
  String get languageTooltip => isFa ? 'زبان' : 'Language';
  String get themeSystem => isFa ? 'هماهنگ با سیستم' : 'Match system';
  String get themeLight => isFa ? 'روشن' : 'Light';
  String get themeDark => isFa ? 'تاریک' : 'Dark';

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
