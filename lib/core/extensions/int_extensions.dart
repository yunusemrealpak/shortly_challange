extension IntExtensions on int {
  String get errorMessage {
    switch (this) {
      case 1:
        return "No URL specified";
      case 2:
        return "Invalid URL submitted";
      case 3:
        return "Rate limit reached. Wait a second and try again";
      case 4:
        return "IP-Address has been blocked because of violating our terms of service";
      case 5:
        return "shrtcode code (slug) already taken/in use";
      case 6:
        return "Unknown error";
      case 7:
        return "No code specified";
      case 8:
        return "Invalid code submitted";
      case 9:
        return "Missing required parameters";
      default:
        return "";
    }
  }
}
