import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common/utils/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: Locale('vi', 'VN'),
      fallbackLocale: Locale('en', 'US'),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    ),
  );
}
