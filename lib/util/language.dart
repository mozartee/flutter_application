import 'package:get/route_manager.dart';

class LanguageKey {
  static const String chinese = 'chinese';
  static const String english = 'english';

  static const String signin = 'signin';
  static const String signup = 'signup';

  static const String signinmessage = 'signinmessage';
  static const String signinnoaccount = 'signinnoaccount';
}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LanguageKey.chinese: 'Chinese',
          LanguageKey.english: 'English',
          LanguageKey.signin: 'Get Started',
          LanguageKey.signup: 'Sign Up',
          LanguageKey.signinmessage: 'We are here to make your holiday easier',
          LanguageKey.signinnoaccount: 'Do not have a account? ',
        },
        'zh_CN': {
          LanguageKey.chinese: '中文',
          LanguageKey.english: '英语',
          LanguageKey.signin: '登 录',
          LanguageKey.signup: '注 册',
          LanguageKey.signinmessage: '我们将为您打造一个快乐的假期，尽情放松吧！',
          LanguageKey.signinnoaccount: '没有账号? ',
        },
      };
}
