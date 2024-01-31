class Utils {
  static String calculateDifference(DateTime date) {
    final differenceInDays = DateTime.now().difference(date).inDays;
    final years = (differenceInDays / 365);
    final months = (differenceInDays % 365) / 30;
    final days =
        differenceInDays - (years.floor() * 365) - (months.floor() * 30);
    if (years.floor() == 0) {
      if (months.floor() == 0) {
        if (days.floor() == 0) {
          return '';
        } else {
          return '${days.floor()} día(s)';
        }
      } else {
        return '${months.floor()} mes(es), ${days.floor()} día(s)';
      }
    } else {
      return '${years.floor()} año(s), ${months.floor()} mes(es), ${days.floor()} día(s)';
    }
  }
}
