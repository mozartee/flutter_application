import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/example/task_app/home/data.dart';

import 'data.dart';

class TaskAddPage extends StatelessWidget {
  const TaskAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F5),
        title: Text(
          'Add new task',
          style: Get.theme.textTheme.bodyLarge,
        ),
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildListView()),
          _buildButton(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F4F5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Faster Pay',
            style: Get.theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          SizedBox(
            height: 30,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(horizontal: 6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Asap',
                    style: Get.theme.textTheme.bodyMedium,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Get.theme.textTheme.bodyMedium!.color,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Task name',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assigned to',
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 18,
                        ),
                        label: Text(
                          'Add',
                          style: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: assignList
                        .map((e) => Chip(
                              backgroundColor: taskAddGreen,
                              label: Text(e),
                              deleteIcon: const Icon(
                                Icons.clear,
                                size: 14,
                                color: Colors.grey,
                              ),
                              onDeleted: () {},
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timeline',
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Wrap(
                    children: [
                      Chip(
                        backgroundColor: taskAddYellow,
                        label: const Text('Nov 18 - 19'),
                        deleteIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                        ),
                        onDeleted: () {},
                      ),
                      const SizedBox(width: 10),
                      Chip(
                        backgroundColor: taskAddYellow,
                        label: const Text('12 hrs'),
                        deleteIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                        ),
                        onDeleted: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Descriptions',
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Edit',
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ))
                    ],
                  ),
                  const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText:
                          'Create a set of standards for design and code along with components that unify both practice',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attachments',
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildButton() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Add task'),
      ),
    );
  }
}
