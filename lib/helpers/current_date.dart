class CustomFormatDate {
  static final List<String> _months = [
    'enero',
    'febrero',
    'marzo',
    'abril',
    'mayo',
    'junio',
    'julio',
    'agosto',
    'septiembre',
    'octubre',
    'noviembre',
    'diciembre'
  ];
  static String parse(DateTime date) {
    if (date.weekday == DateTime.now().weekday) {
      if (date.day == DateTime.now().day) {
        return 'Hoy';
      }
      return '';
    } else {
      return '${date.day} de ${_months[date.month]} del ${date.year}';
    }
  }
}
