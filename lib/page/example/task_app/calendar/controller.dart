import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ost_digital_application/common/utils/log.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskCalendarController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  selectedDayPredicate(day) {
    // debugLog('day is $day, selectedday is $selectedDay');
    return isSameDay(selectedDay, day);
  }

  onDaySelected(selectedDay, focusedDay) {
    debugLog('$selectedDay, $focusedDay');
    if (!isSameDay(selectedDay, this.selectedDay)) {
      focusedDay = focusedDay;
      selectedDay = selectedDay;
      update();
    }
  }
}
