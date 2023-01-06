import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/entity/job.dart';
import 'package:ost_digital_application/page/demo/data.dart';
import 'package:ost_digital_application/page/demo/jobsearch_view.dart';

import 'jobdetail_view.dart';

const String chooseJobControllerTag = 'choose';
const String jobDetailControllerTag = 'jobDetail';

class DemoController extends GetxController {
  late List<JobEntity> typeList;
  bool choosedType = false;
  List<JobEntity> choosedTypeList = [];

  late List<JobEntity> jobList;

  changeBoxChoosed(int index) {
    JobEntity entity = typeList[index];
    entity.choosed = entity.choosed == true ? false : true;
    typeList[index] = entity;
    if (entity.choosed == true) {
      choosedTypeList.add(entity);
    } else {
      choosedTypeList.removeWhere((element) => element.id == entity.id);
    }
    choosedType = choosedTypeList.isNotEmpty;
    update();
  }

  findJob() {
    if (!choosedType) {
      return;
    }
    Get.to(const JobSearchPage(), arguments: choosedTypeList);
  }

  onTapTile(int index) {
    debugPrint(index.toString());
    JobEntity entity = jobList[index];
    Get.to(JobDetailPage(), arguments: entity);
    update();
  }

  onTapBookmark(int index) {
    JobEntity entity = jobList[index];
    entity.choosed = entity.choosed == true ? false : true;
    jobList.removeAt(index);
    jobList.insert(index, entity);
    update();
  }

  @override
  void onInit() {
    typeList = types.map((e) => JobEntity.fromJson(e)).toList();
    jobList = jobs.map((e) => JobEntity.fromJson(e)).toList();

    super.onInit();
  }
}
