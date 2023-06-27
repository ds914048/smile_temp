import 'package:flutter/material.dart';

abstract class BaseColors{
  //theme color
  MaterialColor get colorPrimary;
  MaterialColor get colorAccent;
  //text color
  Color get colorPrimaryText;
  Color get colorSecondaryText;
  //chips color
  Color get catChipColor;
  Color get castChipColor;
  //extra color
  Color get colorWhite;
  Color get colorBlack;

  // Primary Button:
  // Background: #FFFFFF (Pearl White)
  // Text: #87CEEB (Sky Blue)
  // Hover/Active: #98FB98 (Mint Green)
  Color get primaryButton;
  Color get primaryButtonText;
  Color get primaryActiveButton;

  // Secondary Button:
  // Background: #98FB98 (Mint Green)
  // Text: #FFFFFF (Pearl White)
  // Hover/Active: #87CEEB (Sky Blue)
  Color get secondaryButton;
  Color get secondaryButtonText;
  Color get secondaryActiveButton;

  // Navigation Bar:
  // Background: #FFFFFF (Pearl White)
  // Text: #87CEEB (Sky Blue)
  // Active/Selected: #E6E6FA (Lavender)
  Color get navigationBarBackground;
  Color get navigationBarText;
  Color get navigationBarActive;


  // Text Body:
  // Main Text: #333333 (Charcoal Gray)
  // Subtext: #CCCCCC (Light Gray)

  // Background:
  // Main Background: #FFFFFF (Pearl White)
  // Secondary Background: #F5F5F5 (Light Gray)
  Color get primaryBackground;
  Color get secondaryBackground;

  // Accent Color:
  // #FFFF99 (Pale Yellow)
  Color get accent;

  // Divider Lines:
  // #CCCCCC (Light Gray)
  Color get dividerLines;

  // Call-to-Action:
  // Background: #87CEEB (Sky Blue)
  // Text: #FFFFFF (Pearl White)
  Color get ctaBackground;
  Color get ctaText;


  // Alerts/Notifications:
  // Background: #E6E6FA (Lavender)
  // Text: #333333 (Charcoal Gray)

  // Icons:
  // Stroke Color: #333333 (Charcoal Gray)
  // Fill Color: #FFFFFF (Pearl White)


}