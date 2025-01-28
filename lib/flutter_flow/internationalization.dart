import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '5anup5c5': {
      'en': 'Home',
      'fr': 'Accueil',
    },
    'khnk4azm': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // AuthenticationPage
  {
    'qqf7ck6y': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'za9luag1': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    'kiakxk28': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'bmlcdyyy': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    '06b28qjk': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'qa90r2nc': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    'ywjxsdsc': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
    },
    'b1kyqp6w': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    'qcx8o2ix': {
      'en': 'Name',
      'fr': 'Nom',
    },
    '2gussxyg': {
      'en': 'Surname',
      'fr': 'Nom de famille',
    },
    '414kefl4': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'k8977dui': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'n9x3wa32': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
    },
    'o2boab28': {
      'en': 'Option 1',
      'fr': '',
    },
    'mja684q2': {
      'en': 'Option 2',
      'fr': '',
    },
    '3lmpih7o': {
      'en': 'Option 3',
      'fr': '',
    },
    'h0pznnal': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
    },
    'eu2ezf5j': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ProfilPage
  {
    'zymchlso': {
      'en': 'Your Name',
      'fr': '',
    },
    'n16nglez': {
      'en': 'Your City',
      'fr': '',
    },
    'x25td5ia': {
      'en': 'Save Changes',
      'fr': 'Sauver',
    },
    'xr25iu9q': {
      'en': 'Disconnect',
      'fr': 'Se déconnecter',
    },
  },
  // TerrainListPage
  {
    'x0ag4agd': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ChoosePage
  {
    'm2wtjh88': {
      'en': 'Select...',
      'fr': 'Type',
    },
    'nc60q4y1': {
      'en': 'Search...',
      'fr': '',
    },
    'n1qusieu': {
      'en': 'Option 1',
      'fr': '',
    },
    'zg2nxpek': {
      'en': 'Option 2',
      'fr': '',
    },
    'tihdqzpv': {
      'en': 'Option 3',
      'fr': '',
    },
    'm4we5aeg': {
      'en': 'Select...',
      'fr': 'Terrain',
    },
    '8gutg5so': {
      'en': 'Search...',
      'fr': '',
    },
    'n5yhombr': {
      'en': 'Option 1',
      'fr': '',
    },
    'rj3scldt': {
      'en': 'Option 2',
      'fr': '',
    },
    '9oq4wf6n': {
      'en': 'Option 3',
      'fr': '',
    },
    '1hs1kg9o': {
      'en': 'Book',
      'fr': 'Réserver',
    },
    'hzgm7ryt': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ListClubPage
  {
    '0bding6p': {
      'en': 'Home',
      'fr': 'Réserver',
    },
    'a9a25cym': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ChoosePageCopy
  {
    'pk322n8w': {
      'en': 'Page Title',
      'fr': 'Page Title',
    },
    'nj1k7tph': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ClubCard
  {
    'ed456l77': {
      'en': 'No-Code Platform Design',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '9mrrmjvb': {
      'en': '',
      'fr': '',
    },
    'zm4m1ha9': {
      'en': '',
      'fr': '',
    },
    '6th1v1yx': {
      'en': '',
      'fr': '',
    },
    'xt8w2s5u': {
      'en': '',
      'fr': '',
    },
    'upme5a2w': {
      'en': '',
      'fr': '',
    },
    'r9ngcgr6': {
      'en': '',
      'fr': '',
    },
    '27207xjp': {
      'en': '',
      'fr': '',
    },
    '0mjgsxy2': {
      'en': '',
      'fr': '',
    },
    'qen1xgbh': {
      'en': '',
      'fr': '',
    },
    'wsejtf1v': {
      'en': '',
      'fr': '',
    },
    'hjyn01rk': {
      'en': '',
      'fr': '',
    },
    'gsvuh5ub': {
      'en': '',
      'fr': '',
    },
    'qq3xtz2g': {
      'en': '',
      'fr': '',
    },
    'uc1uys9s': {
      'en': '',
      'fr': '',
    },
    'gyfeg4o9': {
      'en': '',
      'fr': '',
    },
    '3znfzkk0': {
      'en': '',
      'fr': '',
    },
    'taimvcxh': {
      'en': '',
      'fr': '',
    },
    'ddc1p86j': {
      'en': '',
      'fr': '',
    },
    'q8t95voj': {
      'en': '',
      'fr': '',
    },
    '25ljh78g': {
      'en': '',
      'fr': '',
    },
    'dxt8zu2d': {
      'en': '',
      'fr': '',
    },
    '963jo455': {
      'en': '',
      'fr': '',
    },
    'suo5v9q3': {
      'en': '',
      'fr': '',
    },
    '9z8vbznu': {
      'en': '',
      'fr': '',
    },
    'exvykaiy': {
      'en': '',
      'fr': '',
    },
    'jjas4cmb': {
      'en': '',
      'fr': '',
    },
    'x5hwjn26': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
