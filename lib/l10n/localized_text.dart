import 'package:flutter/material.dart';

/// Bilingual copy for longer content (e.g. project descriptions).
class LocalizedText {
  const LocalizedText(this.en, this.fa);

  final String en;
  final String fa;

  String resolve(Locale locale) =>
      locale.languageCode == 'fa' ? fa : en;
}
