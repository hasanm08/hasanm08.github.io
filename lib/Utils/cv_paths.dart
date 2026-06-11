const cvRelativePath = '/files/Jun2026-WorkCv.pdf';
const cvFileName = 'Jun2026-WorkCv.pdf';

String cvAbsoluteUrl() => Uri.base.resolve(cvRelativePath).toString();
