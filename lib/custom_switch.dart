import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({
    Key? key,
    this.width = 120,
    this.height = 50,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.buttonColor = Colors.white,
    this.onChanged,
    this.value = false,
  }) : super(key: key);

  final double width;
  final double height;

  /// 打开时的颜色
  final Color activeColor;

  /// 关闭时的颜色
  final Color inactiveColor;

  ///  按钮颜色
  final Color buttonColor;
  final ValueChanged<bool>? onChanged;

  final bool value;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late bool value;
  late double paddingValue;

  late double diameter;
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    value = widget.value;
    paddingValue = widget.height / 12;
    diameter = widget.height - 2 * paddingValue;

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _animation = Tween<Alignment>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
        value = !value;
        widget.onChanged?.call(value);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: value ? widget.activeColor : widget.inactiveColor,
              borderRadius: BorderRadius.circular(widget.height / 2),
            ),
            padding: EdgeInsets.all(paddingValue),
            child: Align(
              alignment: _animation.value,
              child: Container(
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.buttonColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
