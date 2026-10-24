class CvFile {
  const CvFile({required this.relativePath, required this.fileName});

  final String relativePath;
  final String fileName;

  String absoluteUrl() => Uri.base.resolve(relativePath).toString();
}

const englishCv = CvFile(
  relativePath: '/files/Amirhassan_Amirmahani_CV_English.pdf',
  fileName: 'Amirhassan_Amirmahani_CV_English.pdf',
);

const farsiCv = CvFile(
  relativePath: '/files/Amirhassan_Amirmahani_CV_Farsi.pdf',
  fileName: 'Amirhassan_Amirmahani_CV_Farsi.pdf',
);
