import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/utils/index.dart';
import 'package:ost_digital_application/common/widget/index.dart';

const Duration transitionDuration = Duration(milliseconds: 400);

void showCustomDialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: transitionDuration,
    pageBuilder: (_, __, ___) => _buildPageBuilder(_, __, ___, onValue),
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        child: child,
      );

      // Tween<double> tween = Tween(begin: 0.8, end: 1);
      // return ScaleTransition(
      //   scale: anim, //tween.animate(anim),
      //   child: child,
      // );
    },
  ).then(onValue);
}

_buildPageBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  ValueChanged onValue,
) {
  return Center(
    child: Stack(
      children: [
        _buildBody(onValue),
        Positioned(
          top: 16,
          right: 36,
          child: AvaterIconButton(
            border: false,
            child: const Icon(Icons.clear),
            onPressed: () {
              onValue(false);
              Get.back();
            },
          ),
        ),
      ],
    ),
  );
}

Container _buildBody(ValueChanged onValue) {
  return Container(
    height: 560,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.95),
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(0, 30),
          blurRadius: 60,
        ),
      ],
    ),
    child: Column(
      children: [
        const Text(
          "Sign in",
          style: TextStyle(
            fontSize: 34,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
            textAlign: TextAlign.center,
          ),
        ),
        Column(
          children: [
            OSTTextField(
              height: Constant.buttonHeight,
              hintText: 'account',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: OSTTextField(
                height: Constant.buttonHeight,
                hintText: 'password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    onValue(true);
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue[300];
                      }
                      return Colors.blue;
                    }),
                    shape: MaterialStateProperty.resolveWith((states) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10));
                    }),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "OR",
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Sign up with Email, Apple or Facebook",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AvaterIconButton(
              width: 64,
              height: 64,
              child: const Icon(Icons.email),
              onPressed: () {},
            ),
            AvaterIconButton(
              width: 64,
              height: 64,
              child: const Icon(Icons.apple),
              onPressed: () {},
            ),
            AvaterIconButton(
              width: 64,
              height: 64,
              child: const Icon(Icons.facebook),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}

class AvaterIconButton extends StatelessWidget {
  const AvaterIconButton({
    Key? key,
    this.width,
    this.height,
    this.border = true,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final double? width, height;
  final bool? border;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: Container(
            width: width,
            height: height,
            decoration: border == true
                ? const ShapeDecoration(
                    shape: CircleBorder(side: BorderSide()),
                  )
                : null,
            child: child,
          ),
        ),
      ),
    );
  }
}
