import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      backgroundColor: AppColors.colorWhite,
      centerTitle: false,
      actionsIconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.primaryColor,
    backgroundColor: Colors.transparent,
    splashColor: AppColors.primaryColor,
    buttonColor: AppColors.primaryColor,
    errorColor: AppColors.colorRed,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: AppFontWeight.medium),
      bodyText1: TextStyle(fontSize: 14, fontWeight: AppFontWeight.medium),
      bodyText2: TextStyle(fontSize: 14, fontWeight: AppFontWeight.regular),
      subtitle1: TextStyle(fontSize: 12, fontWeight: AppFontWeight.regular),
      button: TextStyle(fontSize: 14, fontWeight: AppFontWeight.medium),
      headline2: TextStyle(fontSize: 22, fontWeight: AppFontWeight.light),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      backgroundColor: AppColors.colorBlack13,
      centerTitle: false,
      actionsIconTheme: IconThemeData(
        color: AppColors.colorWhite,
        size: 24,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.primaryColor,
    backgroundColor: Colors.transparent,
    splashColor: AppColors.primaryColor,
    buttonColor: AppColors.primaryColor,
    errorColor: AppColors.colorRed,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: AppFontWeight.medium),
      bodyText1: TextStyle(fontSize: 14, fontWeight: AppFontWeight.medium),
      bodyText2: TextStyle(fontSize: 14, fontWeight: AppFontWeight.regular),
      subtitle1: TextStyle(fontSize: 12, fontWeight: AppFontWeight.regular),
      button: TextStyle(fontSize: 14, fontWeight: AppFontWeight.medium),
      headline2: TextStyle(fontSize: 22, fontWeight: AppFontWeight.light),
    ),
  );
}

class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight ultraBold = FontWeight.w900;
}

class AppStyle {
  AppStyle({this.themeData});

  factory AppStyle.of(BuildContext context) {
    return AppStyle(themeData: Theme.of(context));
  }

  ThemeData themeData;

  TextStyle defaultTextStyle({Color color, double size}) {
    return themeData.textTheme.bodyText2.copyWith(
      color: color ?? AppColors.colorBlack13,
      fontSize: size ?? 14.0,
      fontFamily: 'SourceSans',
    );
  }

  TextStyle defaultTextBoldStyle({Color color, double size}) {
    return themeData.textTheme.bodyText1.copyWith(
      color: color ?? AppColors.colorBlack13,
      fontSize: size ?? 14.0,
      fontFamily: 'SourceSans',
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle defaultTextLineThrough({Color color, double size}) {
    return themeData.textTheme.bodyText1.copyWith(
      color: color ?? AppColors.colorBlack13,
      fontSize: size ?? 14.0,
      decoration: TextDecoration.lineThrough,
      fontFamily: 'SourceSans',
    );
  }

  TextStyle defaultTextFieldStyle() {
    return themeData.textTheme.bodyText2.copyWith(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: AppFontWeight.light,
      fontFamily: 'SourceSans',
    );
  }

  TextStyle textStyleUnderline({Color color, double size}) {
    return themeData.textTheme.bodyText2.copyWith(
      color: color ?? Colors.black,
      fontWeight: AppFontWeight.light,
      fontSize: size ?? 14.0,
      decoration: TextDecoration.underline,
      fontFamily: 'SourceSans',
    );
  }

  TextStyle textStyleButton({Color color, double size}) {
    return themeData.textTheme.button.copyWith(
      color: color ?? Colors.black,
      fontWeight: AppFontWeight.regular,
      fontSize: size ?? 12.0,
      fontFamily: 'SourceSans',
    );
  }

  TextStyle textStyleSection({Color color, double size}) {
    return themeData.textTheme.headline2;
  }
}
