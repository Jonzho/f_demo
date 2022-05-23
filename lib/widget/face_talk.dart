import 'package:flutter/material.dart';


class FaceTalkWidget extends StatefulWidget {
  final String str;

  FaceTalkWidget(this.str, {Key? key}) : super(key: key);

  @override
  _FaceTalkWidgetState createState() => _FaceTalkWidgetState();
}

class _FaceTalkWidgetState extends State<FaceTalkWidget> {
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
        Future.delayed(const Duration(milliseconds: 150), () {
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
      maxLines: null,
      minLines: 1,
      style: TextStyle(color: Colors.black54),
    );
  }
}