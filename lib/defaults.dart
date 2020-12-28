///=======================================
///              ENDPOINTS
///=======================================

const BASE_URL = 'https://api.docusign.com';

///=======================================
///                IMAGES
///=======================================

const kAppIconTransparent = 'assets/app_icon_transparent.png';
const kAppIconWhite = 'assets/app_icon_white.png';
const kAppIconWhiteBg = 'assets/app_icon_white_bg.png';
const kMyFscTransparent = 'assets/my_fsc_transparent.png';
const kMyFscWhiteBg = 'assets/my_fsc_white_bg.png';
const kCongrats = 'assets/congrats.png';
const kSorry = 'assets/sorry.png';

///=======================================
///               STRINGS
///=======================================

const kAppTitle = 'myFSC Certification';
const kAppSubTitle = 'Docusign-FSC Hackathon Project';

///=======================================
///              WEB LINKS
///=======================================

///=======================================
///               MATRICES
///=======================================

const kMatrixAlloc = {
  'PP': mPP,
  'SP': mSP,
  'TDwPP': mTDwPP,
  'TD/PP': mTDPP,
};

const kLevel2EvalMapping = {
  'TR/S': 0,
  'TRwS': 1,
  'PC': 2,
  'PCT': 3,
};

const kLevel3EvalMapping = {
  'CW': 0,
  'REC': 1,
  'MLT': 2,
  'OUT': 3,
  'LAB': 4,
};

///=======================================
///               MATRICES
///=======================================

const mPP = [
  [true, true, true, true, true],
  [true, true, false, false, true],
  [true, true, true, true, true],
  [false, false, false, false, false]
];

const mSP = [
  [true, true, true, true, true],
  [false, false, false, false, true],
  [true, true, true, true, true],
  [false, false, false, false, false]
];

const mTDwPP = [
  [true, true, true, true, true],
  [true, true, true, true, true],
  [true, true, true, true, true],
  [false, false, false, false, false]
];

const mTDPP = [
  [true, true, true, true, true],
  [true, true, true, true, true],
  [false, false, false, false, false],
  [false, false, false, false, false]
];
