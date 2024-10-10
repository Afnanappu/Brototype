import 'package:url_launcher/url_launcher.dart';

void makeHelpAndSupport({
  required String path,
  bool isTel = true,
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  final String subject = Uri.encodeComponent('Asking support for Inventory management app');
  Uri uri = Uri(
    scheme: isTel == true ? 'tel' : 'mailto',
    path: path,
    query: 'subject=$subject'
  );
  print('Generated URI: $uri');

  await launchUrl(uri, mode: mode);
}
