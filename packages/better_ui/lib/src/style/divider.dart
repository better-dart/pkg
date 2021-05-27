import 'package:flutter/material.dart';

///
/// 分割线:
///
Divider useDivider({
  Color color,
  double height,
  double indent,
  double endIndent,
  double thickness,
}) {
  return Divider(
    // 控制间隔高度: 原默认=16(过大)
    height: height ?? 0.0,
    thickness: thickness ?? 0.0,
    // 控制缩进距离:
    indent: indent ?? 0.0,
    endIndent: endIndent ?? 0.0,
    // 颜色:
    color: color,
  );
}
