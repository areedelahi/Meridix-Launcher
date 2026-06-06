import 'dart:io';

void main() async {
  const path =
      '/Users/areedelahi/Library/Application Support/com.example.liquidLauncher/instances';
  final p = Process.runSync('open', [path]);
  print(p.stdout);
  print(p.stderr);
}
