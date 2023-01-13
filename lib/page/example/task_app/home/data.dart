import 'package:flutter/material.dart';

final List<Map<String, dynamic>> filterList = [
  {
    'title': 'To do',
    'selected': true,
  },
  {
    'title': 'In process',
    'selected': false,
  },
  {
    'title': 'Done',
    'selected': false,
  },
];

Color? taskGreen = Colors.green[200];
Color? taskYellow = Colors.yellow[200];
Color? taskPurple = Colors.deepPurple[100];

final List<Map<String, dynamic>> list = [
  {
    'background': taskGreen,
    'title': 'To do',
    'type': 'Asap',
    'work_type': '#UI design',
    'date': 'Sep 17 - 19',
    'assign_to': 'a,b,c'
  },
  {
    'background': taskYellow,
    'title': 'Brand guide',
    'type': 'Medium',
    'work_type': '#graphic design',
    'date': 'Sep 18 - 20',
    'assign_to': 'a'
  },
  {
    'background': taskPurple,
    'title': 'Kickoff meeting',
    'type': 'Low',
    'work_type': '#projectmanagment',
    'date': 'Sep 21',
    'assign_to': 'a,b'
  },
];
