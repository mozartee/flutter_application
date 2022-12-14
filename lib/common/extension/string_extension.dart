extension StringExtension on String? {
  String get nullSafe => this ?? '';
}
