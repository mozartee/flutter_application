import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/example/task_app/calendar/controller.dart';
import 'package:ost_digital_application/page/example/task_app/home/data.dart';
import 'package:table_calendar/table_calendar.dart';

import '../add_task/data.dart';

class TaskCalendarPage extends StatelessWidget {
  TaskCalendarPage({super.key});

  final TaskCalendarController controller = Get.put(TaskCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskAppBarBackground,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 20,
        title: Text(
          'Calendar',
          style: Get.theme.textTheme.headline5!
              .copyWith(fontWeight: FontWeight.w900),
        ),
      ),
      body: GetBuilder<TaskCalendarController>(
        init: controller,
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: taskAppBarBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TableCalendar(
                    focusedDay: controller.focusedDay,
                    firstDay: DateTime.utc(2021),
                    lastDay: DateTime.utc(2999),
                    headerVisible: false,
                    calendarFormat: CalendarFormat.week,
                    selectedDayPredicate: (day) =>
                        controller.selectedDayPredicate(day),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onDaySelected: (selectedDay, focusedDay) =>
                        controller.onDaySelected(selectedDay, focusedDay),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _TaskCalendarItem(
                      isLatest: index == 0,
                      timeline: '11:00am',
                      subject: 'Standup',
                      hours: '30 min',
                      content: 'Every day metting',
                    );
                  },
                  itemCount: 6,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TaskCalendarItem extends StatelessWidget {
  const _TaskCalendarItem({
    Key? key,
    this.isLatest = false,
    required this.timeline,
    required this.subject,
    required this.hours,
    required this.content,
  }) : super(key: key);

  final bool? isLatest;
  final String timeline;
  final String subject;
  final String hours;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 60,
              child: Text(
                timeline,
                style: Get.theme.textTheme.labelSmall,
                textAlign: TextAlign.center,
              )),
          Column(
            children: [
              Container(
                width: isLatest == true ? 14 : 8,
                height: isLatest == true ? 14 : 8,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: isLatest == true ? Colors.black : Colors.black26,
                ),
                child: Center(
                  child: Container(
                    width: isLatest == true ? 8 : 0,
                    height: isLatest == true ? 8 : 0,
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color:
                          isLatest == true ? Colors.white : Colors.transparent,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                // height: 80,
                // height: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 50),
                color: isLatest == true ? Colors.black : Colors.black26,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            // margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: isLatest == true ? Colors.black : taskYellow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      subject,
                      style: Get.theme.textTheme.bodyMedium!.copyWith(
                          color:
                              isLatest == true ? Colors.white : Colors.black),
                    ),
                    const SizedBox(width: 30),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 12,
                          color:
                              isLatest == true ? Colors.white : Colors.black,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          hours,
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: isLatest == true
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: Get.theme.textTheme.bodySmall!
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
