import 'package:url_launcher/url_launcher.dart';

class UtilService {
  //open the url in the browser
  static Future<void> launchInAppBrowser(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
