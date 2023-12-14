import 'package:antiradar/src/common/configurations/app_themes.dart';
import 'package:antiradar/src/common/localization/l10n/app_localizations.dart';
import 'package:antiradar/src/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
