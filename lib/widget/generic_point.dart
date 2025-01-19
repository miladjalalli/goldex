import 'dart:math';
import 'dart:ui';

List<Offset> generatePoints({
  required Size size,
  required int count,
}) {
  final random = Random(42);
  final List<Offset> points = [];

  for (int i = 0; i < count; i++) {
    final x = random.nextDouble() * size.width;
    final y = random.nextDouble() * size.height / 2;
    points.add(Offset(x, y));
  }

  return points;
}
