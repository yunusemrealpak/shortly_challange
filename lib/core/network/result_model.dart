class ResultModel{
  int? resultCode;
  dynamic resultData;

  ResultModel({this.resultCode, this.resultData});

  ResultModel.fromJson(Map<String, dynamic> json){
    resultCode = json["resultCode"];
    resultData = json["resultData"];
  }
}