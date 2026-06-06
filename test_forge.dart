import 'package:liquid_launcher/src/rust/api/metadata.dart';
import 'package:liquid_launcher/src/rust/frb_generated.dart';

void main() async {
  await RustLib.init();
  try {
    final versions = await getForgeVersions();
    print("Forge versions: ${versions.length}");
  } catch (e) {
    print("Forge Error: $e");
  }
}
