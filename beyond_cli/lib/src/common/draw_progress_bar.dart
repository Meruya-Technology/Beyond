import 'dart:io';

void drawProgressBar(double amount, int size) {
  final limit = (size * amount).toInt();
  final chars = String.fromCharCodes(
    List.generate(size, (int index) => (index < limit) ? 0x2593 : 0x2591),
  );
  stdout.write(
    '\r\x1b[38;5;75;51m$chars\x1b[0m',
  );
}
