/*
Convert Datetime weekday property to day of week stirng
*/

String convertToDayOfWeek(int number) {
  String dayOfWeek;
  switch (number) {
    case 4:
      dayOfWeek = 'thursday';
      break;
    case 5:
      dayOfWeek = 'friday';
      break;
    case 6:
      dayOfWeek = 'saturday';
      break;
    case 7:
      dayOfWeek = 'sunday';
      break;
    case 1:
      dayOfWeek = 'monday';
      break;
    case 2:
      dayOfWeek = 'tuesday';
      break;
    case 3:
      dayOfWeek = 'wednesday';
      break;

    default:
      dayOfWeek = 'sunday';
  }
  return dayOfWeek;
}
