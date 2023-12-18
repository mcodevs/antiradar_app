import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/common/configurations/app_themes.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  void run() => runApp(this);

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
          initialRoute: LocalDBService.initialRoute(
            home: AppRoutes.map,
            intro: AppRoutes.intro,
          ),
          locale: const Locale('uz'),
        );
      },
    );
  }
}
