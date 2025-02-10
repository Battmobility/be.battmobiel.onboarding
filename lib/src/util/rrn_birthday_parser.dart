final class RrnBirthdayParser {
  static DateTime? birthdayFromRrn(String rrn) {
    var rrnChecksum = int.parse(rrn.substring(9, 11));

    var partToCalculate = rrn.substring(0, 9);
    var rrnInt = int.parse(partToCalculate);

    var checksum = 97 - (rrnInt % 97);

    final yearString = rrn.substring(0, 2);
    final monthString = rrn.substring(2, 4);
    final dayString = rrn.substring(4, 6);

    if (rrnChecksum == checksum) {
      // Pre-2000
      return DateTime(int.parse(yearString) + 1900, int.parse(monthString),
          int.parse(dayString));
    }

    partToCalculate = "2$partToCalculate";
    rrnInt = int.parse(partToCalculate);
    checksum = 97 - (rrnInt % 97);

    if (rrnChecksum == checksum) {
      // Post-2000
      return DateTime(int.parse(yearString) + 2000, int.parse(monthString),
          int.parse(dayString));
    } else {
      // invalid number, even after 2000 check
      return null;
    }
  }
}
