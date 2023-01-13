import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/help/assets.dart';

class TaskProjectPage extends StatefulWidget {
  const TaskProjectPage({super.key});

  @override
  State<TaskProjectPage> createState() => _TaskProjectPageState();
}

class _TaskProjectPageState extends State<TaskProjectPage> {
  final List<Map<String, dynamic>> _filterList = [
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

  final List<Map<String, dynamic>> _list = [
    {
      'background': Colors.green[200],
      'title': 'To do',
      'type': 'Asap',
      'work_type': '#UI design',
      'date': 'Sep 17 - 19',
      'assign_to': 'a,b,c'
    },
    {
      'background': Colors.yellow[200],
      'title': 'Brand guide',
      'type': 'Medium',
      'work_type': '#graphic design',
      'date': 'Sep 18 - 20',
      'assign_to': 'a'
    },
    {
      'background': Colors.deepPurple[100],
      'title': 'Kickoff meeting',
      'type': 'Low',
      'work_type': '#projectmanagment',
      'date': 'Sep 21',
      'assign_to': 'a,b'
    },
  ];

  _onPressed(int index) {
    for (var element in _filterList) {
      element['selected'] = false;
      var selectedElement = _filterList[index];
      selectedElement['selected'] = true;
    }
    setState(() {});
  }

  _onTap(Map<String, dynamic> card) {}

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildWrap()),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            ((context, index) {
              var card = _list[index];
              return TaskProjectCard(
                card: card,
                onTap: (card) => _onTap(card),
              );
            }),
            childCount: _list.length,
          ),
        ),
      ],
    );
  }

  _buildWrap() => Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 10,
          children: _filterList.map((e) {
            bool selected = e['selected'];
            return SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () => _onPressed(_filterList.indexOf(e)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      selected ? const Color(0xFF212121) : Colors.white),
                  side: MaterialStateProperty.resolveWith(
                      (states) => const BorderSide()),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    e['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : const Color(0xFF212121),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
}

class TaskProjectCard extends StatelessWidget {
  const TaskProjectCard({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);

  final Map<String, dynamic> card;
  final ValueChanged<Map<String, dynamic>>? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: card['background'],
      ),
      child: InkWell(
        onTap: () => onTap!(card),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card['title'],
                  style: Get.theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                Chip(
                  label: Text(card['type']),
                  backgroundColor: Colors.white,
                  side: const BorderSide(),
                ),
              ],
            ),
            Row(children: [
              Text(
                card['work_type'],
                style: Get.theme.textTheme.bodyMedium!
                    .copyWith(color: const Color(0xFF666666)),
              ),
            ]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.solidClock, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      card['date'],
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipOval(
                      child: Assets.loadImage('GuLu-01', width: 40, height: 40),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
