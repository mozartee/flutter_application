import 'package:flustars_flutter3/flustars_flutter3.dart' show SpUtil;

class PageKey {
  // 闪图
  static const splash = "splash_key";
  // 登录
  static const login = 'login_key';
}

class TokenKey {
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
}

class ResponseKey {
  static const data = 'data';
  static const message = 'message';
  static const code = 'code';
}

class AppThemeKey {
  /// 主题
  static const String theme = 'appTheme';
}

class AppLanguageKey {
  /// 语言
  static const String language = 'language';
}

class Share {
  /// 第一次使用
  static bool? notFirstDisplay() => SpUtil.getBool(PageKey.splash);

  /// 当前是否登录
  static bool? login() => SpUtil.getBool(PageKey.login);
}
