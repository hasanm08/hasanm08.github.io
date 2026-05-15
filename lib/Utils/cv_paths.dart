const cvRelativePath = '/files/May2026-WorkCv.pdf';
const cvFileName = 'May2026-WorkCv.pdf';

String cvAbsoluteUrl() => Uri.base.resolve(cvRelativePath).toString();
