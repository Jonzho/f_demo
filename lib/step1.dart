import 'dart:math';

import 'package:Prelude/resouce/colors.dart';
import 'package:Prelude/step1_controller.dart';
import 'package:Prelude/utils/Adapt.dart';
import 'package:Prelude/widget/face_talk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class Step1Page extends GetView<Step1Controller> {
  Step1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MColors.c_ffb43d,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: _bodyView(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _talkView(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: _buttonView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyView() {
    return GetBuilder<Step1Controller>(
      id: "body",
      builder: (logic) {
        return Container(
          height: Adapt.screenH() * 2 / 3,
          child: Row(
            children: [
              if (controller.state != 2)
                Expanded(
                  child: Image(
                    image: AssetImage("image/he.png"),
                    width: 100,
                  ),
                ),
              if (controller.state != 0)
                Expanded(
                    child: Image(
                      image: AssetImage("image/her.png"),
                      width: 100,
                    )),
            ],
          ),
        );
      },
    );
  }

  Widget _talkView() {
    return GetBuilder<Step1Controller>(
      id: "talk",
      builder: (logic) {
        return Container(
          height: Adapt.screenH() / 3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                child: Text("${logic.who == 0 ? "" : logic.who == 1
                    ? "zo："
                    : "wingwing："}"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: FaceTalkWidget(logic.context, key: UniqueKey(),),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buttonView() {
    return GetBuilder<Step1Controller>(
      assignId: true,
      id: 'btn',
      builder: (logic) {
        return Container(
          margin: EdgeInsets.all(25.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (logic.bState == 0)
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.talk();
                  },
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.navigate_next,
                    color: Colors.blue,
                  ),
                ),
              if (logic.bState == 1)
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.talk(chance: false);
                  },
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.clear,
                    color: Colors.blue,
                  ),
                ),
              if (logic.bState == 1)
                const SizedBox(width: 15,),
              if (logic.bState == 1)
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.talk(chance: true);
                  },
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.check,
                    color: Colors.blue,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
