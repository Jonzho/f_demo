import 'dart:ui';

import 'package:f_demo/custom_switch.dart';
import 'package:f_demo/hero_animation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // player.setUrl("http://music.163.com/song/media/outer/url?id=464728263.mp3");
    _init();
  }

  Future<void> _init() async {
    try {
      await player.setAudioSource(AudioSource.uri(Uri.parse(
          "http://music.163.com/song/media/outer/url?id=464728263.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void _incrementCounter() {
    if (!animKey.currentState!.controller.isAnimating) {
      animKey.currentState?.controller.forward();
    } else {
      animKey.currentState?.controller.stop();
    }
    if (!player.playing) {
      player.play();
    } else {
      player.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: HearAnimationWidget(key: animKey),
          ),
          FaceTeakWidget("ashofagfnalfnsokhjfoiasjho"),
        ],
      ),
      // body: Center(child: CustomSwitch(),),
      // body: HeroAnimationRoute(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

GlobalKey<_HearAnimationWidgetState> animKey = GlobalKey();

class HearAnimationWidget extends StatefulWidget {
  const HearAnimationWidget({Key? key}) : super(key: key);

  @override
  _HearAnimationWidgetState createState() => _HearAnimationWidgetState();
}

class _HearAnimationWidgetState extends State<HearAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.easeOut,
    );

    animation.addListener(() {
      setState(() {});
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    animation = Tween(begin: 50.0, end: 120.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HeatAnimationWidgetItem(animation),
      // child: AnimatedBuilder(
      //   animation: animation,
      //   builder: (ctx, child) {
      //     return Icon(
      //       Icons.favorite,
      //       color: Colors.red,
      //       size: animation.value,
      //     );
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HeatAnimationWidgetItem extends AnimatedWidget {
  HeatAnimationWidgetItem(Animation animation, {Key? key})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable as Animation;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: animation.value,
    );
  }
}

class FaceTeakWidget extends StatefulWidget {
  final String str;

  FaceTeakWidget(this.str, {Key? key}) : super(key: key);

  @override
  _FaceTeakWidgetState createState() => _FaceTeakWidgetState();
}

class _FaceTeakWidgetState extends State<FaceTeakWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    start(widget.str);
  }

  var index = 0;

  void start(String str) {
    if (index != str.length) {
      setState(() {
        index++;
        controller.text = str.substring(0, index);
        Future.delayed(const Duration(milliseconds: 200), () {
          start(str);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: false,
      decoration: const InputDecoration(border: InputBorder.none),
    );
  }
}
