import '../constants/app_contants.dart';

extension StringExtensions on String {
  String checkLength(int limit) {
    if (length > limit) {
      return substring(0, limit) + "...";
    } else {
      return this;
    }
  }

  String? get isValidEmail => contains(RegExp(ApplicationConstants.EMAIL_REGIEX)) ? null : "Email does not valid";

  bool get isValidEmails => RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);
  
  bool get isValidUrl => RegExp(ApplicationConstants.URL_REGEX).hasMatch(this);

  String get simpleDate {
    var date = DateTime.parse(this);
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }
}
