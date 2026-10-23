import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// Localization delegates for the app's `CupertinoApp`s.
///
/// [AppLocalizations.localizationsDelegates] ships the Cupertino delegate from
/// `flutter_localizations`, which implements the legacy
/// `package:flutter/cupertino.dart` types. The widgets in this app come from
/// `package:cupertino_ui`, so they look up a different `CupertinoLocalizations`
/// type. Without a delegate for that type, `CupertinoApp` only provides the
/// English-only default, and things like `showCupertinoDialog` throw for every
/// other locale.
const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates =
    <LocalizationsDelegate<dynamic>>[
      ...AppLocalizations.localizationsDelegates,
      _CupertinoLocalizationsDelegate(),
    ];

/// Provides `cupertino_ui` localizations for every supported locale.
///
/// Locales not covered by [GlobalCupertinoLocalizations] fall back to English
/// instead of leaving `CupertinoLocalizations` unavailable.
class _CupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    if (GlobalCupertinoLocalizations.delegate.isSupported(locale)) {
      return GlobalCupertinoLocalizations.delegate.load(locale);
    }
    return DefaultCupertinoLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(_CupertinoLocalizationsDelegate oldDelegate) => false;
}
