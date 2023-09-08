import 'package:url_launcher/url_launcher.dart';

class Launcher {
  Future<void> sendMail(String name, String emailSubject, String body) async {
    final String subject = 'From $name:$emailSubject';
    final String url =
        'mailto:${"lakshay6447@gmail.com"}?subject=$subject&body=$body';
    await launchUrl(Uri.parse(url));
  }

  Future<void> openSocials(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
