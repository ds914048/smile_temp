import 'package:flutter/cupertino.dart';
import 'strings/HindiStrings.dart';
import 'strings/Strings.dart';
import 'text_styles/app_text_styles.dart';

import 'colors/AppColors.dart';
import 'dimentions/AppDimension.dart';
import 'strings/EnglishStrings.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'hi':
        return HindiStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppTextStyles get textStyle {
    return AppTextStyles();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}