class FormatHelper {
  static String toCapitalize(String text) {
    if (text.isEmpty) {
      return '';
    }
    return text
        .split(" ")
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }
}
