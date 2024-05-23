import 'package:file_saver/file_saver.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

Future<void> downloadCV() async {
  const url =
      'https://drive.google.com/file/d/1XC_XzF6AAERzypCnjbfMmjMOfm1Ui7zv/view?usp=sharing';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    const fileName = 'CV_DenisGrudinin_Flutter.pdf';
    final fileBytes = response.bodyBytes;

    FileSaver.instance.saveFile(
      name: fileName,
      bytes: fileBytes,
      mimeType: MimeType.pdf,
    );
  } else {}
}

Future<void> launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
