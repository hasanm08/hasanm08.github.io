const cvRelativePath = '/files/Amirhassan_Amirmahani_CV_July2026.pdf';
const cvFileName = 'Amirhassan_Amirmahani_CV_July2026.pdf';

String cvAbsoluteUrl() => Uri.base.resolve(cvRelativePath).toString();
