import 'package:flutter/material.dart';

class TopBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 480;
    final double _yScaling = size.height / 854;
    path.lineTo(0.5 * _xScaling, 258.90999999999997 * _yScaling);
    path.cubicTo(
      0.5 * _xScaling,
      258.90999999999997 * _yScaling,
      95.167 * _xScaling,
      257.577 * _yScaling,
      116.5 * _xScaling,
      169.57699999999997 * _yScaling,
    );
    path.cubicTo(
      137.833 * _xScaling,
      81.57699999999997 * _yScaling,
      193.833 * _xScaling,
      79.57699999999997 * _yScaling,
      264.5 * _xScaling,
      92.24399999999997 * _yScaling,
    );
    path.cubicTo(
      335.16700000000003 * _xScaling,
      104.91099999999997 * _yScaling,
      393.167 * _xScaling,
      57.576 * _yScaling,
      403.167 * _xScaling,
      1.5759999999999998 * _yScaling,
    );
    path.cubicTo(
      403.833 * _xScaling,
      2.243 * _yScaling,
      0.5 * _xScaling,
      1.5759999999999998 * _yScaling,
      0.5 * _xScaling,
      1.5759999999999998 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      1.5759999999999998 * _yScaling,
      0.5 * _xScaling,
      258.90999999999997 * _yScaling,
      0.5 * _xScaling,
      258.90999999999997 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 480;
    final double _yScaling = size.height / 854;
    path.lineTo(433.69100000000003 * _xScaling, 0.6730000000000018 * _yScaling);
    path.cubicTo(
      433.69100000000003 * _xScaling,
      0.6730000000000018 * _yScaling,
      433.69100000000003 * _xScaling,
      258.673 * _yScaling,
      433.69100000000003 * _xScaling,
      258.673 * _yScaling,
    );
    path.cubicTo(
      433.69100000000003 * _xScaling,
      258.673 * _yScaling,
      0.6910000000000025 * _xScaling,
      258.673 * _yScaling,
      0.6910000000000025 * _xScaling,
      258.673 * _yScaling,
    );
    path.cubicTo(
      0.6910000000000025 * _xScaling,
      258.673 * _yScaling,
      30.691000000000003 * _xScaling,
      167.673 * _yScaling,
      158.691 * _xScaling,
      198.673 * _yScaling,
    );
    path.cubicTo(
      286.69100000000003 * _xScaling,
      229.673 * _yScaling,
      305.69100000000003 * _xScaling,
      121.673 * _yScaling,
      307.69100000000003 * _xScaling,
      112.673 * _yScaling,
    );
    path.cubicTo(
      309.69100000000003 * _xScaling,
      103.673 * _yScaling,
      329.69100000000003 * _xScaling,
      -4.326999999999998 * _yScaling,
      433.69100000000003 * _xScaling,
      0.6730000000000018 * _yScaling,
    );
    path.cubicTo(
      433.69100000000003 * _xScaling,
      0.6730000000000018 * _yScaling,
      433.69100000000003 * _xScaling,
      0.6730000000000018 * _yScaling,
      433.69100000000003 * _xScaling,
      0.6730000000000018 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
