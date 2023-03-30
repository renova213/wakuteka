String formatCurrency(String value) {
  int length = value.length;

  // Add leading zeros to make the length a multiple of 3
  while (length % 3 != 0) {
    value = "0$value";
    length++;
  }

  // Split the string into chunks of three digits each
  List<String> chunks = [];
  for (int i = 0; i < length; i += 3) {
    String chunk = value.substring(i, i + 3);
    chunks.add(chunk);
  }

  // Join the chunks with periods and remove leading zeros
  String formattedValue =
      chunks.join(".").replaceFirst(RegExp("^0+(?!\$)"), "");
  return "Rp$formattedValue";
}
