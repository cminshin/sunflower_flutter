import 'dart:io';

void saveLogToFile(String err) async {
  final file = File('show_logs.txt');
  await file.writeAsString(err, mode: FileMode.append);
}
