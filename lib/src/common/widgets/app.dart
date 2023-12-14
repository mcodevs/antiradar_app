import 'package:antiradar/main.dart';
import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/common/configurations/app_themes.dart';
import 'package:antiradar/src/common/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
          routes: AppRoutes.routes,
          initialRoute: ($storage.getBool('isLogged') ?? false) ? AppRoutes.map : AppRoutes.intro,
          locale: const Locale('uz'),
        );
      },
    );
  }
}
