import 'package:flutter/material.dart';
import 'dart:ui';

/// @explain 屏幕宽高工具
/// @author zo.
/// @creat time 2022/1/22 15:43.
class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static final double _width = mediaQuery.size.width;
  static final double _height = mediaQuery.size.height;
  static final double _topbarH = mediaQuery.padding.top;
  static final double _botbarH = mediaQuery.padding.bottom;
  static final double _pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;
  static init(int number){
    int uiwidth = number is int ? number : 750;
    _ratio = _width / uiwidth;
  }
  static px(number){
    if(!(_ratio is double || _ratio is int)){Adapt.init(750);}
    return number * _ratio;
  }
  static onepx(){
    return 1/_pixelRatio;
  }
  static screenW(){
    return _width;
  }
  static screenH(){
    return _height;
  }
  static padTopH(){
    return _topbarH;
  }
  static padBotH(){
    return _botbarH;
  }
}