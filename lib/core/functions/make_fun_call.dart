// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:url_launcher/url_launcher.dart';

makePhoneCall({required String phoneNumber}) async {
  final Uri _url = Uri.parse('tel:$phoneNumber');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
