import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/help/assets.dart';
import 'package:ost_digital_application/common/utils/gap.dart';
import 'package:ost_digital_application/page/mine/controller.dart';

class BodyView extends GetView<MineController> {
  const BodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      builder: (_) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            controller: controller.scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                Gap.h.dp10,
                _buildText(),
                Gap.h.dp10,
                _buildBody(),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildHeader() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _buildIcon(),
          Gap.h.dp16,
          Text(
            'Raffialdo Bay',
            style: Get.theme.textTheme.headline5,
          ),
          Gap.h.dp10,
          const Text('UI/UX Designer'),
          Gap.h.dp20,
          controller.profileCompleted
              ? Container()
              : _buildTile(
                  leading: Icons.warning_outlined,
                  title: 'Please complete your profile first',
                  color: const Color(0xFFF85871),
                  background: const Color(0xFFFCD9DE)),
        ],
      ),
    );
  }

  Stack _buildIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 71,
          height: 71,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black45),
          ),
        ),
        SizedBox(
          width: 64,
          height: 64,
          child: ClipOval(child: Assets.loadImage('GuLu-01')),
        ),
      ],
    );
  }

  _buildText() {
    return Text(
      'Options',
      style: Get.theme.textTheme.subtitle1,
    );
  }

  _buildBody() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildTile(
          leading: Icons.person_pin,
          title: 'Edit Profile',
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () => controller.onChangeEditProfile(),
        ),
        _buildTile(
          leading: Icons.webhook_rounded,
          title: 'Find Job',
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () => controller.onChangeEditSport(),
        ),
        _buildTile(
          leading: Icons.apple,
          title: 'My Application',
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () => controller.onTapApplications(),
        ),
        _buildTile(
          leading: Icons.notifications,
          title: 'Notification Settings',
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () => controller.onTapNotifications(),
        ),
        _buildTile(
          leading: Icons.logout_outlined,
          title: 'Logout',
          color: const Color(0xFFF85871),
          onTap: () => controller.logout(),
        ),
      ],
    );
  }

  _buildTile({
    IconData? leading,
    String? title,
    Color? color,
    Icon? trailing,
    Color? background,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          tileColor: background ?? const Color(0xFFF4F7FD),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Icon(leading, color: color),
          trailing: trailing,
          title: Transform(
            transform: Matrix4.translationValues(-20, 0, 0),
            child: Text(title ?? '', style: TextStyle(color: color)),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
