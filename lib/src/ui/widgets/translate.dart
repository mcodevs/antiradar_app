import 'package:antiradar/src/common/localization/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Translate extends StatelessWidget {
  const Translate({
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, AppLocalizations l10n) builder;

  @override
  Widget build(BuildContext context) => builder(
        context,
        AppLocalizations.of(context),
      );
}

String translate({
  required BuildContext context,
  required String Function(AppLocalizations l10n) select,
}) => select(AppLocalizations.of(context));
