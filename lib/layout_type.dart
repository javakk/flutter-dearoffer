import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  home,
  teachin,
  mine,
  search
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.home:
      return '首页';
    case LayoutType.teachin:
      return '宣讲会';
    case LayoutType.search:
      return '搜索';
    case LayoutType.mine:
      return '我的';
    default:
      return '';
  }
}