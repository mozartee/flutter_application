import 'package:get/route_manager.dart';

class LanguageKey {
  static const String chinese = 'chinese';
  static const String english = 'english';

  static const String splashbutton = 'splashbutton';

  static const String tabbarhome = 'tabbarhome';
  static const String tabbarmine = 'tabbarmine';

  static const String signin = 'signin';
  static const String signup = 'signup';

  static const String signinmessage = 'signinmessage';
  static const String signinnoaccount = 'signinnoaccount';

  static const String signupmessage = 'signupmessage';
  static const String accounthint = 'accounthint';
  static const String pwdhint = 'pwdhint';

  static const String home = 'home';

  static const String mine = 'mine';
  static const String setting = 'setting';

  static const String themechange = 'themechange';
  static const String themechangedark = 'themechangedark';
  static const String themechangelight = 'themechangelight';
  static const String themechangesys = 'themechangesys';

  static const String languagechange = 'languagechange';
  static const String languagechangecn = 'languagechangecn';
  static const String languagechangeen = 'languagechangeen';
}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LanguageKey.chinese: 'Chinese',
          LanguageKey.english: 'English',
          LanguageKey.splashbutton: 'Get Started',
          LanguageKey.tabbarhome: 'Home',
          LanguageKey.tabbarmine: 'Mine',
          LanguageKey.signin: 'Get Started',
          LanguageKey.signup: 'Sign Up',
          LanguageKey.signinmessage: 'We are here to make your holiday easier',
          LanguageKey.signinnoaccount: 'Do not have a account? ',
          LanguageKey.signupmessage: 'Put your account ',
          LanguageKey.accounthint: 'account',
          LanguageKey.pwdhint: 'password',
          LanguageKey.home: 'Home',
          LanguageKey.mine: 'Mine',
          LanguageKey.setting: 'Setting',
          LanguageKey.themechange: 'Theme',
          LanguageKey.themechangedark: 'Dark Mode',
          LanguageKey.themechangelight: 'Light Mode',
          LanguageKey.themechangesys: 'System Mode',
          LanguageKey.languagechange: 'Language',
          LanguageKey.languagechangecn: 'Chinese',
          LanguageKey.languagechangeen: 'English',
        },
        'zh_CN': {
          LanguageKey.chinese: '中文',
          LanguageKey.english: '英语',
          LanguageKey.splashbutton: '直接进入',
          LanguageKey.tabbarhome: '首页',
          LanguageKey.tabbarmine: '我的',
          LanguageKey.signin: '登 录',
          LanguageKey.signup: '注 册',
          LanguageKey.signinmessage: '我们将为您打造一个快乐的假期，尽情放松吧！',
          LanguageKey.signinnoaccount: '没有账号? ',
          LanguageKey.signupmessage: '请输入账号',
          LanguageKey.accounthint: '账号',
          LanguageKey.pwdhint: '密码',
          LanguageKey.home: '首页',
          LanguageKey.mine: '我的',
          LanguageKey.setting: '设置',
          LanguageKey.themechange: '主题',
          LanguageKey.themechangedark: '深色模式',
          LanguageKey.themechangelight: '普通模式',
          LanguageKey.themechangesys: '跟随系统',
          LanguageKey.languagechange: '语言',
          LanguageKey.languagechangecn: '中文',
          LanguageKey.languagechangeen: '英语',
        },
      };
}
