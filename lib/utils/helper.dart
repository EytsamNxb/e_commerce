class Helper {
    // Helper function to validate and convert String fields
  static String? validateString(Map<String, dynamic> json, String key) {
    var value = json[key];
    if (value != null && value is String) {
      return value;
    } else if (value ==  null) {
      return null;
    }
    // else if (value != null && value is int) {
    //   return value.toString(); // Convert int to String if needed
    // } 
    else {
      throw FormatException('Field "$key" is either missing or has an invalid type. Record Id ${json["id"]}');
    }
  }

  // Helper function to validate and convert int fields
  static int? validateInt(Map<String, dynamic> json, String key) {
    var value = json[key];
    if (value != null && value is int) {
      return value;
    } else {
      throw FormatException('Field "$key" is either missing or has an invalid type.');
    }
  }

    // Helper method to validate doubles
  static double? validateDouble(Map<String, dynamic> json, String key) {
    if (json[key] is double) {
      return json[key];
    } else if (json[key] is String) {
      return double.tryParse(json[key]);
    } else if (json[key] is int) {
      return json[key].toDouble();
    } else {
      throw FormatException('Field "$key" is either missing or has an invalid type.');
    }
  }
}