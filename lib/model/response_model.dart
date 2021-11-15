import 'package:grisoft_url_shortening/model/shortly_link.dart';

class ResponseModel {
  int? errorCode;
  bool? hasError;
  String? errorMessage;
  ShortlyLink? link;
  
  ResponseModel({this.errorCode, this.hasError = false, this.errorMessage, this.link});
}