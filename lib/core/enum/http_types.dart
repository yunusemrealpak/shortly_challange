enum HttpTypes {
  GET,
  POST,
}

extension NetworkTypeExtensions on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
      case HttpTypes.POST:
        return "POST";
      default:
        throw "ERROR TYPE";
    }
  }
}