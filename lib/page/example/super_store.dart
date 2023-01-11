import 'dart:math';

import 'package:flutter/material.dart';

class SuperStorePage extends StatelessWidget {
  const SuperStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    bool flip = _animation.value <= 0.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Card'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Horizontal Flipping
              Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0015)
                  ..rotateY(pi * _animation.value),
                child: Card(
                  child: Container(
                    color: Colors.deepOrange,
                    width: 240,
                    height: 300,
                    child: flip
                        ? const Center(
                            child: Text(
                              '?',
                              style:
                                  TextStyle(fontSize: 100, color: Colors.white),
                            ),
                          )
                        : Image.network(
                            'https://www.kindacode.com/wp-content/uploads/2021/09/girl.jpeg',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),

              const Spacer(),

              // Vertical Flipping
              Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0015)
                  ..rotateX(pi * _animation.value),
                child: Card(
                  child: Container(
                    color: Colors.deepPurple,
                    width: 240,
                    height: 300,
                    child: flip
                        ? const Center(
                            child: Text(
                              '?',
                              style:
                                  TextStyle(fontSize: 100, color: Colors.white),
                            ),
                          )
                        : RotatedBox(
                            quarterTurns: 2,
                            child: Image.network(
                              'https://www.kindacode.com/wp-content/uploads/2021/09/flower.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_status == AnimationStatus.dismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  },
                  child: Text('Reveal The Secrets'))
            ],
          ),
        ),
      ),
    );
  }
}
