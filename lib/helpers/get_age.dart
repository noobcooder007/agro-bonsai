class Utils {
  static int calculateYears(DateTime birthday) {
    if (birthday.month <= DateTime.now().month) {
      if (birthday.day <= DateTime.now().day) {
        return DateTime.now().year - birthday.year;
      }
    }
    return DateTime.now().year - birthday.year - 1;
  }
}
