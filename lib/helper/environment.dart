class Environment {
  static String? token;
  static String? expiration;
  static Map<String, String> apiHeader = {
    "content-type": "application/json",
    "Authorization": "Bearer $token"
  };
  static Map<String, String> apiHeaderWithoutToken = {
    "content-type": "application/json"
  };

  static const String baseUri = 'https://task.pdpyazilim.com/api/';
}
// decimal regex [/\d+\.?\d*/]
