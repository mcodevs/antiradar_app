import 'package:antiradar/main.dart';
import 'package:antiradar/src/common/configurations/app_themes.dart';
import 'package:antiradar/src/common/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui/pages/intro/intro_page.dart';
import '../../ui/pages/map/map_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: "Yo'lda",
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('uz'),
          home: child,
        );
      },
      child: Builder(
        builder: (context) {
          bool isLogged = $storage.getBool("isLogged") ?? false;
          return isLogged ? const MapScreen() : const IntroPage();
        },
      ),
    );
  }
}
