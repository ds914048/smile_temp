import 'package:flutter/material.dart';

import 'BaseColors.dart';

class AppColors implements BaseColors{
  final Map<int, Color> _primary =
  {
    50:const Color.fromRGBO(235, 224, 198, 0.1),
    100:const Color.fromRGBO(235, 224, 198, 0.2),
    200:const Color.fromRGBO(235, 224, 198, 0.3),
    300:const Color.fromRGBO(235, 224, 198, 0.4),
    400:const Color.fromRGBO(235, 224, 198, 0.5),
    500:const Color.fromRGBO(235, 224, 198, 0.6),
    600:const Color.fromRGBO(235, 224, 198, 0.7),
    700:const Color.fromRGBO(235, 224, 198, 0.8),
    800:const Color.fromRGBO(235, 224, 198, 0.9),
    900:const Color.fromRGBO(235, 224, 198, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xff1686ce,_primary);

  @override
  Color get colorPrimaryText => const Color(0xff49ABFF);

  @override
  Color get colorSecondaryText => const Color(0xff3593FF);

  @override
  Color get colorWhite => const Color(0xffffffff);

  @override
  Color get colorBlack => const Color(0xff000000);

  @override
  Color get castChipColor => Colors.deepOrangeAccent;

  @override
  Color get catChipColor => Colors.indigoAccent;

  @override
  Color get accent => const Color(0xffFFFF99);

  @override
  Color get ctaBackground => const Color(0xff87CEEB);

  @override
  Color get ctaText => const Color(0xffFFFFFF);

  @override
  Color get dividerLines => const Color(0xffCCCCCC);

  @override
  Color get navigationBarActive => const Color(0xffFFFFFF);

  @override
  Color get navigationBarBackground => const Color(0xff87CEEB);

  @override
  Color get navigationBarText => const Color(0xffE6E6FA);

  @override
  Color get primaryBackground => const Color(0xffFFFFFF);

  @override
  Color get secondaryBackground => const Color(0xffF5F5F5);

  @override
  Color get primaryButton => const Color(0xffFFFFFF);

  @override
  Color get primaryButtonText => const Color(0xff87CEEB);

  @override
  Color get primaryActiveButton => const Color(0xff98FB98);

  @override
  Color get secondaryButton => const Color(0xff98FB98);

  @override
  Color get secondaryButtonText => const Color(0xffFFFFFF);

  @override
  Color get secondaryActiveButton => const Color(0xff87CEEB);

}